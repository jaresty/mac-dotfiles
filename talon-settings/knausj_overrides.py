from talon import Context, Module, app

# copied from here: https://github.com/riley-martine/talon_personal/blob/de57fd184c785a25ae1c0d411fa316c86ad07f14/knausj_overrides.py

mod = Module()

ctx = Context()

# Match more specific so talon loads this second, as an override.
ctx.matches = """
language: en
"""

mod.list("symbol_key_overrides", "overrides for symbol keys")
mod.list("modifier_key_overrides", "overrides for modifier keys")
mod.list("special_key_overrides", "overrides for special keys")


@mod.capture(rule="{user.symbol_key_overrides}")
def symbol_key(m) -> str:
    "One symbol key"
    return str(m)


@mod.capture(rule="{user.modifier_key_overrides}+")
def modifiers(m) -> str:
    "A single key with optional modifiers"
    try:
        mods = m.modifier_key_overrides_list
    except AttributeError:
        mods = []
    return "-".join(mods)


@mod.capture(rule="{self.special_key_overrides}")
def special_key(m) -> str:
    "One special key"
    return m.special_key_overrides
