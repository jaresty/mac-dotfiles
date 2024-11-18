from talon import Context, Module

ctx = Context()
mod = Module()


@mod.action_class
class Actions:
    def problem_next():
        """Go to the next problem"""

    def problem_last():
        """Go to the previous problem"""
