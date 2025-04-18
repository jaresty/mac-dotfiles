key(f10:down):
  app.notify("Talon is listening")
  speech.enable()
key(f10:up):
  speech.disable()
  app.notify("Talon is sleeping")
tag(): user.gpt_beta
tag(): user.unix_utilities
tag(): user.cursorless_use_community_snippets
tag(): user.gamepad
tag(): user.experimental_window_layout
settings():
  # user.paste_to_insert_threshold = 10
  user.emacs_meta = "alt"
  user.tmux_prefix_key = 'ctrl-space'
  user.model_shell_default = 'fish'
  user.model_default_audience = 'Schwa is a software developer who has spent the majority of his career working in the dynamic language ruby. He has experience with automation and DevOps using tools such as terraform and docker. He is currently learning kotlin and typescript as he works on a react project.'
  user.snippets_dir = "community/settings/snippets"
  user.openai_model = 'gpt-4.1-mini'
  user.subtitles_show = true
  user.context_sensitive_dictation = 1
  user.accessibility_dictation = 1

#  user.model_endpoint = "http://localhost:11434/api/chat"
#  user.openai_model = 'codellama'

gain [<number_small> times]:
  core.repeat_partial_phrase(number_small or 1)

wait: sleep(200ms)

grab O C R: key("cmd-ctrl-shift-alt-o")

^emo [<user.text>] tap$:
  key(cmd-ctrl-shift-alt-space)
  sleep(200ms)
  insert(text or "")

# homerow
^pointer <user.text> tap:
  user.homerow_search()
  sleep(100ms)
  insert(text or "")

# homerow
^pointer <user.text> walk:
  user.homerow_search()
  sleep(100ms)
  insert(text or "")
  sleep(500ms)
  key(enter)
  sleep(500ms)
  key(escape)

^pointer tap:
  key("cmd-shift-ctrl-alt-c")

^scroll [<user.text>] tap:
  user.homerow_scroll_search()
  sleep(100ms)
  insert(text or "")

# ^windows [<user.text>]:
#   key(cmd-ctrl-shift-alt-tab)
#   sleep(50ms)
#   insert(text or "")

^raycast [<user.text>]:
  key("cmd-space")
  sleep(50ms)
  insert(text or "")

^window [<user.text>] tap:
  key("cmd-ctrl-alt-shift-tab")
  sleep(100ms)
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

lister <number>: "LISTR-{number}"
copy append that: clip.set_text("{clip.text()}\n{edit.selected_text()}")
cut append that:
  clip.set_text("{clip.text()}\n{edit.selected_text()}")
  key(delete)
