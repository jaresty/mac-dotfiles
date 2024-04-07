import logging
import random
from talon import Context, Module, actions

ctx = Context()
mod = Module()


def play_sound(board_number, sound_keys):
    actions.user.switcher_focus("Farrago")
    actions.key(f"cmd-{board_number}")
    actions.sleep("50ms")
    chosen_option = random.choice(sound_keys)
    actions.key(chosen_option)
    actions.user.switcher_focus_last()


@ctx.action_class("user")
class UserActions:
    def play_victory():
        play_sound(4, ["z", "x", "a", "s", "d"])


@mod.action_class
class Actions:
    def play_victory():
        """Play a victorious sound"""
