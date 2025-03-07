from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: jetbrains
and not tag: terminal
"""


@ctx.action_class("user")
class UserActions:
    def complete(words: list[str] = []):
        last_word = words.pop()
        for word in words:
            actions.user.complete_from_start(word, 1)
            actions.key(".")
        actions.user.complete_from_start(last_word, 1)

    def complete_tap(prose: str):
        actions.user.complete_from_start(prose)

    def complete_from_start(leading_text: str = "", accept: int = 0):
        actions.user.insert_formatted(leading_text, "NO_SPACES")
        actions.user.idea("action CodeCompletion")
        if accept == 1:
            actions.key("tab")
