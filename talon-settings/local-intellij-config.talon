# Requires https://plugins.jetbrains.com/plugin/10504-voice-code-idea
app: jetbrains
-
settings():
	key_wait = 2

please [<user.text>] [over]:
	key("cmd-shift-a")
	sleep(400ms)
	insert(user.text or "")

file hunt [<user.text>] [over]:
	key("cmd-shift-o")
	sleep(400ms)
	insert(user.text or "")

# File Commands
docs [<user.text>] [{user.file_extension}] [over]:
	key("cmd-shift-o")
	sleep(400ms)
	insert(text or "")
	insert(file_extension or "")
	sleep(300ms)
docs pop <user.text> [{user.file_extension}] [over]:
	user.idea("action RecentFiles")
	sleep(400ms)
	insert(text or "")
	insert(file_extension or "")
	sleep(300ms)
	key(enter)
	sleep(150ms)
docs split <user.text> [{user.file_extension}] [over]:
	key("cmd-shift-o")
	sleep(400ms)
	insert(text or "")
	insert(file_extension or "")
	sleep(300ms)
	key(shift-enter)
docs pop:
	key(ctrl-tab)
pop alter:
	user.idea("action GotoTest")
	key(enter)
split alter:
	user.idea("action GotoTest")
	key(shift-enter)

symbol hunt all [<user.text>] [over]:
	key("cmd-alt-o")
	sleep(400ms)
	insert(user.text or "")

explore [<user.text>] [over]:
	key("cmd-f12")
	sleep(400ms)
	insert(user.text or "")
splitter: key("alt-tab")
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
gatherest:
	key('cmd-alt-[')
	key('cmd-alt-shift-]')
gathest:
	key('cmd-a')
wax: key("alt-up")
wane: key("alt-down")

drag down: key('shift-cmd-down')
drag up: key('shift-cmd-up')
steppest: edit.file_end()
steppier: user.camel_right()
stepperest: key('cmd-alt-]')
slinkier: user.camel_left()
slinkerest: key('cmd-alt-[')
slinkest: edit.file_start()
snatcherest: key('cmd-alt-shift-]')
snatchest: edit.extend_file_end()
chancerest: key('cmd-alt-shift-[')
chancest: edit.extend_file_start()
puncherest: key('cmd-alt-shift-] delete cmd-alt-l')
punchest:
	edit.extend_file_end()
	edit.delete()
kickerest: key('cmd-alt-shift-[ delete cmd-alt-l')
kickest:
	edit.extend_file_start()
	edit.delete()
boomerest:
	key('cmd-alt-[')
	key('cmd-alt-shift-]')
	sleep(60ms)
	edit.delete()
boomest:
	edit.select_all()
	edit.delete()

(symbol hunt | jump) [<user.text>] [over]:
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

complete this: user.idea("action CodeCompletion")

^scry [<user.text>] [over]:
	key(cmd-shift-e)
	sleep(400ms)
	insert(user.text or "")

^lookup [<user.text>] [over]:
	user.idea("action GotoSymbol")
	insert(text)
	key("enter")

track:
	user.idea("action FindUsagesInFile")

track next:
	key("ctrl-alt-down")

track last:
	key("ctrl-alt-up")

triage:
	user.idea("action GotoNextError")
	user.idea("action ShowIntentionActions")
triage last:
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

widen:
	key(cmd-shift-+)

pop param: user.idea("action ParameterInfo")

quaff: user.idea("action ShowIntentionActions")
quaff <number> <user.text> [over]: user.idea("goto {number} 0,find next {text},action ShowIntentionActions")
quaff next <user.text> [over]: user.idea("find next {text},action ShowIntentionActions")
quaff last <user.text> [over]: user.idea("find prev {text},action ShowIntentionActions")

change next: key(ctrl-shift-alt-down)
change last: key(ctrl-shift-alt-up)
problem next: user.idea("action GotoNextError")
problem last: user.idea("action GotoPreviousError")

follow split:
	user.idea("action SplitVertically,action GotoDeclaration")
follow split <number> <user.text> [over]: user.idea("action SplitVertically,goto {number} 0,find next {text},action GotoDeclaration")
follow split next <user.text> [over]: user.idea("action SplitVertically,find next {text},action GotoDeclaration")

wax <number> <user.text> [over]:
	user.idea("goto {number} 0,find next {text}")
	key("alt-up")
wax next <user.text> [over]:
	user.idea("find next {text}")
	key("alt-up")
wax last <user.text> [over]:
	user.idea("find last {text}")
	key("alt-up")
split window:
	user.idea("action SplitVertically")

split right:
	user.idea("action SplitVertically")

pusher:
	key(enter)
	edit.up()
	edit.line_end()
