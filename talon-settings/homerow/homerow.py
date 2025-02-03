from talon import Context, Module, actions

ctx = Context()
mod = Module()

mod.tag("homerow_search")


@ctx.action_class("user")
class UserActions:
    def homerow_search():
        actions.key("cmd-shift-ctrl-alt-s")
        ctx.tags = ["user.homerow_search"]

    def homerow_click():
        actions.key("enter")
        ctx.tags = []

    def homerow_scroll_search():
        actions.key("cmd-shift-j")
        ctx.tags = ["user.homerow_search"]

    def homerow_righty():
        actions.key("shift-enter")
        ctx.tags = []

    def homerow_info():
        actions.key("?")

    def homerow_duke():
        actions.key("enter")
        actions.key("enter")
        ctx.tags = []

    def homerow_cancel():
        actions.key("escape")
        ctx.tags = []


@mod.action_class
class Actions:
    def homerow_search():
        """Search in Homerow"""

    def homerow_scroll_search():
        """Search scrollbars in Homerow"""

    def homerow_click():
        """Click a home row item"""

    def homerow_righty():
        """Right click a home row item"""

    def homerow_duke():
        """Doubleclick a home row item"""

    def homerow_info():
        """Get info on an element"""

    def homerow_cancel():
        """Cancel the homerow search"""
