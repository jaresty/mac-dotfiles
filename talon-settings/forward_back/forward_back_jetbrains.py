from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: vscode
"""


@ctx.action_class("user")
class UserActions:
    def go_forward():
        actions.user.idea("action Back")

    def go_back():
        actions.user.idea("action Forward")
