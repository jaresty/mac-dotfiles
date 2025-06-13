from talon import Context, Module

ctx = Context()
mod = Module()


@mod.action_class
class Actions:
    def patch_forward():
        """Navigate forward to the next diff"""

    def patch_back():
        """Navigate backward to the next diff"""
