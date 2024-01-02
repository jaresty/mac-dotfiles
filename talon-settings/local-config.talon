key(f1:down): speech.enable()
key(f1:up): speech.disable()
tag(): user.require_numb_prefix

settings():
    user.emacs_meta = "alt"
    user.tmux_prefix_key = 'ctrl-space'

input switch: key("cmd-shift-ctrl-alt-v")

diff <user.cursorless_target> to <user.cursorless_target>:
    user.cursorless_ide_command("extension.partialDiff.markSection1", cursorless_target_1)
    user.cursorless_ide_command("extension.partialDiff.markSection2AndTakeDiff", cursorless_target_2)