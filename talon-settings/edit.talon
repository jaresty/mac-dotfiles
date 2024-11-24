#movement to the right
steppy: edit.right()
step: edit.word_right()
stepper: edit.line_end()
stepperest: edit.paragraph_end()
steppest: edit.file_end()

#movement to the left
slinky: edit.left()
slink: edit.word_left()
slinker: edit.line_start()
slinkerest: edit.paragraph_start()
slinkest: edit.file_start()

#moving up and down
fly: edit.up()
<user.movement_type>: user.start_moving(movement_type)
perch: user.stop_moving()
descend: edit.zoom_in()
ascend: edit.zoom_out()
standard: edit.zoom_reset()
dip: edit.down()

#diagonal movement
swoop:
	edit.up()
	edit.word_left()
drift:
	edit.down()
	edit.word_right()

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
kicky: key("backspace")
kick: key("alt-backspace")
kicker: key("cmd-backspace")
kickerest:
	edit.extend_paragraph_start()
	key("delete")
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
chancy: key("shift-left")
chance: key("alt-shift-left")
chansoid: key("alt-shift-left shift-left")
chancer: key("cmd-shift-left")
chancerest: edit.extend_paragraph_start()
chancest: edit.extend_file_start()
chancize: user.set_select_direction_left()

#selecting up and down
sweep: key("shift-down")
dust: key("shift-up")

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
