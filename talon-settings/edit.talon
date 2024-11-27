#movement to the right
steppy: edit.right()
step: edit.word_right()
stepper: edit.line_end()
stepperest: edit.paragraph_end()
steppest: edit.file_end()
stepmid: user.line_middle()

#movement to the left
resteppy: edit.left()
restep: edit.word_left()
restepper: edit.line_start()
restepperest: edit.paragraph_start()
resteppest: edit.file_start()

#moving up and down
fly step: edit.up()
fly stepmid:
	edit.up()
	user.line_middle()
fly stepper:
	edit.up()
	edit.line_start()
fly snatch: edit.extend_line_up()

dip step: edit.down()
dip stepmid:
	edit.down()
	user.line_middle()
dip stepper:
	edit.down()
	edit.line_end()
dip snatch:
	edit.extend_down()

hunt step: edit.find_next()
hunt restep: edit.find_last()

prob step: user.problem_next()
prob restep: user.problem_last()

<user.movement_type>: user.start_moving(movement_type)
perch: user.stop_moving()
descend: edit.zoom_in()
ascend: edit.zoom_out()
standard: edit.zoom_reset()

#deleting forward
punchy: key("delete")
punch: key("alt-delete")
puncher: key("ctrl-k")
puncherest:
	edit.extend_paragraph_end()
	key("delete")
punchest:
	edit.extend_file_end()
	edit.delete()

#deleting backward
repunchy: key("backspace")
repunch: key("alt-backspace")
repuncher: key("cmd-backspace")
repuncherest:
	edit.extend_paragraph_start()
	key("delete")
repunchest:
	edit.extend_file_start()
	edit.delete()

#deleting forward and backward
boomy:
	key(delete)
	key(backspace)

boom:
	key(alt-delete)
	key(alt-backspace)
boomer: edit.delete_line()
boomerest: edit.delete_paragraph()
boomest:
	edit.select_all()
	sleep(60ms)
	edit.delete()

#selecting forward
snatchy: key("shift-right")
snatch: key("alt-shift-right")
snatchoid: key("alt-shift-right shift-right")
snatcher: key("cmd-shift-right")
snatcherest: edit.extend_paragraph_end()
snatchest: edit.extend_file_end()
snatchize: user.set_select_direction_right()

#selecting backward
resnatchy: key("shift-left")
resnatch: key("alt-shift-left")
resnatchoid: key("alt-shift-left shift-left")
resnatcher: key("cmd-shift-left")
resnatcherest: edit.extend_paragraph_start()
resnatchest: edit.extend_file_start()
resnatchize: user.set_select_direction_left()

#selecting both directions
gather: edit.select_line()
gatherest: edit.select_paragraph()
gathest: edit.select_all()

# Moving characters after the cursor
push:
	insert(" ")
	edit.left()
pusher:
	key(shift-enter)
	edit.up()
	edit.line_end()

toss <user.keys>:
	edit.left()
	key(keys)
	edit.right()

lift:
	edit.cut()

place:
	edit.paste()

trace:
	edit.copy()

forge:
	edit.selection_clone()

flier:
	edit.line_swap_up()

dipper:
	edit.line_swap_down()

climb:
	edit.line_insert_up()

dig:
	edit.line_insert_down()
