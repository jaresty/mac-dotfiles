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
file [<user.prose>] tap:
	key(ctrl-t)
	sleep(60ms)
	insert(prose)
project [<user.prose>] tap$:
	insert("z {prose}")
	key(tab)
project [<user.prose>] step$:
	insert("z {prose}")
	key(enter)
text <user.word> tap:
	insert("rg {word}")
	key(enter)
lee [<user.prose>] tap:
	key(shift-tab)
	insert(prose or "")
lee [<user.prose>] step:
	insert(prose or "")
	key(tab ctrl-n)
lee [<user.prose>] dive$:
	insert(prose or "")
	key(tab ctrl-n enter enter)
dir fly step:
	insert("cd ..")
	key(enter)
dir <user.prose> step:
	key(alt-c)
	sleep(60ms)
	insert(prose)
	key(enter)
dir [<user.prose>] tap:
	key(alt-c)
	sleep(60ms)
	insert(prose)
dir restep:
	insert("cd -")
	key(enter)

flag: " --"

yes: key(y enter)
no: key(n enter)
git autocommit: 'git commit -m "$(git diff --staged | mods "summarize this as a conventional commit")"'
