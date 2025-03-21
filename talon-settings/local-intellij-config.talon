# Requires https://plugins.jetbrains.com/plugin/10504-voice-code-idea
app: jetbrains
-
settings():
	key_wait = 15

please [<user.text>] [over]:
	key("cmd-shift-a")
	sleep(400ms)
	insert(user.text or "")

# project <user.spoken_search> [{user.file_extension}] tap:
# 	user.idea("action RecentFiles")
# 	sleep(400ms)
# 	insert(spoken_search or "")
# 	insert(file_extension or "")
# 	sleep(300ms)
# 	key(enter)
# 	sleep(150ms)

# File Commands
file [<user.spoken_search>] [{user.file_extension}] tap$:
	key("cmd-shift-o")
	sleep(400ms)
	insert(spoken_search or "")
	insert(file_extension or "")
	sleep(300ms)
file <user.spoken_search> [{user.file_extension}] split walk$:
	key("cmd-shift-o")
	sleep(400ms)
	insert(spoken_search or "")
	insert(file_extension or "")
	sleep(300ms)
	key(shift-enter)
file <user.spoken_search> [{user.file_extension}] walk$:
	key("cmd-shift-o")
	sleep(400ms)
	insert(spoken_search or "")
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

bipickerest:
	key('cmd-alt-[')
	key('cmd-alt-shift-]')
bipickest:
	key('cmd-a')
wax walk: user.wax()
wax rewalk: user.wane()

onwalkest: edit.file_end()
onwalkerest: key('cmd-alt-]')
rewalkerest: key('cmd-alt-[')
rewalkest: edit.file_start()
onpickerest: key('cmd-alt-shift-]')
onpickest: edit.extend_file_end()
repickerest: key('cmd-alt-shift-[')
repickest: edit.extend_file_start()
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

^text [<user.spoken_search>] walky:
	user.idea("action Find")
	insert(spoken_search or "")
	sleep(200ms)
	key(enter)

^text [<user.spoken_search>] walk:
	user.idea("action FindInPath")
	insert(spoken_search or "")
	sleep(200ms)
	key(enter)

^symbol [<user.spoken_search>] tap:
	user.idea("action GotoSymbol")
	insert(spoken_search or "")

symbol [<user.spoken_search>] tappy:
	key("cmd-f12")
	sleep(400ms)
	insert(spoken_search or "")

^symbol [<user.spoken_search>] walk:
	user.idea("action GotoSymbol")
	insert(spoken_search or "")
	sleep(200ms)
	key(enter)

symbol [<user.spoken_search>] walky:
	key("cmd-f12")
	sleep(400ms)
	insert(spoken_search or "")
	sleep(200ms)
	key(enter)

prob [<user.spoken_search>] tap:
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(spoken_search or "")
prob [<user.spoken_search>] walk:
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(spoken_search or "")
	key(enter)
prob [<user.spoken_search>] ontap:
	user.problem_next()
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(spoken_search or "")
prob [<user.spoken_search>] retap:
	user.problem_last()
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(spoken_search or "")
prob [<user.spoken_search>] onwalk:
	user.problem_next()
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(spoken_search or "")
	key(enter)
prob [<user.spoken_search>] rewalk:
	user.problem_last()
	user.idea("action ShowIntentionActions")
	sleep(400ms)
	insert(spoken_search or "")
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

onpusher:
	key(enter)
	edit.up()
	edit.line_end()
