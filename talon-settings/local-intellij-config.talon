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

explore:                    key("cmd-f12")
split next:                 key("alt-tab")
split previous:             key("alt-shift-tab")
clone funk:
	key('cmd-alt-shift-[')
	key("alt-up")
	key("alt-up")
	key(cmd-d)
take inside:
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

symbol hunt [<user.text>] [over]:
	key('cmd-f12')
	sleep(400ms)
	insert(user.text or "")

quick fix [<user.text>] [over]:
	key("alt-enter")
	sleep(400ms)
	insert(user.text or "")

rename [<user.text>] [over]:
	key("shift-f6")
	sleep(400ms)
	insert(user.text or "")

refactor [<user.text>] [over]:
	key("ctrl-t")
	sleep(400ms)
	insert(user.text or "")

complete:                   key("ctrl-space")
