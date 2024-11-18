from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: jetbrains
"""


@ctx.action_class("user")
class UserActions:
    def problem_next():
        actions.user.idea("action GotoNextError")

    def problem_last():
        actions.user.idea("action GotoPreviousError")
