key(f20:down):
  app.notify("Talon is listening")
  speech.enable()
key(f20:up):
  speech.disable()
  app.notify("Talon is sleeping")
drowse:                     speech.disable()
tag(): user.gpt_beta
tag(): user.prefixed_numbers
settings():
  user.emacs_meta = "alt"
  user.tmux_prefix_key = 'ctrl-space'

ain:                        core.repeat_command(1)

grab O C R:                 key("cmd-ctrl-shift-alt-o")

# homerow
^mouser [<user.text>]:
  user.homerow_search()
  sleep(50ms)
  insert(text or "")

^windows [<user.text>]:
  key("alt-tab")
  sleep(50ms)
  insert(text or "")

^raycast [<user.text>]:
  key("cmd-space")
  sleep(50ms)
  insert(text or "")
