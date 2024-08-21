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
    def gpt_additional_user_context():
        """This is an override function that can be used to add additional context to the prompt"""
        current_file = ui.active_window().doc
        path = Path(current_file).resolve()
        folder = path.parent
        os.chdir(folder)
        current_git_diff = subprocess.run(
            ["git", "diff"], cwd=folder, capture_output=True, text=True, check=False
        )
        staged_git_diff = subprocess.run(
            ["git", "diff", "--staged"],
            cwd=folder,
            capture_output=True,
            text=True,
            check=False,
        )
        project_files = subprocess.run(
            ["git", "ls-files"],
            cwd=folder,
            capture_output=True,
            text=True,
            check=False,
        )
        git_root = subprocess.run(
            ["git", "rev-parse", "--show-toplevel"],
            cwd=folder,
            capture_output=True,
            text=True,
            check=False,
        )
        working_directory = git_root.stdout.strip()
        ctags_output = subprocess.run(
            ["make", "output_tags"],
            cwd=working_directory,
            capture_output=True,
            text=True,
            check=False,
        )
        return [
            "The current git diff is:",
            current_git_diff.stdout,
            "The current staged git diff is:",
            staged_git_diff.stdout,
            "The output of git ls-files is:",
            project_files.stdout,
            "The tags output is this:",
            ctags_output.stdout,
        ]
