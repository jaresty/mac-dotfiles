from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: jetbrains
"""


@ctx.action_class("user")
class UserActions:
    def complete():
        actions.user.idea("action HippieCompletion")

    def complete_backward():
        actions.user.idea("action HippieBackwardCompletion")
