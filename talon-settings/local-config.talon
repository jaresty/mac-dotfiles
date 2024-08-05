key(f10:down):
  app.notify("Talon is listening")
  speech.enable()
key(f10:up):
  speech.disable()
  app.notify("Talon is sleeping")
tag(): user.gpt_beta
tag(): user.prefixed_numbers
tag(): user.unix_utilities
tag(): user.cursorless_use_community_snippets
tag(): user.cursorless_disable_legacy_destination
tag(): user.gamepad
settings():
  user.emacs_meta = "alt"
  user.tmux_prefix_key = 'ctrl-space'
  user.model_shell_default = 'nushell'
  user.snippets_dir = "community/settings/snippets"
  user.openai_model = 'gpt-4o'
  user.subtitles_show = true
  user.paste_to_insert_threshold = 10
  user.context_sensitive_dictation = 1
  user.accessibility_dictation = 1

#  user.model_endpoint = "http://localhost:11434/api/chat"
#  user.openai_model = 'codellama'

gain [<number_small> times]:
  core.repeat_partial_phrase(number_small or 1)

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
copy append that: clip.set_text("{clip.text()}\n{edit.selected_text()}")
cut append that:
  clip.set_text("{clip.text()}\n{edit.selected_text()}")
  key(delete)

model {user.search_engine} [{user.modelSource}]:
  text = user.gpt_get_source_text(modelSource or "")
  result = user.gpt_search_engine(search_engine, text)
  user.search_with_search_engine(search_engine, result)

model help active:
  text = user.gpt_display_help()

# model context push: user.gpt_push_context(edit.selected_text())
# model context display: user.gpt_display_context()
# model context push clip: user.gpt_push_context(clip.text())
# model context clear: user.gpt_clear_context()
