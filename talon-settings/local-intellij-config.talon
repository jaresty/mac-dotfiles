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
gathest:
	key('cmd-alt-[')
	key('cmd-alt-shift-]')
wax: key("alt-up")
wane: key("alt-down")

drag down: key('shift-cmd-down')
drag up: key('shift-cmd-up')
steppest: key('cmd-alt-]')
slinkest: key('cmd-alt-[')
snatchest: key('cmd-alt-shift-]')
chancest: key('cmd-alt-shift-[')
punchest: key('cmd-alt-shift-] delete cmd-alt-l')
kickest: key('cmd-alt-shift-[ delete cmd-alt-l')
boomest:
	key('cmd-alt-[')
	key('cmd-alt-shift-]')
	sleep(60ms)
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

complete this: user.idea("action CodeCompletion")

teleport [<user.text>] [over]:
	key(cmd-shift-e)
	sleep(400ms)
	insert(user.text or "")

triage:
	user.idea("action GotoNextError")
	user.idea("action ShowIntentionActions")
triage last:
	user.idea("action GotoPreviousError")
	user.idea("action ShowIntentionActions")

run that: key('ctrl-r')
run last: key('ctrl-shift-r')

reference: user.idea("action FindUsages")
jump: key(cmd-alt-down)
jump last: key(cmd-alt-up)

narrow:
	key(cmd-shift--)
	key(cmd-=)
	key(cmd-alt-=)

widen:
	key(cmd-shift-+)

pop param: user.idea("action ParameterInfo")

rename <number> <user.text> [over]: user.idea("goto {number} 0,find next {text}, action RenameElement")
rename next <user.text> [over]: user.idea("find next {text}, action RenameElement")
rename last <user.text> [over]: user.idea("find prev {text}, action RenameElement")

complete <number> <user.text> [over]: user.idea("goto {number} 0,find next {text},action CodeCompletion")
complete next <user.text> [over]: user.idea("find next {text},action CodeCompletion")
complete last <user.text> [over]: user.idea("find prev {text},action CodeCompletion")

quick fix <number> <user.text> [over]: user.idea("goto {number} 0,find next {text},action ShowIntentionActions")
quick fix next <user.text> [over]: user.idea("find next {text},action ShowIntentionActions")
quick fix last <user.text> [over]: user.idea("find prev {text},action ShowIntentionActions")

change next: key(ctrl-shift-alt-down)
change last: key(ctrl-shift-alt-up)
problem next: user.idea("action GotoNextError")
problem last: user.idea("action GotoPreviousError")

follow <number> <user.text> [over]: user.idea("goto {number} 0,find next {text},action GotoDeclaration")
follow next <user.text> [over]: user.idea("find next {text},action GotoDeclaration")
follow last <user.text> [over]: user.idea("find prev {text},action GotoDeclaration")
follow split:
	user.idea("action SplitVertically,action GotoDeclaration")
follow split <number> <user.text> [over]: user.idea("action SplitVertically,goto {number} 0,find next {text},action GotoDeclaration")
follow split next <user.text> [over]: user.idea("action SplitVertically,find next {text},action GotoDeclaration")

reference <number> <user.text> [over]: user.idea("goto {number} 0,find next {text},action FindUsages")
reference next <user.text> [over]: user.idea("find next {text},action FindUsages")
reference last <user.text> [over]: user.idea("find prev {text},action FindUsages")

refactor <number> <user.text> [over]:
	user.idea("goto {number} 0,find next {text}, action Refactorings.QuickListPopupAction")

select <number> <user.text> [over]: user.idea("goto {number} 0,find next {text}")
go <number> <user.text> [over]: user.idea("goto {number} 0,find next {text}, action EditorRight")
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
