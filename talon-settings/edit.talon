#movement to the right
onwalky: edit.right()
onwalk: edit.word_right()
onrewalk:
	edit.word_right()
	edit.word_right()
	edit.word_left()
onwalker: edit.line_end()
onrewalker:
	edit.line_end()
	edit.word_left()
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
reonwalker:
	edit.line_start()
	edit.word_right()
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
fly pick: edit.extend_line_up()
fly picker:
	edit.extend_line_up()
	edit.extend_line_start()
fly repicker:
	edit.extend_line_up()
	edit.extend_line_end()
fly bipicker:
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
dip pick:
	edit.extend_down()
dip picker:
	edit.extend_down()
	edit.extend_line_end()
dip repicker:
	edit.extend_line_down()
	edit.extend_line_start()
dip bipicker:
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

on <user.word> molt:
	key("alt-delete")
	insert(word)
re <user.word> molt:
	key("alt-backspace")
	insert(word)
bi <user.word> molt:
	edit.select_word()
	key(delete)
	insert(word)
mouse <user.word> molt:
	mouse_click()
	mouse_click()
	insert(word)
mouse <user.word> molter:
	mouse_click()
	mouse_click()
	mouse_click()
	insert(word)
	key(enter)
	edit.up()
	edit.line_end()

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

mouse punch:
	mouse_click()
	mouse_click()
	key(backspace)
mouse puncher:
	mouse_click()
	mouse_click()
	mouse_click()
	key(backspace)

#selecting forward
onpicky: key("shift-right")
onpick: key("alt-shift-right")
onpickoid: key("alt-shift-right shift-right")
onpicker: key("cmd-shift-right")
onpickerest: edit.extend_paragraph_end()
onpickest: edit.extend_file_end()
onpickize: user.set_select_direction_right()

#selecting backward
repicky: key("shift-left")
repick: key("alt-shift-left")
repickoid: key("alt-shift-left shift-left")
repicker: key("cmd-shift-left")
repickerest: edit.extend_paragraph_start()
repickest: edit.extend_file_start()
repickize: user.set_select_direction_left()

bipick: edit.select_word()
bipicker: edit.select_line()
bipickerest: edit.select_paragraph()
bipickest: edit.select_all()

lift:
	edit.cut()
onlift:
	edit.extend_word_right()
	edit.cut()
relift:
	edit.extend_word_left()
	edit.cut()
relifter:
	edit.extend_line_start()
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
mouse lift:
	mouse_click()
	edit.cut()
mouse bilift:
	mouse_click()
	mouse_click()
	edit.cut()
mouse lifter:
	mouse_click()
	mouse_click()
	mouse_click()
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
mouse trace:
	mouse_click()
	edit.copy()
mouse bitrace:
	mouse_click()
	mouse_click()
	edit.copy()
mouse tracer:
	mouse_click()
	mouse_click()
	mouse_click()
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

mouse forge:
	mouse_click()
	edit.selection_clone()
mouse biforge:
	mouse_click()
	mouse_click()
	edit.selection_clone()
mouse forger:
	mouse_click()
	mouse_click()
	mouse_click()
	edit.selection_clone()

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

on <user.keys> poke:
	user.poke_keys(keys_list)
on poke:
	user.poke_keys()
on <user.keys> poker:
	user.poker_keys(keys)
on poker:
	user.poker_keys()
re <user.keys> poke:
	user.repoke_keys(keys)
re poke:
	user.repoke_keys()

#break this line at the cursor and leave the cursor on a new line between the two halves
bipoker:
	key(shift-enter)
	key(shift-enter)
	edit.up()
# move the tail of the current line to the end of the previous line
fly poker:
	edit.extend_line_end()
	text_to_move = edit.selected_text()
	key(delete)
	edit.up()
	edit.line_end()
	insert(text_to_move)
# move the head of the current line to the end of the previous line
fly repoker:
	key(shift-enter)
	edit.up()
	edit.up()
	edit.line_end()
	key(delete)
	edit.down()
	edit.line_start()
#join this line with the previous
fly bipoker:
	edit.up()
	edit.line_end()
	key(delete)
# move the tail of the current line to the tail of the next
dip poker:
	edit.extend_line_end()
	text_to_move = edit.selected_text()
	key(delete)
	edit.down()
	edit.line_end()
	insert(text_to_move)
# move the head of the current line to the head of the next
dip repoker:
	edit.extend_line_start()
	text_to_move = edit.selected_text()
	key(delete)
	edit.down()
	edit.line_start()
	insert(text_to_move)

#join this line with the next
dip bipoker:
	edit.line_end()
	key(delete)
fly poke:
	edit.line_insert_up()
dip poke:
	edit.line_insert_down()

<user.formatters> onformer:
	edit.extend_line_end()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
<user.formatters> onreformer:
	edit.extend_line_end()
	edit.extend_word_left()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
<user.formatters> reformer:
	edit.extend_line_start()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
<user.formatters> reonformer:
	edit.extend_line_start()
	edit.extend_word_right()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
<user.formatters> onform:
	edit.extend_word_right()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
<user.formatters> reform:
	edit.extend_word_left()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
<user.formatters> biform:
	edit.select_word()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)

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

scaper: key(escape escape)
