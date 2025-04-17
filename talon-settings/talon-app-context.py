import json
import os
from talon import Context, Module, actions, ui, ctrl
from pathlib import Path
import subprocess

ctx = Context()
mod = Module()

ctx.matches = r"""
app: vscode
app: jetbrains
"""


@ctx.action_class("user")
class OverrideUserActions:
    def gpt_tools():
        """This will return a JSON string for the available tools"""
        current_file = ui.active_window().doc
        path = Path(current_file).resolve()
        folder = path.parent
        os.chdir(folder)

        git_repository_root = subprocess.run(
            [
                "git",
                "rev-parse",
                "--show-toplevel",
            ],
            cwd=folder,
            capture_output=True,
            text=True,
            check=True,
        ).stdout.strip()
        os.chdir(git_repository_root)
        available_tools = subprocess.run(
            [
                "/Users/tkma6d4/mac-dotfiles/bin/list-tools.sh",
            ],
            cwd=git_repository_root,
            capture_output=True,
            text=True,
            check=True,
            timeout=60,
        )
        print(
            f"The available_tools result is {available_tools.stdout} {available_tools.stderr}"
        )

        available_tools_array = json.loads(available_tools.stdout)["tools"]
        tools = [
            {
                "type": "function",
                "function": {
                    "name": tool["name"],
                    "description": tool["description"],
                    "parameters": {
                        "type": "object",
                        "properties": tool.get("inputSchema", {}).get("properties", {}),
                        "required": tool.get("inputSchema", {}).get("required", []),
                        "additionalProperties": False,
                    },
                },
            }
            for tool in available_tools_array
        ]

        return json.dumps(tools)

    def gpt_call_tool(tool_name: str, parameters: str):
        """Call a given tool by name and return the response"""
        current_file = ui.active_window().doc
        path = Path(current_file).resolve()
        folder = path.parent
        os.chdir(folder)
        git_repository_root = subprocess.run(
            [
                "git",
                "rev-parse",
                "--show-toplevel",
            ],
            cwd=folder,
            capture_output=True,
            text=True,
            check=True,
        ).stdout.strip()

        os.chdir(git_repository_root)
        tool_call_result = subprocess.run(
            ["/Users/tkma6d4/mac-dotfiles/bin/run-tool.sh", tool_name, parameters],
            cwd=git_repository_root,
            capture_output=True,
            text=True,
            check=True,
        )
        print(
            f"The tool call result is {tool_call_result.stdout} {tool_call_result.stderr}"
        )
        return tool_call_result.stdout

    def gpt_additional_user_context():
        """This is an override function that can be used to add additional context to the prompt"""
        current_file = ui.active_window().doc
        path = Path(current_file).resolve()
        folder = path.parent
        os.chdir(folder)
        git_root = subprocess.run(
            ["git", "rev-parse", "--show-toplevel"],
            cwd=folder,
            capture_output=True,
            text=True,
            check=True,
        ).stdout.strip()
        return [
            "The current file is",
            current_file,
            "The repository root is",
            git_root,
            "If you are asked about any symbols, you should look them up.",
        ]
