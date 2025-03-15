from talon import Context, Module, actions

ctx = Context()
mod = Module()


@mod.capture(
    rule="<user.formatted_prose> | <user.formatted_paste> | <user.last_phrase> | <user.cursorless_formatted>"
)
def spoken_search(m) -> str:
    if hasattr(m, "formatted_prose"):
        return m.formatted_prose
    elif hasattr(m, "formatted_paste"):
        return m.formatted_paste
    elif hasattr(m, "last_phrase"):
        return m.last_phrase
    elif hasattr(m, "cursorless_formatted"):
        return m.cursorless_formatted
    return ""


@mod.capture(rule="curse [<user.formatters>] <user.cursorless_target>")
def cursorless_formatted(m) -> str:
    target_text = actions.user.cursorless_get_text(m.cursorless_target)
    if hasattr(m, "formatters"):
        return actions.user.reformat_text(target_text, m.formatters)

    return target_text


@mod.capture(rule="<user.formatters> <user.prose>")
def formatted_prose(m) -> str:
    return actions.user.formatted_text(m.prose, m.formatters)


@mod.capture(rule="<user.formatters> paste")
def formatted_paste(m) -> str:
    return actions.user.reformat_text(actions.clip.text(), m.formatters)


@mod.capture(rule="echo")
def last_phrase(_) -> str:
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
