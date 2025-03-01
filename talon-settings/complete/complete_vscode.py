from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: vscode
"""


@ctx.action_class("user")
class UserActions:
    def complete():
        actions.key("tab")

    def complete_backward():
        actions.key("shift-tab")
