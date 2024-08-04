from talon import Context, Module, actions, registry

mod = Module()

ctx = Context()


@mod.action_class
class UserActions:
    def gpt_search_engine(search_engine: str, text_to_process: str) -> str:
        """Format the source for searching with a search engine and open a search"""

        prompt = f"""
        I want to search for the following using the {search_engine} search engine.
        Format the text into a succinct search to help me find what I'm looking for. Return only the text of the search query.
        Optimize the search for returning good search results leaving off anything that would not be useful in searching.
        Rather than searching for exact strings, I want to find a search that is as close as possible.
        I will take care of putting it into a search.
        """
        return actions.user.gpt_run_prompt("normal", prompt, text_to_process)

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
        return actions.user.gpt_apply_prompt(prompt, command_list)


@ctx.action_class("user")
class OverrideUserActions:
    def contextual_user_context():
        """This is an override function that can be used to add additional context to the prompt"""
        return []
