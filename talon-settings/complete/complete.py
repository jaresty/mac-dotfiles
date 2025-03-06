from talon import Context, Module

ctx = Context()
mod = Module()


@mod.action_class
class Actions:
    def complete(words: list[str]):
        """Invoke auto completion for multiple words"""

    def complete_one(prose: str):
        """Invoke auto completion for single word"""

    def accept_completion():
        """Invoke auto completion for single word"""

    def complete_and_continue():
        """Insert the delimiter to chain completions"""
