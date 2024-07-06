from talon import Context, Module, app

# copied from here: https://github.com/riley-martine/talon_personal/blob/de57fd184c785a25ae1c0d411fa316c86ad07f14/knausj_overrides.py

mod = Module()

ctx = Context()

# Match more specific so talon loads this second, as an override.
ctx.matches = """
language: en
"""

# Symbols and punctuation
mod.list("symbol_key_overrides", "punctuation overrides (typing and cmd mode)")


@mod.capture(rule="{user.symbol_key_overrides}")
def symbol_key(m) -> str:
    "One symbol key"
    return str(m)


# Modifier Keys

mod.list("addl_modifier_key", "Additional modifier keys")
if app.platform == "mac":
    ctx.lists["user.addl_modifier_key"] = {"rose": "cmd", "troll": "ctrl"}


@mod.capture(rule="({user.modifier_key} | {user.addl_modifier_key})+")
def modifiers(m) -> str:
    "One or more modifier keys"
    mods = [
        *getattr(m, "addl_modifier_key_list", []),
        *getattr(m, "modifier_key_list", []),
    ]
    print("MODS", mods)
    return "-".join(mods)
