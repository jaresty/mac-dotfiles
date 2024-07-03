from talon import Context, Module, app

# copied from here: https://github.com/riley-martine/talon_personal/blob/de57fd184c785a25ae1c0d411fa316c86ad07f14/knausj_overrides.py

mod = Module()

ctx = Context()

# Match more specific so talon loads this second, as an override.
ctx.matches = """
language: en
"""

# Symbols and punctuation
mod.list("addl_punctuation", "Additional punctuation (typing and cmd mode)")
addl_punctuation = {
    "leper": "(",
    "reper": ")",
    "lacker": "[",
    "racker": "]",
    "lacer": "{",
    "racer": "}",
    "langle": "<",
    "stack": ":",
    "wave": "~",
    "quest": "?",
    "foot": "'",
    "inch": '"',
    "drip": ",",
    "dripper": ";",
    "dizzy": "@",
    "tangle": "^",
    "blank": "_",
}
ctx.lists["user.addl_punctuation"] = addl_punctuation


@mod.capture(rule="{user.symbol_key} | {user.addl_punctuation}")
def symbol_key(m) -> str:
    "One symbol key"
    theirs = getattr(m, "symbol_key", None)
    if theirs and theirs == "£":
        return "#"
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
