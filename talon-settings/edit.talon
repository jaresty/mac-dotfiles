#movement to the right
onsteppy: edit.right()
onstep: edit.word_right()
onstepper: edit.line_end()
onstepperest: edit.paragraph_end()
onsteppest: edit.file_end()

midstep: user.line_middle()

#movement to the left
resteppy: edit.left()
restep: edit.word_left()
restepper: edit.line_start()
restepperest: edit.paragraph_start()
resteppest: edit.file_start()

#moving up and down
fly step: edit.up()
fly midstep:
	edit.up()
	user.line_middle()
fly stepper:
	edit.up()
	edit.line_start()
fly restepper:
	edit.up()
	edit.line_end()
fly snatch: edit.extend_line_up()
fly snatcher:
	edit.extend_line_up()
	edit.extend_line_start()
fly resnatcher:
	edit.extend_line_up()
	edit.extend_line_end()
fly bisnatcher:
	edit.line_end()
	edit.extend_up()
	edit.extend_line_start()

dip step: edit.down()
dip midstep:
	edit.down()
	user.line_middle()
dip stepper:
	edit.down()
	edit.line_end()
dip restepper:
	edit.down()
	edit.line_start()
dip snatch:
	edit.extend_down()
dip snatcher:
	edit.extend_down()
	edit.extend_line_end()
dip resnatcher:
	edit.extend_line_down()
	edit.extend_line_start()
dip bisnatcher:
	edit.line_start()
	edit.extend_down()
	edit.extend_line_end()

navi step: user.go_forward()
navi restep: user.go_back()

hunt step: edit.find_next()
hunt restep: edit.find_previous()

prob step: user.problem_next()
prob restep: user.problem_last()

<user.movement_type>: user.start_moving(movement_type)
perch: user.stop_moving()

<user.selection_action>: user.selection_action(selection_action)

size step: edit.zoom_in()
size restep: edit.zoom_out()
size reset: edit.zoom_reset()

folding step: user.fold_more()
folding restep: user.fold_less()

onpan: user.mouse_scroll_right()
repan: user.mouse_scroll_left()
fly pan: user.mouse_scroll_up()
dip pan: user.mouse_scroll_down()
fly panner:
	user.mouse_scroll_up()
	user.mouse_scroll_left()
fly repanner:
	user.mouse_scroll_up()
	user.mouse_scroll_right()
dip panner:
	user.mouse_scroll_down()
	user.mouse_scroll_right()
dip repanner:
	user.mouse_scroll_down()
	user.mouse_scroll_left()

#deleting forward
onpunchy: key("delete")
onpunch: key("alt-delete")
onpuncher: key("ctrl-k")
onpuncherest:
	edit.extend_paragraph_end()
	key("delete")
onpunchest:
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

#deleting up and down
fly punch:
	edit.extend_up()
	edit.delete()
fly puncher:
	edit.extend_up()
	edit.extend_line_start()
	edit.delete()

dip punch:
	edit.extend_down()
	edit.delete()
dip puncher:
	edit.extend_down()
	edit.extend_line_end()
	edit.delete()

#deleting forward and backward
bipunchy:
	key(delete)
	key(backspace)

bipunch:
	key(alt-delete)
	key(alt-backspace)
bipuncher: edit.delete_line()
bipuncherest: edit.delete_paragraph()
bipunchest:
	edit.select_all()
	sleep(60ms)
	edit.delete()
fly bipuncher:
	edit.delete_line()
	edit.up()
	edit.delete_line()
dip bipuncher:
	edit.delete_line()
	edit.down()
	edit.delete_line()

#selecting forward
onsnatchy: key("shift-right")
onsnatch: key("alt-shift-right")
onsnatchoid: key("alt-shift-right shift-right")
onsnatcher: key("cmd-shift-right")
onsnatcherest: edit.extend_paragraph_end()
onsnatchest: edit.extend_file_end()
onsnatchize: user.set_select_direction_right()

#selecting backward
resnatchy: key("shift-left")
resnatch: key("alt-shift-left")
resnatchoid: key("alt-shift-left shift-left")
resnatcher: key("cmd-shift-left")
resnatcherest: edit.extend_paragraph_start()
resnatchest: edit.extend_file_start()
resnatchize: user.set_select_direction_left()

bisnatch: edit.select_word()
bisnatcher: edit.select_line()
bisnatcherest: edit.select_paragraph()
bisnatchest: edit.select_all()

lift:
	edit.cut()
onlift:
	edit.extend_word_right()
	edit.cut()
relift:
	edit.extend_word_left()
	edit.cut()
onlifter:
	edit.extend_line_end()
	edit.cut()
bilifter:
	edit.select_line()
	edit.cut()
fly lift:
	edit.extend_up()
	edit.cut()
fly lifter:
	edit.extend_up()
	edit.extend_line_start()
	edit.cut()
fly bilifter:
	edit.line_end()
	edit.extend_up()
	edit.extend_line_start()
	edit.cut()
dip lift:
	edit.extend_down()
	edit.cut()
dip lifter:
	edit.extend_down()
	edit.extend_line_end()
	edit.cut()
dip bilifter:
	edit.line_start()
	edit.extend_down()
	edit.extend_line_end()
	edit.cut()

clip tap: key(cmd-alt-ctrl-shift-v)
place:
	edit.paste()
onplace:
	edit.extend_word_right()
	edit.paste()
replace:
	edit.extend_word_left()
	edit.paste()
onplacer:
	edit.extend_line_end()
	edit.paste()
replacer:
	edit.extend_line_start()
	edit.paste()
biplacer:
	edit.select_line()
	edit.paste()
biplacest:
	edit.select_all()
	edit.paste()
fly place:
	edit.line_insert_up()
	edit.paste()
dip place:
	edit.line_insert_down()
	edit.paste()

trade:
	selected_text = edit.selected_text()
	edit.paste()
	sleep(50ms)
	clip.set_text(selected_text)
ontrade:
	edit.extend_word_right()
	selected_text = edit.selected_text()
	edit.paste()
	sleep(50ms)
	clip.set_text(selected_text)
retrade:
	edit.extend_word_left()
	selected_text = edit.selected_text()
	edit.paste()
	sleep(50ms)
	clip.set_text(selected_text)
ontrader:
	edit.extend_line_end()
	selected_text = edit.selected_text()
	edit.paste()
	sleep(50ms)
	clip.set_text(selected_text)
retrader:
	edit.extend_line_start()
	selected_text = edit.selected_text()
	edit.paste()
	sleep(50ms)
	clip.set_text(selected_text)

trace:
	edit.copy()
ontrace:
	edit.extend_word_right()
	edit.copy()
retrace:
	edit.extend_word_left()
	edit.copy()
ontracer:
	edit.extend_line_end()
	edit.copy()
retracer:
	edit.extend_line_start()
	edit.copy()
bitracer:
	edit.select_line()
	edit.copy()
fly trace:
	edit.extend_up()
	edit.copy()
fly tracer:
	edit.extend_up()
	edit.extend_line_start()
	edit.copy()
fly bitracer:
	edit.line_start()
	edit.extend_up()
	edit.extend_line_start()
	edit.copy()
dip trace:
	edit.extend_down()
	edit.copy()
dip tracer:
	edit.extend_down()
	edit.extend_line_end()
	edit.copy()
dip bitracer:
	edit.line_start()
	edit.extend_down()
	edit.extend_line_end()
	edit.copy()

forge:
	edit.selection_clone()
onforge:
	edit.extend_word_right()
	edit.selection_clone()
reforge:
	edit.extend_word_left()
	edit.selection_clone()

onforger:
	edit.extend_line_end()
	forge_text = edit.selected_text()
	edit.line_insert_down()
	insert(forge_text)
	edit.line_start()
reforger:
	edit.extend_line_start()
	forge_text = edit.selected_text()
	edit.line_insert_up()
	insert(forge_text)
biforger:
	edit.select_line()
	forge_text = edit.selected_text()
	edit.line_insert_down()
	insert(forge_text)

fly forge:
	dodge_word = edit.selected_text()
	edit.line_insert_up()
	insert(dodge_word)

dip forge:
	dodge_word = edit.selected_text()
	edit.line_insert_down()
	insert(dodge_word)

fly dodge:
	dodge_word = edit.selected_text()
	edit.delete()
	edit.line_insert_up()
	insert(dodge_word)
fly dodger:
	edit.line_swap_up()

dip dodge:
	dodge_word = edit.selected_text()
	edit.delete()
	edit.line_insert_down()
	insert(dodge_word)
dip dodger:
	edit.line_swap_down()

onpush:
	insert(" ")
	edit.left()
onpusher:
	key(shift-enter)
	edit.up()
	edit.line_end()
repusher:
	edit.extend_line_end()
	text_to_move = edit.selected_text()
	key(delete)
	edit.line_insert_up()
	insert(text_to_move)

#break this line at the cursor and leave the cursor on a new line between the two halves
bipusher:
	key(shift-enter)
	key(shift-enter)
	edit.up()
# move the tail of the current line to the end of the previous line
fly pusher:
	edit.extend_line_end()
	text_to_move = edit.selected_text()
	key(delete)
	edit.up()
	edit.line_end()
	insert(text_to_move)
# move the head of the current line to the end of the previous line
fly repusher:
	key(shift-enter)
	edit.up()
	edit.up()
	edit.line_end()
	key(delete)
	edit.down()
	edit.line_start()
#join this line with the previous
fly bipusher:
	edit.up()
	edit.line_end()
	key(delete)
# move the tail of the current line to the tail of the next
dip pusher:
	edit.extend_line_end()
	text_to_move = edit.selected_text()
	key(delete)
	edit.down()
	edit.line_end()
	insert(text_to_move)
# move the head of the current line to the head of the next
dip repusher:
	edit.extend_line_start()
	text_to_move = edit.selected_text()
	key(delete)
	edit.down()
	edit.line_start()
	insert(text_to_move)

#join this line with the next
dip bipusher:
	edit.line_end()
	key(delete)
fly push:
	edit.line_insert_up()
dip push:
	edit.line_insert_down()

replant <user.keys>:
	edit.left()
	key(keys)
	edit.right()

onplant <user.keys>:
	key(keys)
	edit.left()

trail step:
	user.next_reference()
trail restep:
	user.last_reference()

pleet:
	user.complete()
repleet:
	user.complete_backward()

numeric step:
	user.numeric_increment()

numeric restep:
	user.numeric_decrement()
