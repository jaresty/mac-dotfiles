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
  # user.paste_to_insert_threshold = 10
  user.emacs_meta = "alt"
  user.tmux_prefix_key = 'ctrl-space'
  user.model_shell_default = 'fish'
  user.model_system_prompt = 'You aid an office workers productivity. Output only the response. Avoid markdown unless requested. If code is needed, match the application language format without syntax errors. Use comments suitable for the programming language to avoid syntax errors.'
  user.snippets_dir = "community/settings/snippets"
  user.openai_model = 'gpt-4o'
  user.subtitles_show = true
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

# ^windows [<user.text>]:
#   key(cmd-ctrl-shift-alt-tab)
#   sleep(50ms)
#   insert(text or "")

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

snap web development:
  mimic("snap figma right third")
  mimic("snap arc center third")
  mimic("snap code left third")

lister <number>: "LISTR-{number}"
copy append that: clip.set_text("{clip.text()}\n{edit.selected_text()}")
cut append that:
  clip.set_text("{clip.text()}\n{edit.selected_text()}")
  key(delete)

{user.model} {user.search_engine} [{user.modelSource}]:
  result = user.gpt_search_engine(search_engine, modelSource or "")
  user.search_with_search_engine(search_engine, result)

{user.model} help active:
  text = user.gpt_display_help()
