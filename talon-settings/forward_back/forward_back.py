from talon import Context, Module

ctx = Context()
mod = Module()


@mod.action_class
class Actions:
    def go_forward():
        """Navigate forward"""

    def go_backward():
        """Navigate backward"""
