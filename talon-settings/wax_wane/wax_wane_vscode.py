from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: vscode
"""


@ctx.action_class("user")
class UserActions:
    def wax():
        actions.user.vscode("editor.action.smartSelect.expand")

    def wane():
        actions.user.vscode("editor.action.smartSelect.shrink")
