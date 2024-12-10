tag: terminal
-
tag(): user.generic_unix_shell
tag(): user.git
tag(): user.kubectl
tag(): user.readline

mob start [<user.number_string>]: "mob start {number_string}\n"
mob next: "mob next\n"
mob done: "mob done\n"

siginter: key(ctrl-c)
sigend: key(ctrl-d)
editor: key(alt-e)
file peek [<user.text>] [over]$:
	key(ctrl-t)
	sleep(60ms)
	insert(text)
file peekest [<user.text>] [over]$:
	insert("z {text}")
	key(tab)

# terminal commands
n p m: "npm "

flag: " --"

yes: key(y enter)
no: key(n enter)
git autocommit: 'git commit -m "$(git diff --staged | mods "summarize this as a conventional commit with real emoji")"'
