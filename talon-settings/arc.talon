app: arc
os: mac
-

# File Commands
file [<user.prose>] [{user.file_extension}] tap:
	key("cmd-p")
	sleep(400ms)
	insert(prose or "")
	insert(file_extension or "")
file [<user.prose>] [{user.file_extension}] walk:
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
symbol [<user.prose>] walk:
	key("cmd-p @")
	sleep(400ms)
	insert(prose or "")
	sleep(300ms)
	key(enter)

inspect tap: key(cmd-alt-c)
command [<user.prose>] tap:
	key("cmd-p >")
	sleep(400ms)
	insert(prose or "")
command [<user.prose>] walk:
	key("cmd-p >")
	sleep(400ms)
	insert(prose or "")
	sleep(300ms)
	key(enter)

debug play: key(f8)
debug walk: key(f9)
debug dip walk: key(f11)
debug fly walk: key(shift-f11)
