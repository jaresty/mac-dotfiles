not app: jetbrains
and not app: code
-
^menu tap [<user.text>]$:
	key("ctrl-alt-cmd-shift-m")
	sleep(50ms)
	insert(text or "")
