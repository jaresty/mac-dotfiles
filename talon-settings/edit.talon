#movement
step:                       edit.word_right()
stepper:                    edit.line_end()
steppy:                     edit.right()
slink:                      edit.word_left()
slinker:                    edit.line_start()
slinky:                     edit.left()
fly:                        edit.up()
fall:                       edit.down()

#deleting
punch:
	edit.extend_word_right()
	edit.delete()
puncher:                    user.delete_line_end()
punchy:                     user.delete_right()
chomp:
	edit.extend_word_left()
	edit.delete()
chomper:                    user.delete_line_start()
chompy:                     edit.delete()

#selecting
snatch:                     edit.extend_word_right()
snatcher:                   edit.extend_line_end()
snatchy:                    edit.extend_right()
sweep:                      edit.extend_line_down()
chance:                     edit.extend_word_left()
chancer:                    edit.extend_line_start()
chancy:                     edit.extend_left()
dust:                       edit.extend_line_up()
