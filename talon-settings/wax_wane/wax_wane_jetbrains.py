from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: jetbrains
"""


@ctx.action_class("user")
class UserActions:
    def wax():
        actions.key("alt-up")

    def wane():
        actions.key("alt-down")
