from talon import Module, actions

mod = Module()

mod.list("emmett_tokens", desc="A list of tokens that are valid in the Emmett language")


@mod.capture(rule=("{user.emmett_tokens}"))
def emmett_tokens(m) -> str:
    return str(m)


@mod.action_class
class Actions:
    def emmett_tokens(emmet_tokens: list[str]):
        """Adds Emmett tokens"""
        for emmett_token in emmet_tokens:
            actions.insert(emmett_token)
