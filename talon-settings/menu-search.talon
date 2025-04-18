not app: jetbrains
and not app: code
-
^menu [<user.text>] tap$:
	key("ctrl-alt-cmd-shift-m")
	sleep(50ms)
	insert(text or "")
