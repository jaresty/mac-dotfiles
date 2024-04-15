key(f12:down):
  app.notify("Talon is listening")
  speech.enable()
key(f12:up):
  speech.disable()
  app.notify("Talon is sleeping")
drowse:                     speech.disable()
tag(): user.gpt_beta
tag(): user.prefixed_numbers
tag(): user.unix_utilities
settings():
  user.emacs_meta = "alt"
  user.tmux_prefix_key = 'ctrl-space'
  user.model_shell_default = 'nushell'

#  user.model_endpoint = "http://localhost:11434/api/chat"
#  user.openai_model = 'codellama'

gain:                       core.repeat_command(1)

grab O C R:                 key("cmd-ctrl-shift-alt-o")

emoji [<user.text>]:
  key(cmd-ctrl-shift-alt-space)
  sleep(200ms)
  insert(text or "")

wait:                       sleep(400ms)

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

# undo that: nope, nix, junk, blast
nope:                       edit.undo()

toggle mike:                key("cmd-ctrl-shift-alt-a")
