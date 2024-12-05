# Requires https://plugins.jetbrains.com/plugin/10504-voice-code-idea
app: jetbrains
-
settings():
	key_wait = 15
	user.paste_to_insert_threshold = 10

please [<user.text>] [over]:
	key("cmd-shift-a")
	sleep(400ms)
	insert(user.text or "")

# File Commands
file step [<user.text>] [{user.file_extension}] [over]:
	key("cmd-shift-o")
	sleep(400ms)
	insert(text or "")
	insert(file_extension or "")
	sleep(300ms)
file stepper <user.text> [{user.file_extension}] [over]:
	user.idea("action RecentFiles")
	sleep(400ms)
	insert(text or "")
	insert(file_extension or "")
	sleep(300ms)
	key(enter)
	sleep(150ms)
file split step <user.text> [{user.file_extension}] [over]:
	key("cmd-shift-o")
	sleep(400ms)
	insert(text or "")
	insert(file_extension or "")
	sleep(300ms)
	key(shift-enter)
file restep:
	key(ctrl-tab)
alter step:
	user.idea("action GotoTest")
	key(enter)
alter stepper:
	user.idea("action GotoTest")
	key(shift-enter)

split step: key("alt-tab")

bisnatcherest:
	key('cmd-alt-[')
	key('cmd-alt-shift-]')
bisnatchest:
	key('cmd-a')
wax: user.wax()
wane: user.wane()

steppest: edit.()
stepperest: key('cmd-alt-]')
restepperest: key('cmd-alt-[')
resteppest: edit.file_start()
snatcherest: key('cmd-alt-shift-]')
snatchest: edit.extend_file_end()
resnatcherest: key('cmd-alt-shift-[')
resnatchest: edit.extend_file_start()
puncherest: key('cmd-alt-shift-] delete cmd-alt-l')
punchest:
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

^text peek [<user.text>] [over]:
	key(cmd-shift-e)
	sleep(400ms)
	insert(user.text or "")

^symbol peeker [<user.text>] [over]:
	user.idea("action GotoSymbol")
	insert(text)
	key("enter")

symbol peek [<user.text>] [over]:
	key("cmd-f12")
	sleep(400ms)
	insert(user.text or "")

jest: user.idea("action CodeCompletion")

quack step:
	user.idea("action GotoNextError")
	user.idea("action ShowIntentionActions")
quack restep:
	user.idea("action GotoPreviousError")
	user.idea("action ShowIntentionActions")

run that: key('ctrl-r')
run last: key('ctrl-shift-r')

reference: user.idea("action FindUsages")
ref next: key(cmd-alt-down)
ref last: key(cmd-alt-up)

narrow:
	key(cmd-shift--)
	key(cmd-=)
	key(cmd-alt-=)

pop param: user.idea("action ParameterInfo")

quack: user.idea("action ShowIntentionActions")
quack <number> <user.text> [over]: user.idea("goto {number} 0,find next {text},action ShowIntentionActions")
quack next <user.text> [over]: user.idea("find next {text},action ShowIntentionActions")
quack last <user.text> [over]: user.idea("find prev {text},action ShowIntentionActions")

change step: key(ctrl-shift-alt-down)
change restep: key(ctrl-shift-alt-up)

spiffy:
	user.idea("action SplitVertically,action GotoDeclaration")
spiffy <number> <user.text> [over]: user.idea("action SplitVertically,goto {number} 0,find next {text},action GotoDeclaration")
spiffy next <user.text> [over]: user.idea("action SplitVertically,find next {text},action GotoDeclaration")

wax <number> <user.text> [over]:
	user.idea("goto {number} 0,find next {text}")
	key("alt-up")
wax next <user.text> [over]:
	user.idea("find next {text}")
	key("alt-up")
wax last <user.text> [over]:
	user.idea("find last {text}")
	key("alt-up")
spindow:
	user.idea("action SplitVertically")

pusher:
	key(enter)
	edit.up()
	edit.line_end()
