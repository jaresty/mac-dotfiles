from talon import Context, Module

ctx = Context()
mod = Module()


@mod.action_class
class Actions:
    def complete():
        """Invoke auto completion"""

    def complete_backward():
        """Choose previous completion"""
