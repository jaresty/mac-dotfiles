from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
tag: terminal
"""


@ctx.action_class("user")
class UserActions:
    def complete(words: list[str]):
        """Insert each of these words completing them as you go"""
        for word in words:
            actions.insert(word)
            actions.key("tab ctrl-n")
