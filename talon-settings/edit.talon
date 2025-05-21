#movement to the right
<user.move>: user.invoke_move(move)

<user.movement_type>: user.start_moving(movement_type)
perch: user.stop_moving()

<user.selection_action>: user.selection_action(selection_action)

zoom reset: edit.zoom_reset()

molt <user.word> ong:
	key("alt-delete")
	insert(word)
molt <user.word> rog:
	key("alt-backspace")
	insert(word)
molt <user.word> bog:
	edit.select_word()
	key(delete)
	insert(word)
molt <user.word> point:
	mouse_click()
	mouse_click()
	insert(word)
molt <user.word> pointer:
	mouse_click()
	mouse_click()
	mouse_click()
	insert(word)
	key(enter)
	edit.up()
	edit.line_end()

#selecting forward
pick ongize: user.set_select_direction_right()

#selecting backward
pick regize: user.set_select_direction_left()

clip tap: key(cmd-alt-ctrl-shift-v)
match plant: edit.paste_match_style()
plant jog:
	edit.paste()
plant ong:
	edit.extend_word_right()
	edit.paste()
plant rog:
	edit.extend_word_left()
	edit.paste()
plant onger:
	edit.extend_line_end()
	edit.paste()
plant rogger:
	edit.extend_line_start()
	edit.paste()
plant boger:
	edit.select_line()
	edit.paste()
plant bogoom:
	edit.select_all()
	edit.paste()
plant fog:
	edit.line_insert_up()
	edit.paste()
plant dig:
	edit.line_insert_down()
	edit.paste()

trade:
	selected_text = edit.selected_text()
	edit.paste()
	sleep(50ms)
	clip.set_text(selected_text)

mem jog:
	edit.copy()
mem ong:
	edit.extend_word_right()
	edit.copy()
mem rog:
	edit.extend_word_left()
	edit.copy()
mem onger:
	edit.extend_line_end()
	edit.copy()
mem rogger:
	edit.extend_line_start()
	edit.copy()
mem boger:
	edit.select_line()
	edit.copy()
mem bogoom:
	edit.select_all()
	edit.copy()
mem fog:
	edit.extend_up()
	edit.copy()
mem fogger:
	edit.extend_up()
	edit.extend_line_start()
	edit.copy()
mem bifogger:
	edit.line_start()
	edit.extend_up()
	edit.extend_line_start()
	edit.copy()
mem dig:
	edit.extend_down()
	edit.copy()
mem digger:
	edit.extend_down()
	edit.extend_line_end()
	edit.copy()
mem bidigger:
	edit.line_start()
	edit.extend_down()
	edit.extend_line_end()
	edit.copy()
mem point:
	mouse_click()
	mouse_click()
	edit.copy()
mem pointer:
	mouse_click()
	mouse_click()
	mouse_click()
	edit.copy()

forge:
	edit.selection_clone()
forge ong:
	edit.extend_word_right()
	edit.selection_clone()
forge rog:
	edit.extend_word_left()
	edit.selection_clone()

forge onger:
	edit.extend_line_end()
	edit.selection_clone()
for rogger:
	edit.extend_line_start()
	edit.selection_clone()
forge boger:
	edit.select_line()
	edit.selection_clone()

forge fog:
	dodge_word = edit.selected_text()
	edit.line_insert_up()
	insert(dodge_word)

forge dig:
	dodge_word = edit.selected_text()
	edit.line_insert_down()
	insert(dodge_word)

dodge fog:
	dodge_word = edit.selected_text()
	edit.delete()
	edit.line_insert_up()
	insert(dodge_word)
dodge fogger:
	edit.line_swap_up()

dodge dig:
	dodge_word = edit.selected_text()
	edit.delete()
	edit.line_insert_down()
	insert(dodge_word)
dodge digger:
	edit.line_swap_down()

poke <user.keys> ong:
	user.poke_keys(keys_list)
poke ong:
	user.poke_keys()
poke <user.keys> onger:
	user.poker_keys(keys)
poke onger:
	user.poker_keys()
poke <user.keys> rog:
	user.repoke_keys(keys)
poke rog:
	user.repoke_keys()

poke fog:
	edit.line_insert_up()
poke dig:
	edit.line_insert_down()

form <user.formatters> jog:
	user.formatters_reformat_selection(formatters)
	user.select_last_phrase()
form <user.formatters> onger:
	edit.extend_line_end()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
form <user.formatters> onrogger:
	edit.extend_line_end()
	edit.extend_word_left()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
form <user.formatters> rogger:
	edit.extend_line_start()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
form <user.formatters> reonger:
	edit.extend_line_start()
	edit.extend_word_right()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
form <user.formatters> ong:
	edit.extend_word_right()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
form <user.formatters> rog:
	edit.extend_word_left()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
form <user.formatters> bijog:
	edit.select_word()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)

phones jog:
	user.insert_next_homophone(true)
phones ong:
	edit.extend_word_right()
	user.insert_next_homophone()
	edit.word_left()
phones rog:
	edit.extend_word_left()
	user.insert_next_homophone()

deaf tap: user.tap_reference()
deaf ong:
	user.next_reference()
deaf rog:
	user.last_reference()

context tap: key("ctrl-enter")
numeric ong:
	user.numeric_increment()

numeric rog:
	user.numeric_decrement()

rejump: key(shift-tab)

find paste: edit.find(clip.text())

cleet [<user.text>] tap:
	user.complete_tap(text or "")
cleet [<user.text>] ong:
	user.complete_from_start(text or "", 1)
cleet [<user.text>] onger:
	user.complete_from_start(text or "", 1)
	edit.line_end()
cleet [<user.text>] {user.phrase_ender}:
	user.complete_from_start(text or "", 1)
	insert(phrase_ender or "")
cleet [<user.text>] <user.delimiter_pair>:
	user.complete_from_start(text or "", 1)
	user.delimiter_pair_insert(delimiter_pair)
cleet [<user.text>] <user.delimiter_pair> y:
	user.complete_from_start(text or "", 1)
	user.delimiter_pair_insert(delimiter_pair)
	edit.right()

cleeted <user.word>+ [{user.phrase_ender}]:
	user.complete(word_list)
	insert(phrase_ender or "")

caper: key(escape escape)

golf [<user.any_alphanumeric_key>] ong: user.go_next_character(any_alphanumeric_key or "", 1)
golf [<user.any_alphanumeric_key>] rog: user.go_previous_character(any_alphanumeric_key or "", 1)
golf [<user.any_alphanumeric_key>] ongy: user.go_next_character(any_alphanumeric_key or "", 0)
golf [<user.any_alphanumeric_key>] roggy: user.go_previous_character(any_alphanumeric_key or "", 0)

pick golf [<user.any_alphanumeric_key>] ong: user.select_to_next_character(any_alphanumeric_keyor or "", 1)
pick golf [<user.any_alphanumeric_key>] rog: user.select_to_previous_character(any_alphanumeric_keyor or "", 1)
pick golf [<user.any_alphanumeric_key>] ongy: user.select_to_next_character(any_alphanumeric_keyor or "", 0)
pick golf [<user.any_alphanumeric_key>] roggy: user.select_to_previous_character(any_alphanumeric_keyor or "", 0)

kick golf [<user.any_alphanumeric_key>] ong: user.delete_to_next_character(any_alphanumeric_keyor or "", 1)
kick golf [<user.any_alphanumeric_key>] rog: user.delete_to_previous_character(any_alphanumeric_keyor or "", 1)
kick golf [<user.any_alphanumeric_key>] ongy: user.delete_to_next_character(any_alphanumeric_keyor or "", 0)
kick golf [<user.any_alphanumeric_key>] roggy: user.delete_to_previous_character(any_alphanumeric_keyor or "", 0)

paint ong: user.go_next_paint(1)
paint ongy: user.go_next_paint(0)
paint rog: user.go_previous_paint(1)
paint roggy: user.go_previous_paint(0)
pick paint ong: user.select_to_next_paint(1)
pick paint ongy: user.select_to_next_paint(0)
pick paint rog: user.select_to_previous_paint(1)
pick paint roggy: user.select_to_previous_paint(0)
kick paint ong: user.delete_to_next_paint(1)
kick paint rog: user.delete_to_next_paint(0)
kick paint ongy: user.delete_to_previous_paint(1)
kick paint roggy: user.delete_to_previous_paint(0)
