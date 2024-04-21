#movement to the right
steppy:                     edit.right()
step:                       edit.word_right()
stepper:                    edit.line_end()
steppest:                   edit.file_end()

#movement to the left
slinky:                     edit.left()
slink:                      edit.word_left()
slinker:                    edit.line_start()
slinkest:                   edit.file_start()

#moving up and down
fly:                        edit.up()
fall:                       edit.down()

#deleting forward
punchy:                     key("delete")
punch:                      key("alt-delete")
puncher:                    key("ctrl-k")
punchest:
	edit.extend_file_end()
	edit.delete()

#deleting backward
kicky:                      key("backspace")
kick:                       key("alt-backspace")
kicker:                     key("cmd-backspace")
kickest:
	edit.extend_file_start()
	edit.delete()

#deleting forward and backward
boomy:
	key(delete)
	key(backspace)
boom:
	key(alt-delete)
	key(alt-backspace)
boomer:                     edit.delete_line()
boomest:
	edit.select_all()
	edit.delete()

#selecting forward
snatchy:                    key("shift-right")
snatch:                     key("alt-shift-right")
snatcher:                   key("cmd-shift-right")
snatchest:                  edit.extend_file_end()

#selecting backward
chancy:                     key("shift-left")
chance:                     key("alt-shift-left")
chancer:                    key("cmd-shift-left")
chancest:                   edit.extend_file_start()

#selecting up and down
sweep:                      key("shift-down")
dust:                       key("shift-up")

#selecting both directions
gather:                     edit.select_line()
gathest:                    edit.select_all()
