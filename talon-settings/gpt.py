from talon import Context, Module, actions

mod = Module()

ctx = Context()


@ctx.action_class("user")
class UserActions:
    def contextual_user_context():
        """This is an override function that can be used to add additional context to the prompt"""
        result = actions.user.talon_get_active_context()
        return [
            f"The following describes the currently focused application:\n\n{result}"
        ]
