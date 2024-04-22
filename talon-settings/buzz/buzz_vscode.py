from talon import Context, Module, actions
from .buzz_helpers import command_index

ctx = Context()
mod = Module()


ctx.matches = r"""
app: vscode
"""


def complete():
    actions.user.vscode("editor.action.triggerSuggest")


def quick_fix():
    actions.user.vscode("editor.action.quickFix")


def refactor():
    actions.user.vscode("editor.action.refactor")


buzz_functions = [complete, quick_fix, refactor]


@ctx.action_class("user")
class UserActions:
    def buzz():
        current_index = command_index() - 1
        next_index = current_index % len(buzz_functions)
        if current_index > 0:
            actions.key("escape")
        buzz_functions[next_index]()
