from talon import Context, Module, actions

ctx = Context()
mod = Module()


@mod.capture(rule="say <user.prose> | echo")
def spoken_search(m) -> str:
    if hasattr(m, "prose"):
        return m.prose

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
