from talon import Context, Module, actions

ctx = Context()
mod = Module()


@ctx.action_class("user")
class UserActions:
    def select_last_paste():
        for _ in actions.clip.text():
            actions.edit.extend_left()


@mod.action_class
class Actions:
    def select_last_paste():
        """Select last paste"""
