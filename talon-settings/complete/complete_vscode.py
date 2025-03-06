from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: vscode
and not tag: terminal
"""


@ctx.action_class("user")
class UserActions:
    def complete(words: list[str]):
        last_word = words.pop()
        for word in words:
            actions.user.vscode("editor.action.triggerSuggest")
            actions.insert(word)

            actions.sleep("300ms")

            actions.user.vscode("acceptSelectedSuggestion")
            actions.key(".")
        actions.insert(last_word)
        actions.user.vscode("editor.action.triggerSuggest")
        actions.sleep("300ms")

        actions.user.vscode("acceptSelectedSuggestion")

    def complete_tap(prose: str):
        actions.user.vscode("editor.action.triggerSuggest")
        actions.user.insert_formatted(prose or "", "NO_SPACES")
        actions.sleep("100ms")

    def complete_step(prose: str):
        actions.user.vscode("editor.action.triggerSuggest")
        actions.user.insert_formatted(prose or "", "NO_SPACES")
        actions.sleep("100ms")
        actions.user.vscode("acceptSelectedSuggestion")
