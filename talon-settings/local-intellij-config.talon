# Requires https://plugins.jetbrains.com/plugin/10504-voice-code-idea
app: jetbrains
-
settings():
	key_wait = 1.5

please [<user.text>] [over]:
	key("cmd-shift-a")
	sleep(400ms)
	insert(user.text or "")

file hunt [<user.text>] [over]:
	key("cmd-shift-o")
	sleep(400ms)
	insert(user.text or "")

symbol hunt all [<user.text>] [over]:
	key("cmd-alt-o")
	sleep(400ms)
	insert(user.text or "")

explore [<user.text>] [over]:
	key("cmd-f12")
	sleep(400ms)
	insert(user.text or "")
splitter:                   key("alt-tab")
clone funk:
	key('cmd-alt-shift-[')
	key("alt-up")
	key("alt-up")
	key(cmd-d)
take funk:
	key('cmd-alt-[')
	key('cmd-alt-shift-]')
	key("alt-up")
	key("alt-up")
gathest:
	key('cmd-alt-[')
	key('cmd-alt-shift-]')
wax:                        key("alt-up")
wane:                       key("alt-down")

drag down:                  key('shift-cmd-down')
drag up:                    key('shift-cmd-up')
steppest:                   key('cmd-alt-]')
slinkest:                   key('cmd-alt-[')
snatchest:                  key('cmd-alt-shift-]')
chancest:                   key('cmd-alt-shift-[')
punchest:                   key('cmd-alt-shift-] delete cmd-alt-l')
kickest:                    key('cmd-alt-shift-[ delete cmd-alt-l')
boomest:
	key('cmd-alt-[')
	key('cmd-alt-shift-]')
	edit.delete()

symbol hunt [<user.text>] [over]:
	key('cmd-f12')
	sleep(400ms)
	insert(user.text or "")

quick fix this [<user.text>] [over]:
	key("alt-enter")
	sleep(400ms)
	insert(user.text or "")

rename this [<user.text>] [over]:
	key("shift-f6")
	sleep(400ms)
	insert(user.text or "")

refactor this [<user.text>] [over]:
	key("ctrl-t")
	sleep(400ms)
	insert(user.text or "")

complete this:              user.idea("action CodeCompletion")

teleport [<user.text>] [over]:
	key(cmd-shift-e)
	sleep(400ms)
	insert(user.text or "")

triage:
	key(f2)
	key(alt-enter)
triage last:
	key(shift-f2)
	key(alt-enter)

run that:                   key('ctrl-r')
run last:                   key('ctrl-shift-r')

reference:                  user.idea("action FindUsages")
jump:                       key(cmd-alt-down)
jump back:                  key(cmd-alt-up)

narrow:
	key(cmd-shift--)
	key(cmd-=)
	key(cmd-alt-=)

widen:
	key(cmd-shift-+)

pop params:                 user.idea("action ParameterInfo")

rename next <user.text> [over]: user.idea("find next {text}, action RenameElement")
rename last <user.text> [over]: user.idea("find prev {text}, action RenameElement")

complete next <user.text> [over]: user.idea("find next {text},action CodeCompletion")
complete last <user.text> [over]: user.idea("find prev {text},action CodeCompletion")

quick fix next <user.text> [over]: user.idea("find next {text},action ShowIntentionActions")
quick fix last <user.text> [over]: user.idea("find prev {text},action ShowIntentionActions")
