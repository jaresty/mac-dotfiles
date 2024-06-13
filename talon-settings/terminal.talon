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

# terminal commands
n p m: "npm "
