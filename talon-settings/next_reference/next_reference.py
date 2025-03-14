from talon import Context, Module

ctx = Context()
mod = Module()


@mod.action_class
class Actions:
    def tap_reference():
        """Open a dialogue to look at the references of a symbol"""

    def next_reference():
        """Go to the next reference"""

    def last_reference():
        """Go to the last reference"""
