from talon import Context, Module

ctx = Context()
mod = Module()

mod.apps.kitty = """
os: mac
and app.bundle: net.kovidgoyal.kitty
"""
ctx.matches = r"""
app: kitty
"""
