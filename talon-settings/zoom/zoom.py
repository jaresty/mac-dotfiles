from talon import Context, Module, ui, ctrl, actions

ctx = Context()
mod = Module()

ZOOM_BUNDLE_ID = "us.zoom.xos"


def zoom_app():
    if apps := ui.apps(bundle=ZOOM_BUNDLE_ID):
        return apps[0]
    return None


def toggle_video():
    if zoom := zoom_app():
        ctrl.key_press("v", super=True, shift=True, app=zoom)


def toggle_audio():
    if zoom := zoom_app():
        ctrl.key_press("f11", app=zoom)


def toggle_control():
    actions.key("cmd-alt-ctrl-h")
    # if zoom := zoom_app():
    # ctrl.key_press("h", super=True, alt=True, control=True)


def toggle_share():
    if zoom := zoom_app():
        ctrl.key_press("s", app=zoom, super=True, shift=True)


@ctx.action_class("user")
class UserActions:
    def toggle_video():
        toggle_video()

    def toggle_audio():
        toggle_audio()

    def toggle_share():
        toggle_share()

    def toggle_control():
        toggle_control()


@mod.action_class
class Actions:
    def toggle_video():
        """Toggle video in zoom"""

    def toggle_audio():
        """Toggle audio in zoom"""

    def toggle_control():
        """Toggle control in zoom"""

    def toggle_share():
        """Toggle share in zoom"""
