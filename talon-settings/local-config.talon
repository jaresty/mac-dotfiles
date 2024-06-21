key(f10:down):
  app.notify("Talon is listening")
  speech.enable()
key(f10:up):
  speech.disable()
  app.notify("Talon is sleeping")
drowse: speech.disable()
tag(): user.gpt_beta
tag(): user.prefixed_numbers
tag(): user.unix_utilities
tag(): user.cursorless_use_community_snippets
tag(): user.cursorless_disable_legacy_destination
settings():
  user.emacs_meta = "alt"
  user.tmux_prefix_key = 'ctrl-space'
  user.model_shell_default = 'nushell'
  user.snippets_dir = "community/settings/snippets"
  user.openai_model = 'gpt-4o'

#  user.model_endpoint = "http://localhost:11434/api/chat"
#  user.openai_model = 'codellama'

gain: core.repeat_command(1)

grab O C R: key("cmd-ctrl-shift-alt-o")

emoji [<user.text>]:
  key(cmd-ctrl-shift-alt-space)
  sleep(200ms)
  insert(text or "")

wait: sleep(400ms)

# homerow
^mouser [<user.text>]:
  user.homerow_search()
  sleep(50ms)
  insert(text or "")

^windows [<user.text>]:
  key(cmd-ctrl-shift-alt-tab)
  sleep(50ms)
  insert(text or "")

^raycast [<user.text>]:
  key("cmd-space")
  sleep(50ms)
  insert(text or "")

^conventional commit:
  key("cmd-space")
  sleep(50ms)
  insert("insert conventional commit")
  sleep(50ms)
  key(enter)

^conventional comment:
  key("cmd-space")
  sleep(50ms)
  insert("insert conventional comment")
  sleep(50ms)
  key(enter)

# undo that: nope, nix, junk, blast
nope: edit.undo()

toggle mike: key("f11")

{user.formatters} (abbreviate | abreviate | brief) {user.abbreviation}: user.insert_formatted(abbreviation, formatters)

snap web development:
  mimic("snap figma right third")
  mimic("snap arc center third")
  mimic("snap code left third")

lister <number>: "LISTR-{number}"
