app: slack
-
settings():
	key_wait = 2

channel <user.text> walk:
	key(cmd-k)
	sleep(200ms)
	insert(text)
	sleep(300ms)
	key(enter)

channel <user.text> tap:
	key(cmd-k)
	insert(text)
	sleep(100ms)
