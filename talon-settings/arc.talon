app: arc
os: mac
-

# File Commands
file [<user.prose>] [{user.file_extension}] tap:
	key("cmd-p")
	sleep(400ms)
	insert(prose or "")
	insert(file_extension or "")
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
symbol [<user.prose>] step:
	key("cmd-p @")
	sleep(400ms)
	insert(prose or "")
	sleep(300ms)
	key(enter)

command [<user.prose>] tap:
	key("cmd-p >")
	sleep(400ms)
	insert(prose or "")
command [<user.prose>] step:
	key("cmd-p >")
	sleep(400ms)
	insert(prose or "")
	sleep(300ms)
	key(enter)

debug step: key(f9)
debug dip step: key(f11)
debug fly step: key(shift-f11)
