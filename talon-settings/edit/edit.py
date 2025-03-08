from talon import Context, Module, actions

ctx = Context()
mod = Module()


@mod.action_class
class Actions:
    def push_keys(keys: list[str] = ["space"]):
        """Insert these keys one to the right of the cursor position"""
        actions.edit.right()
        for key in keys:
            actions.key(key)
        for key in keys:
            actions.edit.left()
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
        actions.edit.line_insert_down()
        actions.key(keys)
        actions.edit.up()
        actions.edit.line_end()
