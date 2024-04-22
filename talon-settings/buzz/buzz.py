from talon import Context, Module

ctx = Context()
mod = Module()


@mod.action_class
class Actions:
    def buzz():
        """Do the next most logical command"""
