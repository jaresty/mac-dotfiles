from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: vscode
and not tag: terminal
"""


@ctx.action_class("user")
class UserActions:
    def complete(words: list[str] = []):
        last_word = words.pop()
        for word in words:
            actions.user.complete_from_start(word)
            actions.key(".")
        actions.user.complete_from_start(last_word)

    def complete_tap(prose: str = ""):
        actions.user.insert_formatted(prose, "NO_SPACES")
        actions.user.vscode("editor.action.triggerSuggest")

    def complete_from_start(leading_text: str = "", accept: int = 0):
        actions.user.complete_tap(leading_text)
        actions.sleep("300ms")
        actions.user.vscode("acceptSelectedSuggestion")
