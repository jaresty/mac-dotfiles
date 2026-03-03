from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: jetbrains
"""


@ctx.action_class("user")
class UserActions:
    def go_forward():
        actions.user.idea("action Forward")

    def go_back():
        actions.user.idea("action Back")
