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

teleport [<user.text>] [over]:
	key(cmd-shift-e)
	sleep(400ms)
	insert(user.text or "")

rescue:                     key(f2)
rescue last:                key(shift-f2)
repair:                     key(alt-enter)
