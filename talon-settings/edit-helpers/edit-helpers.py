from talon import Context, Module, actions, cron

ctx = Context()
mod = Module()

key_repeat_job = None


def start_pressing_key(interval: str, key: str):
    global key_repeat_job

    def curry_press_key(key):
        def press_key():
            return actions.key(key)

        return press_key

    key_repeat_job = cron.interval(interval, curry_press_key(key))


def stop_pressing_key():
    global key_repeat_job
    if key_repeat_job:
        cron.cancel(key_repeat_job)


@mod.action_class
class Actions:
    def select_paste():
        """Select last paste"""
        lines = actions.clip.text().split("\n")
        for _ in lines[:-1]:
            actions.edit.extend_up()
        actions.edit.extend_line_end()
        for _ in lines[0]:
            actions.edit.extend_left()

    def paste_select():
        """Paste and select"""
        actions.user.paste(actions.clip.text())
        lines = actions.clip.text().split("\n")
        for _ in lines[:-1]:
            actions.edit.extend_up()
        actions.edit.extend_line_end()
        for _ in lines[0]:
            actions.edit.extend_left()

    def set_select_direction_right():
        """Make it so the selection is going to the right"""
        selected_text = actions.edit.selected_text()
        actions.edit.left()
        for _ in selected_text:
            actions.edit.extend_right()

    def set_select_direction_left():
        """Make it so the selection is going to the left"""
        selected_text = actions.edit.selected_text()
        actions.edit.right()
        for _ in selected_text:
            actions.edit.extend_left()

    def start_moving(direction: str):
        """Start moving continuously"""
        start_pressing_key("100ms", direction)

    def stop_moving():
        """Stop moving continuously"""
        stop_pressing_key()
