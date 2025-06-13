# Requires https://plugins.jetbrains.com/plugin/10504-voice-code-idea
app: jetbrains
-
settings():
	key_wait = 15

please [<user.text>] [over]:
	key("cmd-shift-a")
	sleep(400ms)
	insert(user.text or "")

# project <user.text> [{user.file_extension}] tap:
# 	user.idea("action RecentFiles")
# 	sleep(400ms)
# 	insert(text or "")
# 	insert(file_extension or "")
# 	sleep(300ms)
# 	key(enter)
# 	sleep(150ms)

# File Commands
file [<user.text>] [{user.file_extension}] tap$:
	key("cmd-shift-o")
	sleep(400ms)
	insert(text or "")
	insert(file_extension or "")
	sleep(300ms)
file <user.text> [{user.file_extension}] pit ong$:
	key("cmd-shift-o")
	sleep(400ms)
	insert(text or "")
	insert(file_extension or "")
	sleep(300ms)
	key(shift-enter)
file <user.text> [{user.file_extension}] ong$:
	key("cmd-shift-o")
	sleep(400ms)
	insert(text or "")
	insert(file_extension or "")
	sleep(300ms)
	key(enter)
file rog:
	key(ctrl-tab)
alter ong:
	user.idea("action GotoTest")
	key(enter)
alter onger:
	user.idea("action GotoTest")
	key(shift-enter)

crumb tap: key("cmd-up")
forge file:
	key("cmd-up f5")
kick file:
	key("cmd-up delete")

^text [<user.text>] tap:
	user.idea("action Find")
	insert(text or "")

^text [<user.text>] tapper:
	user.idea("action FindInPath")
	insert(text or "")

^text <user.text> ong:
	user.idea("find next {text}, action EditorRight")

^text <user.text> rog:
	user.idea("find prev {text}, action EditorRight")

^text <user.text> onger:
	user.idea("action FindInPath")
	insert(text or "")
	sleep(200ms)

^tag [<user.text>] tapper:
	user.idea("action GotoSymbol")
	insert(text or "")

tag [<user.text>] tap:
	key("cmd-f12")
	sleep(400ms)
	insert(text or "")

^tag [<user.text>] onger:
	user.idea("action GotoSymbol")
	insert(text or "")
	sleep(200ms)
	key(enter)

tag <user.text> ong:
	key("cmd-f12")
	sleep(400ms)
	insert(text or "")
	sleep(200ms)
	key(enter)

prob [<user.text>] tap:
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(text or "")
prob [<user.text>] ong:
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(text or "")
	key(enter)
prob [<user.text>] ont:
	user.problem_next()
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(text or "")
prob [<user.text>] ret:
	user.problem_last()
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(text or "")
prob [<user.text>] ong:
	user.problem_next()
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(text or "")
	key(enter)
prob [<user.text>] rog:
	user.problem_last()
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(text or "")
	key(enter)

run ong: key('ctrl-r')
run rog: key('ctrl-shift-r')

narrow:
	key(cmd-shift--)
	key(cmd-=)
	key(cmd-alt-=)

param tap: user.idea("action ParameterInfo")

forge pit:
	user.idea("action SplitVertically")
