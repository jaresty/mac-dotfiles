from talon import Context, Module, actions

ctx = Context()
mod = Module()


@ctx.action_class("user")
class UserActions:
    def select_paste():
        lines = actions.clip.text().split("\n")
        for _ in lines[:-1]:
            actions.edit.extend_up()
        actions.edit.extend_line_end()
        for _ in lines[0]:
            actions.edit.extend_left()

    def paste_select():
        actions.user.paste(actions.clip.text())
        lines = actions.clip.text().split("\n")
        for _ in lines[:-1]:
            actions.edit.extend_up()
        actions.edit.extend_line_end()
        for _ in lines[0]:
            actions.edit.extend_left()


@mod.action_class
class Actions:
    def select_paste():
        """Select last paste"""

    def paste_select():
        """Paste and select"""

    def go_mid():
        """Go to the middle of the line"""
        actions.edit.select_line()
        half_line_length = int(len(actions.edit.selected_text()) / 2)
        actions.edit.left()
        for i in range(0, half_line_length):
            actions.edit.right()
