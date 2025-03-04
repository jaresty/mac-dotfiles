not app: jetbrains
and not app: code
-
^menu tap [<user.prose>]$:
	key("ctrl-alt-cmd-shift-m")
	sleep(50ms)
	insert(prose or "")
