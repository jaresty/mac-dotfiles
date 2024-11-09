from talon import Context, Module

ctx = Context()
mod = Module()


@mod.action_class
class Actions:
    def wax():
        """Expand the selection"""

    def wane():
        """Decrease the selection"""
