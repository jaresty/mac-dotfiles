from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: jetbrains
"""


@ctx.action_class("user")
class UserActions:
    def next_reference():
        actions.key("ctrl-alt-down")

    def last_reference():
        actions.key("ctrl-alt-up")
