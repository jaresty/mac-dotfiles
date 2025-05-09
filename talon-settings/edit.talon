#movement to the right
onjogy: edit.right()
onjog: edit.word_right()
onrejog:
	edit.word_right()
	edit.word_right()
	edit.word_left()
onjoger: edit.line_end()
onrejoger:
	edit.line_end()
	edit.word_left()
onjogeroom: edit.paragraph_end()
onjogoom: edit.file_end()

midjog: user.line_middle()

#movement to the left
rejogy: edit.left()
rejog: edit.word_left()
reonjog:
	edit.word_left()
	edit.word_left()
	edit.word_right()
rejoger: edit.line_start()
reonjoger:
	edit.line_start()
	edit.word_right()
rejogeroom: edit.paragraph_start()
rejogoom: edit.file_start()

#moving up and down
fly clap:
	edit.up()
	key(enter)
fly jog: edit.up()
fly midjog:
	edit.up()
	user.line_middle()
fly joger:
	edit.up()
	edit.line_start()
fly rejoger:
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

dip jog: edit.down()
dip midjog:
	edit.down()
	user.line_middle()
dip joger:
	edit.down()
	edit.line_end()
dip rejoger:
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

nav jog: user.go_forward()
nav rejog: user.go_back()

hunt jog: edit.find_next()
hunt rejog: edit.find_previous()

<user.movement_type>: user.start_moving(movement_type)
perch: user.stop_moving()

<user.selection_action>: user.selection_action(selection_action)

mag jog: edit.zoom_in()
mag rejog: edit.zoom_out()
mag reset: edit.zoom_reset()

folding jog: user.fold_more()
folding rejog: user.fold_less()
folding rejogoom: user.unfold_recursively()

pan jog: user.mouse_scroll_right()
pan rejog: user.mouse_scroll_left()
pan fly jog: user.mouse_scroll_up()
pan dip jog: user.mouse_scroll_down()

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
pointer <user.word> molt:
	mouse_click()
	mouse_click()
	insert(word)
pointer <user.word> molter:
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
onpuncheroom:
	edit.extend_paragraph_end()
	key("delete")
onpunchoom:
	edit.extend_file_end()
	edit.delete()

#deleting backward
repunchy: key("backspace")
repunch: key("alt-backspace")
repuncher: key("cmd-backspace")
repuncheroom:
	edit.extend_paragraph_start()
	key("delete")
repunchoom:
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
bipuncheroom: edit.delete_paragraph()
bipunchoom:
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

pointer punch:
	mouse_click()
	mouse_click()
	key(backspace)
pointer puncher:
	mouse_click()
	mouse_click()
	mouse_click()
	key(backspace)

#selecting forward
onpicky: key("shift-right")
onpick: key("alt-shift-right")
onpickoid: key("alt-shift-right shift-right")
onpicker: key("cmd-shift-right")
onpickeroom: edit.extend_paragraph_end()
onpickoom: edit.extend_file_end()
onpickize: user.set_select_direction_right()

#selecting backward
repicky: key("shift-left")
repick: key("alt-shift-left")
repickoid: key("alt-shift-left shift-left")
repicker: key("cmd-shift-left")
repickeroom: edit.extend_paragraph_start()
repickoom: edit.extend_file_start()
repickize: user.set_select_direction_left()

bipick: edit.select_word()
bipicker: edit.select_line()
bipickeroom: edit.select_paragraph()
bipickoom: edit.select_all()

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
reliftoom:
	edit.extend_file_start()
	edit.cut()
bilift:
	edit.word_right()
	edit.extend_word_left()
	edit.cut()
onlifter:
	edit.extend_line_end()
	edit.cut()
onliftoom:
	edit.extend_file_end()
	edit.cut()
bilifter:
	edit.select_line()
	edit.cut()
biliftoom:
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
pointer lift:
	mouse_click()
	mouse_click()
	edit.cut()
pointer lifter:
	mouse_click()
	mouse_click()
	mouse_click()
	edit.cut()

clip tap: key(cmd-alt-ctrl-shift-v)
match plant: edit.paste_match_style()
plant:
	edit.paste()
onplant:
	edit.extend_word_right()
	edit.paste()
replant:
	edit.extend_word_left()
	edit.paste()
onplanter:
	edit.extend_line_end()
	edit.paste()
replanter:
	edit.extend_line_start()
	edit.paste()
biplanter:
	edit.select_line()
	edit.paste()
biplacoom:
	edit.select_all()
	edit.paste()
fly plant:
	edit.line_insert_up()
	edit.paste()
dip plant:
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

mem:
	edit.copy()
onmem:
	edit.extend_word_right()
	edit.copy()
remem:
	edit.extend_word_left()
	edit.copy()
onmemmer:
	edit.extend_line_end()
	edit.copy()
rememmer:
	edit.extend_line_start()
	edit.copy()
bimemmer:
	edit.select_line()
	edit.copy()
bimemoom:
	edit.select_all()
	edit.copy()
fly mem:
	edit.extend_up()
	edit.copy()
fly memmer:
	edit.extend_up()
	edit.extend_line_start()
	edit.copy()
fly bimemmer:
	edit.line_start()
	edit.extend_up()
	edit.extend_line_start()
	edit.copy()
dip mem:
	edit.extend_down()
	edit.copy()
dip memmer:
	edit.extend_down()
	edit.extend_line_end()
	edit.copy()
dip bimemmer:
	edit.line_start()
	edit.extend_down()
	edit.extend_line_end()
	edit.copy()
pointer mem:
	mouse_click()
	mouse_click()
	edit.copy()
pointer memmer:
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

pointer forge:
	mouse_click()
	edit.selection_clone()
pointer biforge:
	mouse_click()
	mouse_click()
	edit.selection_clone()
pointer forger:
	mouse_click()
	mouse_click()
	mouse_click()
	edit.selection_clone()

dodge fly jog:
	dodge_word = edit.selected_text()
	edit.delete()
	edit.line_insert_up()
	insert(dodge_word)
dodge fly joger:
	edit.line_swap_up()

dodge dip jog:
	dodge_word = edit.selected_text()
	edit.delete()
	edit.line_insert_down()
	insert(dodge_word)
dodge dip joger:
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

form <user.formatters> jog:
	user.formatters_reformat_selection(formatters)
	user.select_last_phrase()
form <user.formatters> onjoger:
	edit.extend_line_end()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
form <user.formatters> onrejoger:
	edit.extend_line_end()
	edit.extend_word_left()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
form <user.formatters> rejoger:
	edit.extend_line_start()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
form <user.formatters> reonjoger:
	edit.extend_line_start()
	edit.extend_word_right()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
form <user.formatters> onjog:
	edit.extend_word_right()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
form <user.formatters> rejog:
	edit.extend_word_left()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
form <user.formatters> bijog:
	edit.select_word()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)

phones jog:
	user.insert_next_homophone(true)
phones onjog:
	edit.extend_word_right()
	user.insert_next_homophone()
	edit.word_left()
phones rejog:
	edit.extend_word_left()
	user.insert_next_homophone()

deaf tap: user.tap_reference()
deaf jog:
	user.next_reference()
deaf rejog:
	user.last_reference()

context tap: key("ctrl-enter")
numeric jog:
	user.numeric_increment()

numeric rejog:
	user.numeric_decrement()

rejump: key(shift-tab)

find paste: edit.find(clip.text())

leet [<user.text>] tap:
	user.complete_tap(text or "")
leet [<user.text>] jog:
	user.complete_from_start(text or "", 1)
leet [<user.text>] joger:
	user.complete_from_start(text or "", 1)
	edit.line_end()
leet [<user.text>] {user.phrase_ender}:
	user.complete_from_start(text or "", 1)
	insert(phrase_ender or "")
leet [<user.text>] <user.delimiter_pair>:
	user.complete_from_start(text or "", 1)
	user.delimiter_pair_insert(delimiter_pair)
leet [<user.text>] <user.delimiter_pair> y:
	user.complete_from_start(text or "", 1)
	user.delimiter_pair_insert(delimiter_pair)
	edit.right()

leeted <user.word>+ [{user.phrase_ender}]:
	user.complete(word_list)
	insert(phrase_ender or "")

caper: key(escape escape)

golf [<user.any_alphanumeric_key>] jog: user.go_next_character(any_alphanumeric_key or "", 1)
golf [<user.any_alphanumeric_key>] rejog: user.go_previous_character(any_alphanumeric_key or "", 1)
golf [<user.any_alphanumeric_key>] jogy: user.go_next_character(any_alphanumeric_key or "", 0)
golf [<user.any_alphanumeric_key>] rejogy: user.go_previous_character(any_alphanumeric_key or "", 0)

golf [<user.any_alphanumeric_key>] pick: user.select_to_next_character(any_alphanumeric_keyor or "", 1)
golf [<user.any_alphanumeric_key>] repick: user.select_to_previous_character(any_alphanumeric_keyor or "", 1)
golf [<user.any_alphanumeric_key>] picky: user.select_to_next_character(any_alphanumeric_keyor or "", 0)
golf [<user.any_alphanumeric_key>] repicky: user.select_to_previous_character(any_alphanumeric_keyor or "", 0)

golf [<user.any_alphanumeric_key>] punch: user.delete_to_next_character(any_alphanumeric_keyor or "", 1)
golf [<user.any_alphanumeric_key>] repunch: user.delete_to_previous_character(any_alphanumeric_keyor or "", 1)
golf [<user.any_alphanumeric_key>] punchy: user.delete_to_next_character(any_alphanumeric_keyor or "", 0)
golf [<user.any_alphanumeric_key>] repunchy: user.delete_to_previous_character(any_alphanumeric_keyor or "", 0)

paint jog: user.go_next_paint(1)
paint jogy: user.go_next_paint(0)
paint rejog: user.go_previous_paint(1)
paint rejogy: user.go_previous_paint(0)
paint pick: user.select_to_next_paint(1)
paint picky: user.select_to_next_paint(0)
paint repick: user.select_to_previous_paint(1)
paint repicky: user.select_to_previous_paint(0)
paint punch: user.delete_to_next_paint(1)
paint punchy: user.delete_to_next_paint(0)
paint repunch: user.delete_to_previous_paint(1)
paint repunchy: user.delete_to_previous_paint(0)
