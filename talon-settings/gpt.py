from talon import Context, Module, actions

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
        return actions.user.gpt_apply_prompt(prompt, text_to_process)


@ctx.action_class("user")
class OverrideUserActions:
    def contextual_user_context():
        """This is an override function that can be used to add additional context to the prompt"""
        result = actions.user.talon_get_active_context()
        return [
            f"The following describes the currently focused application:\n\n{result}"
        ]
