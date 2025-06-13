from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: jetbrains
"""


@ctx.action_class("user")
class UserActions:
    def patch_forward():
        actions.key("ctrl-shift-alt-down")

    def patch_back():
        actions.key("ctrl-shift-alt-up")
