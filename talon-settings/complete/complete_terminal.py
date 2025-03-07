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
            actions.user.complete_from_start(word, 1)

    def complete_tap(prose: str = ""):
        actions.key("shift-tab")
        actions.user.insert_formatted(prose, "NO_SPACES")
        actions.sleep("100ms")

    def complete_from_start(leading_text: str = "", accept: int = 0):
        actions.user.insert_formatted(leading_text, "NO_SPACES")
        actions.key("tab")
        if accept == 1:
            actions.key("ctrl-n space")
