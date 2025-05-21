from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: vscode
"""


@ctx.action_class("user")
class UserActions:
    def tap_reference():
        actions.user.vscode("editor.action.peekDefinition")

    def next_reference():
        actions.key("shift-f12")

    def last_reference():
        actions.key("f12")
