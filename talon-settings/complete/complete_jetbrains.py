from talon import Context, Module, actions

ctx = Context()
mod = Module()


ctx.matches = r"""
app: jetbrains
"""


@ctx.action_class("user")
class UserActions:
    def complete(words: list[str]):
        last_word = words.pop()
        for word in words:
            actions.insert(word)
            actions.user.idea("action CodeCompletion")
            actions.sleep("300ms")

            actions.key("enter .")
        actions.insert(last_word)
        actions.sleep("300ms")

        actions.key("enter")
