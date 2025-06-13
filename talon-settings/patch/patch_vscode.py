from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: vscode
"""


@ctx.action_class("user")
class UserActions:
    def patch_forward():
        actions.key("alt-f5")

    def patch_back():
        actions.key("shift-alt-f5")
