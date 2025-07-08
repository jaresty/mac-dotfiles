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
kick ong: key("alt-d")
file [<user.text>] tap:
	key(ctrl-t)
	sleep(60ms)
	insert(text)
file [<user.text>] ong:
	key(ctrl-t)
	sleep(60ms)
	insert(text)
	key(enter)
proj [<user.text>] tap$:
	insert("z {text}")
	key(tab)
proj [<user.text>] ong$:
	insert("z {text}")
	key(enter)
text <user.text> tap:
	insert("rg {text}")
	key(enter)
dir fog:
	insert("cd ..")
	key(enter)
dir <user.text> ong:
	key(alt-c)
	sleep(60ms)
	insert(text)
	key(enter)
dir [<user.text>] tap:
	key(alt-c)
	sleep(60ms)
	insert(text or "")
dir rog:
	insert("cd -")
	key(enter)

flag [<user.text>] ong:
	insert("--")
	user.complete_from_start(text or "", 1)

flag [<user.text>] tap:
	insert("--")
	user.complete_tap(text or "")

lamb [<user.text>] ong:
	insert("# ")
	insert(text or "")
	key(ctrl-p)

lamb [<user.text>] tap:
	insert("# ")
	insert(text or "")
	key(ctrl-\)

yes: key(y enter)
no: key(n enter)
git autocommit: 'git commit -m "$(git diff --staged | mods "summarize this as a conventional commit")"'
