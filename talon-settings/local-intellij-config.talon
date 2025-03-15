# Requires https://plugins.jetbrains.com/plugin/10504-voice-code-idea
app: jetbrains
-
settings():
	key_wait = 15

please [<user.prose>] [over]:
	key("cmd-shift-a")
	sleep(400ms)
	insert(user.prose or "")

# project <user.prose> [{user.file_extension}] tap:
# 	user.idea("action RecentFiles")
# 	sleep(400ms)
# 	insert(prose or "")
# 	insert(file_extension or "")
# 	sleep(300ms)
# 	key(enter)
# 	sleep(150ms)

# File Commands
file [<user.prose>] [{user.file_extension}] tap:
	key("cmd-shift-o")
	sleep(400ms)
	insert(prose or "")
	insert(file_extension or "")
	sleep(300ms)
file <user.prose> [{user.file_extension}] split step:
	key("cmd-shift-o")
	sleep(400ms)
	insert(prose or "")
	insert(file_extension or "")
	sleep(300ms)
	key(shift-enter)
file <user.prose> [{user.file_extension}] step:
	key("cmd-shift-o")
	sleep(400ms)
	insert(prose or "")
	insert(file_extension or "")
	sleep(300ms)
	key(enter)
file restep:
	key(ctrl-tab)
alter step:
	user.idea("action GotoTest")
	key(enter)
alter stepper:
	user.idea("action GotoTest")
	key(shift-enter)

crumb tap: key("cmd-up")
file forge:
	key("cmd-up f5")
file punch:
	key("cmd-up delete")

split step: key("alt-tab")

bisnatcherest:
	key('cmd-alt-[')
	key('cmd-alt-shift-]')
bisnatchest:
	key('cmd-a')
wax step: user.wax()
wax restep: user.wane()

onsteppest: edit.file_end()
onstepperest: key('cmd-alt-]')
restepperest: key('cmd-alt-[')
resteppest: edit.file_start()
onsnatcherest: key('cmd-alt-shift-]')
onsnatchest: edit.extend_file_end()
resnatcherest: key('cmd-alt-shift-[')
resnatchest: edit.extend_file_start()
onpuncherest: key('cmd-alt-shift-] delete cmd-alt-l')
onpunchest:
	edit.extend_file_end()
	edit.delete()
repuncherest: key('cmd-alt-shift-[ delete cmd-alt-l')
repunchest:
	edit.extend_file_start()
	edit.delete()
bipuncherest:
	key('cmd-alt-[')
	key('cmd-alt-shift-]')
	sleep(60ms)
	edit.delete()
bipunchest:
	edit.select_all()
	edit.delete()

^text [<user.spoken_search>] tappy:
	user.idea("action Find")
	insert(spoken_search or "")

^text [<user.spoken_search>] tap:
	user.idea("action FindInPath")
	insert(spoken_search or "")

^text [<user.spoken_search>] steppy:
	user.idea("action Find")
	insert(spoken_search or "")
	sleep(200ms)
	key(enter)

^text [<user.spoken_search>] step:
	user.idea("action FindInPath")
	insert(spoken_search or "")
	sleep(200ms)
	key(enter)

^symbol [<user.spoken_search>] tap:
	user.idea("action GotoSymbol")
	user.insert_formatted(spoken_search or "", "NO_SPACES")

symbol [<user.spoken_search>] tappy:
	key("cmd-f12")
	sleep(400ms)
	user.insert_formatted(spoken_search or "", "NO_SPACES")

^symbol [<user.spoken_search>] step:
	user.idea("action GotoSymbol")
	user.insert_formatted(spoken_search or "", "NO_SPACES")
	sleep(200ms)
	key(enter)

symbol [<user.spoken_search>] steppy:
	key("cmd-f12")
	sleep(400ms)
	user.insert_formatted(spoken_search or "", "NO_SPACES")
	sleep(200ms)
	key(enter)

prob [<user.prose>] tap:
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	user.insert_formatted(prose or "", "NO_SPACES")
prob [<user.prose>] step:
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	user.insert_formatted(prose or "", "NO_SPACES")
	key(enter)
prob [<user.prose>] ontap:
	user.problem_next()
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	user.insert_formatted(prose or "", "NO_SPACES")
prob [<user.prose>] retap:
	user.problem_last()
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	user.insert_formatted(prose or "", "NO_SPACES")
prob [<user.prose>] onstep:
	user.problem_next()
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	user.insert_formatted(prose or "", "NO_SPACES")
	key(enter)
prob [<user.prose>] restep:
	user.problem_last()
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	user.insert_formatted(prose or "", "NO_SPACES")
	key(enter)

run that: key('ctrl-r')
run last: key('ctrl-shift-r')

reference: user.idea("action FindUsages")
refer step: key(cmd-alt-down)
refer restep: key(cmd-alt-up)

narrow:
	key(cmd-shift--)
	key(cmd-=)
	key(cmd-alt-=)

param tap: user.idea("action ParameterInfo")

change step: key(ctrl-shift-alt-down)
change restep: key(ctrl-shift-alt-up)

split forge:
	user.idea("action SplitVertically")

onpusher:
	key(enter)
	edit.up()
	edit.line_end()
