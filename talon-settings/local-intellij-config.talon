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
file <user.text> [{user.file_extension}] split walk$:
	key("cmd-shift-o")
	sleep(400ms)
	insert(text or "")
	insert(file_extension or "")
	sleep(300ms)
	key(shift-enter)
file <user.text> [{user.file_extension}] walk$:
	key("cmd-shift-o")
	sleep(400ms)
	insert(text or "")
	insert(file_extension or "")
	sleep(300ms)
	key(enter)
file rewalk:
	key(ctrl-tab)
alter walk:
	user.idea("action GotoTest")
	key(enter)
alter walker:
	user.idea("action GotoTest")
	key(shift-enter)

crumb tap: key("cmd-up")
file forge:
	key("cmd-up f5")
file punch:
	key("cmd-up delete")

split walk: key("alt-tab")

bipickeroom:
	key('cmd-alt-[')
	key('cmd-alt-shift-]')
bipickoom:
	key('cmd-a')
wax walk: user.wax()
wax rewalk: user.wane()

onwalkoom: edit.file_end()
onwalkeroom: key('cmd-alt-]')
rewalkeroom: key('cmd-alt-[')
rewalkoom: edit.file_start()
onpickeroom: key('cmd-alt-shift-]')
onpickoom: edit.extend_file_end()
repickeroom: key('cmd-alt-shift-[')
repickoom: edit.extend_file_start()
onpuncheroom: key('cmd-alt-shift-] delete cmd-alt-l')
onpunchoom:
	edit.extend_file_end()
	edit.delete()
repuncheroom: key('cmd-alt-shift-[ delete cmd-alt-l')
repunchoom:
	edit.extend_file_start()
	edit.delete()
bipuncheroom:
	key('cmd-alt-[')
	key('cmd-alt-shift-]')
	sleep(60ms)
	edit.delete()
bipunchoom:
	edit.select_all()
	edit.delete()

^text [<user.text>] tappy:
	user.idea("action Find")
	insert(text or "")

^text [<user.text>] tap:
	user.idea("action FindInPath")
	insert(text or "")

^text [<user.text>] walky:
	user.idea("action Find")
	insert(text or "")
	sleep(200ms)
	key(enter)

^text [<user.text>] walk:
	user.idea("action FindInPath")
	insert(text or "")
	sleep(200ms)
	key(enter)

^symbol [<user.text>] tap:
	user.idea("action GotoSymbol")
	insert(text or "")

symbol [<user.text>] tappy:
	key("cmd-f12")
	sleep(400ms)
	insert(text or "")

^symbol [<user.text>] walk:
	user.idea("action GotoSymbol")
	insert(text or "")
	sleep(200ms)
	key(enter)

symbol [<user.text>] walky:
	key("cmd-f12")
	sleep(400ms)
	insert(text or "")
	sleep(200ms)
	key(enter)

prob [<user.text>] tap:
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(text or "")
prob [<user.text>] walk:
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(text or "")
	key(enter)
prob [<user.text>] ontap:
	user.problem_next()
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(text or "")
prob [<user.text>] retap:
	user.problem_last()
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(text or "")
prob [<user.text>] onwalk:
	user.problem_next()
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(text or "")
	key(enter)
prob [<user.text>] rewalk:
	user.problem_last()
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(text or "")
	key(enter)

run walk: key('ctrl-r')
run rewalk: key('ctrl-shift-r')

reference: user.idea("action FindUsages")
refer walk: key(cmd-alt-down)
refer rewalk: key(cmd-alt-up)

narrow:
	key(cmd-shift--)
	key(cmd-=)
	key(cmd-alt-=)

param tap: user.idea("action ParameterInfo")

change walk: key(ctrl-shift-alt-down)
change rewalk: key(ctrl-shift-alt-up)

split forge:
	user.idea("action SplitVertically")
