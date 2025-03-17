#movement to the right
onwalky: edit.right()
onwalk: edit.word_right()
onrewalk:
	edit.word_right()
	edit.word_right()
	edit.word_left()
onwalker: edit.line_end()
onwalkerest: edit.paragraph_end()
onwalkest: edit.file_end()

midwalk: user.line_middle()

#movement to the left
rewalky: edit.left()
rewalk: edit.word_left()
reonwalk:
	edit.word_left()
	edit.word_left()
	edit.word_right()
rewalker: edit.line_start()
rewalkerest: edit.paragraph_start()
rewalkest: edit.file_start()

#moving up and down
fly walk: edit.up()
fly midwalk:
	edit.up()
	user.line_middle()
fly walker:
	edit.up()
	edit.line_start()
fly rewalker:
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

dip walk: edit.down()
dip midwalk:
	edit.down()
	user.line_middle()
dip walker:
	edit.down()
	edit.line_end()
dip rewalker:
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

navi walk: user.go_forward()
navi rewalk: user.go_back()

hunt walk: edit.find_next()
hunt rewalk: edit.find_previous()

<user.movement_type>: user.start_moving(movement_type)
perch: user.stop_moving()

<user.selection_action>: user.selection_action(selection_action)

size walk: edit.zoom_in()
size rewalk: edit.zoom_out()
size reset: edit.zoom_reset()

folding walk: user.fold_more()
folding rewalk: user.fold_less()
folding rewalkest: user.unfold_recursively()

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

onmolt <user.word>:
	key("alt-delete")
	insert(word)
remolt <user.word>:
	key("alt-backspace")
	insert(word)
bimolt <user.word>:
	edit.select_word()
	key(delete)
	insert(word)

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
reliftest:
	edit.extend_file_start()
	edit.cut()
bilift:
	edit.word_right()
	edit.extend_word_left()
	edit.cut()
onlifter:
	edit.extend_line_end()
	edit.cut()
onliftest:
	edit.extend_file_end()
	edit.cut()
bilifter:
	edit.select_line()
	edit.cut()
biliftest:
	edit.select_all()
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
bitracest:
	edit.select_all()
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
	edit.selection_clone()
reforger:
	edit.extend_line_start()
	edit.selection_clone()
biforger:
	edit.select_line()
	edit.selection_clone()

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

on <user.keys> push:
	user.push_keys(keys_list)
on push:
	user.push_keys()
on <user.keys> pusher:
	user.pusher_keys(keys)
on pusher:
	user.pusher_keys()
re <user.keys> push:
	user.repush_keys(keys)
re push:
	user.repush_keys()

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

deaf tap: user.tap_reference()
deaf walk:
	user.next_reference()
deaf rewalk:
	user.last_reference()

context tap: key("ctrl-enter")
numeric walk:
	user.numeric_increment()

numeric rewalk:
	user.numeric_decrement()

reswing: key(shift-tab)

find paste: edit.find(clip.text())

lee [<user.spoken_search>] tap:
	user.complete_tap(spoken_search or "")
lee [<user.spoken_search>] walk:
	user.complete_from_start(spoken_search or "", 1)

completer <user.word>+ walk:
	user.complete(word_list)
