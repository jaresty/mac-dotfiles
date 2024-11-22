from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: vscode
"""


@ctx.action_class("user")
class UserActions:
    def go_forward():
        actions.user.vscode("workbench.action.navigateForward")

    def go_back():
        actions.user.vscode("workbench.action.navigateBack")
