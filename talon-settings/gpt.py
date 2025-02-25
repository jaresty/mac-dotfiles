from talon import Context, Module, actions, registry

mod = Module()

ctx = Context()


@mod.action_class
class UserActions:
    def gpt_display_help():
        """Use ChatGPT to display help about the current available commands"""
        command_list = ""
        for ctx in registry.active_contexts():
            items = ctx.commands.items()
            for _, command in items:
                command_list += str(command)
        prompt = """
        The following describes a number of commands that are available to the user in this context. 
        I want you to format this text so that it is easy to scan using only ascii characters.
        Please feel free to group it, order it and make use of the horizontal and vertical space so that it is easy to find what you are looking for.
        Order it so that the most contextually relevant (paying attention to what application I am working in) commands are at the top.
        """
        text = actions.user.gpt_run_prompt(prompt, command_list)
        actions.user.gpt_insert_response({"type": "text", "text": text}, "browser")


@ctx.action_class("user")
class OverrideUserActions:
    def gpt_additional_user_context():
        """This is an override function that can be used to add additional context to the prompt"""
        return []
