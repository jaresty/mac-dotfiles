from talon import Context, Module, actions

ctx = Context()
mod = Module()


@mod.capture(
    rule="{user.code_formatter} <user.prose> | {user.code_formatter} paste | echo"
)
def spoken_search(m) -> str:
    if hasattr(m, "prose"):
        return actions.user.formatted_text(m.prose, m.code_formatter)
    elif hasattr(m, "code_formatter"):
        return actions.user.reformat_text(actions.clip.text(), m.code_formatter)

    return actions.user.get_last_phrase()


@mod.action_class
class Actions:
    def push_keys(keys: list[str] = ["space"]):
        """Insert these keys one to the right of the cursor position"""
        for key in keys:
            actions.key(key)
        for key in keys:
            actions.edit.left()

    def repush_keys(keys: list[str] = ["space"]):
        """Insert these keys one to the left of the cursor position"""
        actions.edit.left()
        for key in keys:
            actions.key(key)
        for key in keys:
            actions.edit.right()

    def pusher_keys(keys: str = ""):
        """Insert these keys on the next line after the cursor position"""
        actions.key("enter")
        actions.key(keys)
        actions.edit.up()
        actions.edit.line_end()
