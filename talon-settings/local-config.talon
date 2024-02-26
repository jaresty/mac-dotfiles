key(f1:down):               speech.enable()
key(f1:up):                 speech.disable()
tag(): user.gpt_beta
tag(): user.prefixed_numbers
settings():
  user.emacs_meta = "alt"
  user.tmux_prefix_key = 'ctrl-space'

# homerow
^chase mouse [<user.text>]:
  user.homerow_search()
  sleep(50ms)
  insert(text or "")

^chase menu [<user.text>]:
  key("cmd-?")
  sleep(50ms)
  insert(text or "")

^chase window [<user.text>]:
  key("alt-tab")
  sleep(50ms)
  insert(text or "")

^raycast [<user.text>]:
  key("cmd-space")
  sleep(50ms)
  insert(text or "")
