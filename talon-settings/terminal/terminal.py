from talon import Context, actions, Module


mod = Module()


@mod.action_class
class Actions:
    def build():
        """Build the project"""

    def test():
        """Test the project"""

    def run():
        """Run the project"""


front_end_context = Context()
front_end_context.matches = r"""
tag: terminal
and win.title: /shop-next-lists-front-end/
"""


@front_end_context.action_class("user")
class FrontendUserActions:
    def build():
        actions.insert("npm run build")
        actions.key("enter")

    def test():
        actions.insert("npm run test")
        actions.key("enter")

    def run():
        actions.insert("npm run dev")
        actions.key("enter")


backend_context = Context()
backend_context.matches = r"""
tag: terminal
and win.title: /shop-next-lists-java-api/
"""


@backend_context.action_class("user")
class BackendUserActions:
    def build():
        actions.insert("./gradlew build")
        actions.key("enter")

    def test():
        actions.insert("./gradlew test")
        actions.key("enter")

    def run():
        actions.insert("./gradlew bootRun")
        actions.key("enter")


shell_context = Context()
shell_context.matches = r"""
tag: terminal
and win.title: /web-shop-ui-shell/
"""


@shell_context.action_class("user")
class ShellUserActions:
    def build():
        actions.insert("npm run build")
        actions.key("enter")

    def test():
        actions.insert("npm run test")
        actions.key("enter")

    def run():
        actions.insert("npm run dev:registry")
        actions.key("enter")
