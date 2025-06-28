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

match plant: edit.paste_match_style()

trade jog:
	selected_text = edit.selected_text()
	edit.paste()
	sleep(50ms)
	clip.set_text(selected_text)

poke <user.keys> ong:
	user.poke_keys(keys_list)
poke <user.keys> onger:
	user.poker_keys(keys)
poke <user.keys> rog:
	user.repoke_keys(keys)

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

fling rog: key(shift-tab)
fling ong: key(tab)

find paste: edit.find(clip.text())

kemp [<user.text>] tap:
	user.complete_tap(text or "")
kemp [<user.text>] ong:
	user.complete_from_start(text or "", 1)
kemp [<user.text>] onger:
	user.complete_from_start(text or "", 1)
	edit.line_end()
kemp [<user.text>] {user.phrase_ender}:
	user.complete_from_start(text or "", 1)
	insert(phrase_ender or "")
kemp [<user.text>] <user.delimiter_pair>:
	user.complete_from_start(text or "", 1)
	user.delimiter_pair_insert(delimiter_pair)
kemp [<user.text>] <user.delimiter_pair> y:
	user.complete_from_start(text or "", 1)
	user.delimiter_pair_insert(delimiter_pair)
	edit.right()

kemped <user.word>+ [{user.phrase_ender}]:
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

molt <user.word> jog:
	insert(word)
	user.select_text_backward(word)
molt cap <user.word> jog:
	user.insert_formatted(word, "CAPITALIZE_FIRST_WORD")
	user.select_text_backward(word)
