from talon import Context, Module

ctx = Context()
mod = Module()


@mod.action_class
class Actions:
    def next_reference():
        """Go to the next reference"""

    def last_reference():
        """Go to the last reference"""
