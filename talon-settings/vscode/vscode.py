import os
from talon import Context, Module, actions, ui, ctrl
from pathlib import Path
import subprocess

ctx = Context()
mod = Module()

ctx.matches = r"""
app: vscode
"""


@ctx.action_class("user")
class OverrideUserActions:
    def gpt_additional_user_context():
        """This is an override function that can be used to add additional context to the prompt"""
        current_file = ui.active_window().doc
        path = Path(current_file).resolve()
        folder = path.parent
        os.chdir(folder)
        # I want this to set the result the git diff including any new  files as well
        current_git_diff = subprocess.run(
            ["git", "diff"], cwd=folder, capture_output=True, text=True, check=True
        )
        staged_git_diff = subprocess.run(
            ["git", "diff", "--staged"],
            cwd=folder,
            capture_output=True,
            text=True,
            check=True,
        )
        project_files = subprocess.run(
            ["git", "ls-files"],
            cwd=folder,
            capture_output=True,
            text=True,
            check=True,
        )
        return [
            f"The current git diff is:\n\n{current_git_diff.stdout}",
            f"The current staged git diff is:\n\n{staged_git_diff.stdout}",
            f"The output of git ls-files is:\n\n{project_files.stdout}",
        ]
