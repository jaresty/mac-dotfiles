app: arc
os: mac
-

# File Commands
file [<user.text>] [{user.file_extension}] tap:
	key("cmd-p")
	sleep(400ms)
	insert(text or "")
	insert(file_extension or "")
file [<user.text>] [{user.file_extension}] jog:
	key("cmd-p")
	sleep(400ms)
	insert(text or "")
	insert(file_extension or "")
	sleep(300ms)
	key(enter)

tag [<user.text>] tap:
	key("cmd-p @")
	sleep(400ms)
	insert(text or "")
tag [<user.text>] jog:
	key("cmd-p @")
	sleep(400ms)
	insert(text or "")
	sleep(300ms)
	key(enter)

inspect tap: key(cmd-alt-c)
command [<user.text>] tap:
	key("cmd-p >")
	sleep(400ms)
	insert(text or "")
command [<user.text>] jog:
	key("cmd-p >")
	sleep(400ms)
	insert(text or "")
	sleep(300ms)
	key(enter)

debug play: key(f8)
debug ong: key(f9)
debug dig: key(f11)
debug fog: key(shift-f11)
