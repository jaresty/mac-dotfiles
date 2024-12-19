from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: vscode
"""


@ctx.action_class("user")
class UserActions:
    def fold_more():
        actions.user.vscode("editor.fold")

    def fold_less():
        actions.user.vscode("editor.unfold")

    def unfold_recursively():
        actions.user.vscode("editor.unfoldRecursively")
