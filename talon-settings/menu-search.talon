not app: jetbrains
and not app: code
-
^menu tap [<user.spoken_search>]$:
	key("ctrl-alt-cmd-shift-m")
	sleep(50ms)
	insert(spoken_search or "")
