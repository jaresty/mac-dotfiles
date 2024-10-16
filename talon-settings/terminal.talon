tag: terminal
-
tag(): user.generic_unix_shell
tag(): user.git
tag(): user.kubectl
tag(): user.readline

mob start [<user.number_string>]: "mob start {number_string}\n"
mob next: "mob next\n"
mob done: "mob done\n"
complete [<user.text>] [over]:
	key(shift-tab)
	insert(text)

sigint: key(ctrl-c)
sigend: key(ctrl-d)
fuzzif: key(ctrl-t)
editor: key(alt-e)

# terminal commands
n p m: "npm "

flag [<user.text>] [over]:
	insert("--")
	key(shift-tab)
	insert(text)

yes: key(y enter)
no: key(n enter)
git autocommit: 'git commit -m "$(git diff --staged | mods "summarize this as a conventional commit with real emoji")"'
