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
project [<user.prose>] walk$:
	insert("z {prose}")
	key(enter)
text <user.word> tap:
	insert("rg {word}")
	key(enter)
dir fly walk:
	insert("cd ..")
	key(enter)
dir <user.prose> walk:
	key(alt-c)
	sleep(60ms)
	insert(prose)
	key(enter)
dir [<user.prose>] tap:
	key(alt-c)
	sleep(60ms)
	insert(prose)
dir rewalk:
	insert("cd -")
	key(enter)

flag [<user.prose>] walk:
	insert("--")
	user.complete_from_start(prose or "", 1)

spell flag <user.letters> walk:
	insert("-")
	user.complete_from_start(letters or "", 1)

flag [<user.prose>] tap:
	insert("--")
	user.complete_tap(prose or "")

spell flag <user.letters> tap:
	insert("-")
	user.complete_tap(letters)

yes: key(y enter)
no: key(n enter)
git autocommit: 'git commit -m "$(git diff --staged | mods "summarize this as a conventional commit")"'
