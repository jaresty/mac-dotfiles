import time
from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: vscode
"""


@ctx.action_class("user")
class UserActions:
    def completer(words: list[str]):
        last_word = words.pop()
        for word in words:
            actions.user.vscode("editor.action.triggerSuggest")
            actions.insert(word)

            actions.sleep("300ms")

            actions.key("tab .")
        actions.insert(last_word)
        actions.sleep("300ms")

        actions.key("tab")
