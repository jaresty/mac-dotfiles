key(f1:down): speech.enable()
key(f1:up): speech.disable()
tag(): user.require_numb_prefix

settings():
    user.emacs_meta = "alt"
    user.tmux_prefix_key = 'ctrl-space'

input switch: key("cmd-shift-ctrl-alt-v")
git copy <user.cursorless_target>:
    user.cursorless_ide_command("extension.copyGitHubLinkToClipboard", cursorless_target)
git open <user.cursorless_target>:
    user.cursorless_ide_command("extension.openInGitHub", cursorless_target)