from talon import Context, Module

ctx = Context()
mod = Module()

mod.apps.ghostty = """
os: mac
and app.bundle: com.mitchellh.ghostty
"""
ctx.matches = r"""
app: ghostty
"""
