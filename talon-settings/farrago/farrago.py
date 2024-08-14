import random
from talon import Context, Module, actions, ui, ctrl

ctx = Context()
mod = Module()

FARRAGO_BUNDLE_ID = "com.rogueamoeba.farrago"


def farrago_app():
    if apps := ui.apps(bundle=FARRAGO_BUNDLE_ID):
        return apps[0]
    return None


def play_sound(board_number, sound_keys):
    if farrago := farrago_app():
        ctrl.key_press(f"{board_number}", super=True, app=farrago)
        chosen_option = random.choice(sound_keys)
        ctrl.key_press(chosen_option, app=farrago)


@ctx.action_class("user")
class UserActions:
    def play_victory():
        play_sound(4, ["z", "x", "a", "s", "d"])


@mod.action_class
class Actions:
    def play_victory():
        """Play a victorious sound"""
