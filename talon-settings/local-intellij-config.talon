# Requires https://plugins.jetbrains.com/plugin/10504-voice-code-idea
app: jetbrains
-
please [<user.text>]:
	key("cmd-shift-a")
	sleep(400ms)
	insert(user.text or "")

file hunt [<user.text>]:
	key("cmd-shift-o")
	sleep(400ms)
	insert(user.text or "")

symbol hunt all [<user.text>]:
	key("cmd-alt-o")
	sleep(400ms)
	insert(user.text or "")

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

explore [<user.text>]:
	key('cmd-f12')
	sleep(400ms)
	insert(user.text or "")

quick fix [<user.text>]:
	key("alt-enter")
	sleep(400ms)
	insert(user.text or "")

rename [<user.text>]:
	key("shift-f6")
	sleep(400ms)
	insert(user.text or "")

refactor [<user.text>]:
	key("ctrl-t")
	sleep(400ms)
	insert(user.text or "")

complete:                   key("ctrl-space")
