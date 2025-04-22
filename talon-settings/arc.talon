app: arc
os: mac
-

# File Commands
file [<user.spoken_text_search>] [{user.file_extension}] tap:
	key("cmd-p")
	sleep(400ms)
	insert(spoken_text_search or "")
	insert(file_extension or "")
file [<user.spoken_text_search>] [{user.file_extension}] walk:
	key("cmd-p")
	sleep(400ms)
	insert(spoken_text_search or "")
	insert(file_extension or "")
	sleep(300ms)
	key(enter)

tag [<user.spoken_text_search>] tap:
	key("cmd-p @")
	sleep(400ms)
	insert(spoken_text_search or "")
tag [<user.spoken_text_search>] walk:
	key("cmd-p @")
	sleep(400ms)
	insert(spoken_text_search or "")
	sleep(300ms)
	key(enter)

inspect tap: key(cmd-alt-c)
command [<user.spoken_text_search>] tap:
	key("cmd-p >")
	sleep(400ms)
	insert(spoken_text_search or "")
command [<user.spoken_text_search>] walk:
	key("cmd-p >")
	sleep(400ms)
	insert(spoken_text_search or "")
	sleep(300ms)
	key(enter)

debug play: key(f8)
debug walk: key(f9)
debug dip walk: key(f11)
debug fly walk: key(shift-f11)
