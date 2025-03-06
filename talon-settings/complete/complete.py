from talon import Context, Module

ctx = Context()
mod = Module()


@mod.action_class
class Actions:
    def complete(words: list[str] = []):
        """Invoke auto completion for multiple words"""

    def complete_tap(prose: str):
        """Invoke auto completion for single word"""
