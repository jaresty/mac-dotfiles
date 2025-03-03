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
file [<user.text>] tap:
	key(ctrl-t)
	sleep(60ms)
	insert(text)
project [<user.text>] tap$:
	insert("z {text}")
	key(tab)
project [<user.text>] step$:
	insert("z {text}")
	key(enter)
text <user.text> tappest:
	insert("rg {text}")
	key(enter)
lee [<user.text>] tap:
	key(shift-tab)
	insert(text)
lee [<user.text>] step:
	key(shift-tab)
	insert(text or "")
	sleep(200ms)
	key(enter)
dir <user.text> step:
	key(alt-c)
	sleep(60ms)
	insert(text)
	key(enter)
dir restep:
	insert("cd -")
	key(enter)
# terminal commands
n p m: "npm "

flag: " --"

yes: key(y enter)
no: key(n enter)
git autocommit: 'git commit -m "$(git diff --staged | mods "summarize this as a conventional commit")"'
