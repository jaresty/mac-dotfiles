#movement
step:                       edit.word_right()
stepper:                    edit.line_end()
steppy:                     edit.right()
steppest:                   edit.file_end()
slink:                      edit.word_left()
slinker:                    edit.line_start()
slinky:                     edit.left()
slinkest:                   edit.file_start()
fly:                        edit.up()
fall:                       edit.down()

#deleting
punch:                      key("alt-delete")
puncher:                    key("cmd-delete")
punchy:                     key("delete")
punchest:
	edit.extend_file_end()
	edit.delete()
kick:                       key("alt-backspace")
kicker:                     key("cmd-backspace")
kicky:                      key("backspace")
kickest:
	edit.extend_file_start()
	edit.delete()

#selecting
snatch:                     key("alt-shift-right")
snatcher:                   key("cmd-shift-right")
snatchy:                    key("shift-right")
snatchest:                  edit.extend_file_end()
sweep:                      key("shift-down")
chance:                     key("alt-shift-left")
chancer:                    key("cmd-shift-left")
chancy:                     key("shift-left")
chancest:                   edit.extend_file_start()
dust:                       key("shift-up")
