# Requires https://plugins.jetbrains.com/plugin/10504-voice-code-idea
app: jetbrains
-
settings():
	key_wait = 15

please [<user.text>] [over]:
	key("cmd-shift-a")
	sleep(400ms)
	insert(user.text or "")

pleet tap: user.idea("action CodeCompletion")

project <user.text> [{user.file_extension}] peek:
	user.idea("action RecentFiles")
	sleep(400ms)
	insert(text or "")
	insert(file_extension or "")
	sleep(300ms)
	key(enter)
	sleep(150ms)

# File Commands
file [<user.text>] [{user.file_extension}] peek:
	key("cmd-shift-o")
	sleep(400ms)
	insert(text or "")
	insert(file_extension or "")
	sleep(300ms)
file <user.text> [{user.file_extension}] split step:
	key("cmd-shift-o")
	sleep(400ms)
	insert(text or "")
	insert(file_extension or "")
	sleep(300ms)
	key(shift-enter)
file <user.text> [{user.file_extension}] step:
	key("cmd-shift-o")
	sleep(400ms)
	insert(text or "")
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

crumb step: key("cmd-up")
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

^text [<user.text>] peek:
	user.idea("action Find")
	insert(user.text or "")

^text [<user.text>] peekest:
	user.idea("action FindInPath")
	insert(user.text or "")

^symbol [<user.text>] peekest:
	user.idea("action GotoSymbol")
	insert(text)
	key("enter")

symbol [<user.text>] peek:
	key("cmd-f12")
	sleep(400ms)
	insert(user.text or "")

prob tap: user.idea("action ShowIntentionActions")
prob ontap:
	user.problem_next()
	user.idea("action ShowIntentionActions")
prob retap:
	user.problem_last()
	user.idea("action ShowIntentionActions")

run that: key('ctrl-r')
run last: key('ctrl-shift-r')

reference: user.idea("action FindUsages")
refer step: key(cmd-alt-down)
refer restep: key(cmd-alt-up)

narrow:
	key(cmd-shift--)
	key(cmd-=)
	key(cmd-alt-=)

param peek: user.idea("action ParameterInfo")

change step: key(ctrl-shift-alt-down)
change restep: key(ctrl-shift-alt-up)

split forge:
	user.idea("action SplitVertically")

onpusher:
	key(enter)
	edit.up()
	edit.line_end()
