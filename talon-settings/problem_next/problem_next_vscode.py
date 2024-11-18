from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: vscode
"""


@ctx.action_class("user")
class UserActions:
    def problem_next():
        actions.user.vscode("editor.action.marker.nextInFiles")

    def problem_last():
        actions.user.vscode("editor.action.marker.prevInFiles")
