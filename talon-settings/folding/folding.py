from talon import Context, Module

ctx = Context()
mod = Module()


@mod.action_class
class Actions:
    def fold_more():
        """Increase the level of folding"""

    def fold_less():
        """Decrease the level of folding"""

    def unfold_recursively():
        """Unfold this all the way"""
