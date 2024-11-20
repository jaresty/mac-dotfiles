from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: jetbrains
"""


@ctx.action_class("user")
class UserActions:
    def fold_more():
        actions.user.idea("action CollapseRegion")

    def fold_less():
        actions.user.idea("action ExpandRegion")
