app: arc
os: mac
-

# File Commands
file [<user.prose>] [{user.file_extension}] tap:
	key("cmd-p")
	sleep(400ms)
	insert(prose or "")
	insert(file_extension or "")
	sleep(300ms)
file [<user.prose>] [{user.file_extension}] step:
	key("cmd-p")
	sleep(400ms)
	insert(prose or "")
	insert(file_extension or "")
	sleep(300ms)
	key(enter)

symbol [<user.prose>] tap:
	key("cmd-p @")
	sleep(400ms)
	insert(prose or "")
	insert(file_extension or "")
	sleep(300ms)
symbol [<user.prose>] step:
	key("cmd-p @")
	sleep(400ms)
	insert(prose or "")
	insert(file_extension or "")
	sleep(300ms)
	key(enter)
