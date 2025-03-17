tag: terminal
-
tag(): user.generic_unix_shell
tag(): user.git
tag(): user.kubectl
tag(): user.readline
settings():
	key_wait = 5

mob start: "mob start\n"
mob start <user.number_string>: "mob start {number_string}\n"
mob next: "mob next\n"
mob done: "mob done\n"

siginter: key(ctrl-c)
sigend: key(ctrl-d)
editor: key(alt-e)
onpunch: key("alt-d")
file [<user.spoken_text_search>] tap:
	key(ctrl-t)
	sleep(60ms)
	insert(spoken_text_search)
project [<user.spoken_text_search>] tap$:
	insert("z {spoken_text_search}")
	key(tab)
project [<user.spoken_text_search>] walk$:
	insert("z {spoken_text_search}")
	key(enter)
text <user.spoken_text_search> tap:
	insert("rg {spoken_text_search}")
	key(enter)
dir fly walk:
	insert("cd ..")
	key(enter)
dir <user.spoken_text_search> walk:
	key(alt-c)
	sleep(60ms)
	insert(spoken_text_search)
	key(enter)
dir [<user.spoken_text_search>] tap:
	key(alt-c)
	sleep(60ms)
	insert(spoken_text_search or "")
dir rewalk:
	insert("cd -")
	key(enter)

flag [<user.spoken_text_search>] walk:
	insert("--")
	user.complete_from_start(prose or "", 1)

flag [<user.spoken_text_search>] tap:
	insert("--")
	user.complete_tap(prose or "")

yes: key(y enter)
no: key(n enter)
git autocommit: 'git commit -m "$(git diff --staged | mods "summarize this as a conventional commit")"'
