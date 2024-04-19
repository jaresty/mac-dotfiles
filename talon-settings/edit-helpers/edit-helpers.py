from talon import Context, Module, actions

ctx = Context()
mod = Module()


@ctx.action_class("user")
class UserActions:
    def select_paste():
        for _ in actions.clip.text():
            actions.edit.extend_left()

    def paste_select():
        actions.user.paste(actions.clip.text())
        for _ in actions.clip.text():
            actions.edit.extend_left()


@mod.action_class
class Actions:
    def select_paste():
        """Select last paste"""

    def paste_select():
        """Paste and select"""
