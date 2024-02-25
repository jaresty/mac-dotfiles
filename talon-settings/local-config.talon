key(f1:down): speech.enable()
key(f1:up): speech.disable()
tag(): user.gpt_beta
tag(): user.prefixed_numbers
settings():
    user.emacs_meta = "alt"
    user.tmux_prefix_key = 'ctrl-space'

input switch: key("cmd-shift-ctrl-alt-v")

# homerow
^chase mouse [<user.text>]:
  key("cmd-shift-ctrl-alt-s")
  sleep(50ms)
  insert(text or "")

^chase menu [<user.text>]:
  key("cmd-shift-ctrl-alt-m")
  sleep(50ms)
  insert(text or "")

^chase window [<user.text>]:
  key("alt-tab")
  sleep(50ms)
  insert(text or "")
