from talon import Context, Module, actions
from .buzz_helpers import command_index

ctx = Context()
mod = Module()


ctx.matches = r"""
app: jetbrains
"""


def complete():
    actions.key("ctrl-space")


def quick_fix():
    actions.key("alt-enter")


def refactor():
    actions.key("ctrl-t")


buzz_functions = [complete, quick_fix, refactor]


@ctx.action_class("user")
class UserActions:
    def buzz():
        current_index = command_index() - 1
        next_index = current_index % len(buzz_functions)
        if current_index > 0:
            actions.key("escape")
        buzz_functions[next_index]()
