from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: vscode
"""


@ctx.action_class("user")
class UserActions:
    def next_reference():
        actions.key("f12")

    def last_reference():
        actions.key("shift-f12")
