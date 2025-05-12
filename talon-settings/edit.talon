#movement to the right
ongy: edit.right()
ong: edit.word_right()
onger: edit.line_end()
ongeroom: edit.paragraph_end()
ongoom: edit.file_end()

midjog: user.line_middle()

#movement to the left
rogy: edit.left()
rog: edit.word_left()
roger: edit.line_start()
rogeroom: edit.paragraph_start()
rogoom: edit.file_start()

#moving up and down
fog: edit.up()
fly midjog:
	edit.up()
	user.line_middle()
foger:
	edit.up()
	edit.line_start()
fly roger:
	edit.up()
	edit.line_end()
pick fog: edit.extend_line_up()
pick foger:
	edit.extend_line_up()
	edit.extend_line_start()
pick roger:
	edit.extend_line_up()
	edit.extend_line_end()
pick bifoger:
	edit.line_end()
	edit.extend_up()
	edit.extend_line_start()

dig: edit.down()
dip midjog:
	edit.down()
	user.line_middle()
diger:
	edit.down()
	edit.line_end()
dip roger:
	edit.down()
	edit.line_start()
pick dig:
	edit.extend_down()
pick diger:
	edit.extend_down()
	edit.extend_line_end()
pick rediger:
	edit.extend_line_down()
	edit.extend_line_start()
pick bidiger:
	edit.line_start()
	edit.extend_down()
	edit.extend_line_end()

nav ong: user.go_forward()
nav rog: user.go_back()

hunt ong: edit.find_next()
hunt rog: edit.find_previous()

<user.movement_type>: user.start_moving(movement_type)
perch: user.stop_moving()

<user.selection_action>: user.selection_action(selection_action)

mag ong: edit.zoom_in()
mag rog: edit.zoom_out()
mag reset: edit.zoom_reset()

folding ong: user.fold_more()
folding rog: user.fold_less()
folding rogoom: user.unfold_recursively()

look ong: user.mouse_scroll_right()
look rog: user.mouse_scroll_left()
look fog: user.mouse_scroll_up()
look dig: user.mouse_scroll_down()

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

#deleting forward
kick ongy: key("delete")
kick ong: key("alt-delete")
kick onger: key("ctrl-k")
kick ongeroom:
	edit.extend_paragraph_end()
	key("delete")
kick ongoom:
	edit.extend_file_end()
	edit.delete()

#deleting backward
kick rogy: key("backspace")
kick rog: key("alt-backspace")
kick roger: key("cmd-backspace")
kick rogeroom:
	edit.extend_paragraph_start()
	key("delete")
kick rogoom:
	edit.extend_file_start()
	edit.delete()

#deleting up and down
kick fog:
	edit.extend_up()
	edit.delete()
kick foger:
	edit.extend_up()
	edit.extend_line_start()
	edit.delete()

kick dig:
	edit.extend_down()
	edit.delete()
kick diger:
	edit.extend_down()
	edit.extend_line_end()
	edit.delete()

#deleting forward and backward
kick bogy:
	key(delete)
	key(backspace)

kick bog:
	key(alt-delete)
	key(alt-backspace)
kick boger: edit.delete_line()
kick bogeroom: edit.delete_paragraph()
kick bogoom:
	edit.select_all()
	sleep(60ms)
	edit.delete()

kick point:
	mouse_click()
	mouse_click()
	key(backspace)
kick pointer:
	mouse_click()
	mouse_click()
	mouse_click()
	key(backspace)

#selecting forward
pick ongy: key("shift-right")
pick ong: key("alt-shift-right")
pick onger: key("cmd-shift-right")
pick ongeroom: edit.extend_paragraph_end()
pick ongoom: edit.extend_file_end()
pick ongize: user.set_select_direction_right()

#selecting backward
pick rogy: key("shift-left")
pick rog: key("alt-shift-left")
pick roger: key("cmd-shift-left")
pick rogeroom: edit.extend_paragraph_start()
pick rogoom: edit.extend_file_start()
pick regize: user.set_select_direction_left()

pick bog: edit.select_word()
pick boger: edit.select_line()
pick bogeroom: edit.select_paragraph()
pick bogoom: edit.select_all()

lift:
	edit.cut()
lift ong:
	edit.extend_word_right()
	edit.cut()
lift rog:
	edit.extend_word_left()
	edit.cut()
lift roger:
	edit.extend_line_start()
	edit.cut()
lift rogoom:
	edit.extend_file_start()
	edit.cut()
lift bog:
	edit.word_right()
	edit.extend_word_left()
	edit.cut()
lift onger:
	edit.extend_line_end()
	edit.cut()
lift ongoom:
	edit.extend_file_end()
	edit.cut()
lift boger:
	edit.select_line()
	edit.cut()
lift bogoom:
	edit.select_all()
	edit.cut()
lift fog:
	edit.extend_up()
	edit.cut()
lift foger:
	edit.extend_up()
	edit.extend_line_start()
	edit.cut()
lift bifoger:
	edit.line_end()
	edit.extend_up()
	edit.extend_line_start()
	edit.cut()
lift dig:
	edit.extend_down()
	edit.cut()
lift diger:
	edit.extend_down()
	edit.extend_line_end()
	edit.cut()
lift bidiger:
	edit.line_start()
	edit.extend_down()
	edit.extend_line_end()
	edit.cut()
lift point:
	mouse_click()
	mouse_click()
	edit.cut()
lift pointer:
	mouse_click()
	mouse_click()
	mouse_click()
	edit.cut()

clip tap: key(cmd-alt-ctrl-shift-v)
match plant: edit.paste_match_style()
plant:
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
plant roger:
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

mem:
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
mem roger:
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
mem foger:
	edit.extend_up()
	edit.extend_line_start()
	edit.copy()
mem bifoger:
	edit.line_start()
	edit.extend_up()
	edit.extend_line_start()
	edit.copy()
mem dig:
	edit.extend_down()
	edit.copy()
mem diger:
	edit.extend_down()
	edit.extend_line_end()
	edit.copy()
mem bidiger:
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
for roger:
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
dodge foger:
	edit.line_swap_up()

dodge dig:
	dodge_word = edit.selected_text()
	edit.delete()
	edit.line_insert_down()
	insert(dodge_word)
dodge diger:
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
form <user.formatters> onroger:
	edit.extend_line_end()
	edit.extend_word_left()
	reformatted_text = user.reformat_text(edit.selected_text(), formatters)
	insert(reformatted_text)
form <user.formatters> roger:
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

golf [<user.any_alphanumeric_key>] ong: user.go_next_character(any_alphanumeric_key or "", 1)
golf [<user.any_alphanumeric_key>] rog: user.go_previous_character(any_alphanumeric_key or "", 1)
golf [<user.any_alphanumeric_key>] ongy: user.go_next_character(any_alphanumeric_key or "", 0)
golf [<user.any_alphanumeric_key>] rogy: user.go_previous_character(any_alphanumeric_key or "", 0)

pick golf [<user.any_alphanumeric_key>] ong: user.select_to_next_character(any_alphanumeric_keyor or "", 1)
pick golf [<user.any_alphanumeric_key>] rog: user.select_to_previous_character(any_alphanumeric_keyor or "", 1)
pick golf [<user.any_alphanumeric_key>] ongy: user.select_to_next_character(any_alphanumeric_keyor or "", 0)
pick golf [<user.any_alphanumeric_key>] rogy: user.select_to_previous_character(any_alphanumeric_keyor or "", 0)

kick golf [<user.any_alphanumeric_key>] ong: user.delete_to_next_character(any_alphanumeric_keyor or "", 1)
kick golf [<user.any_alphanumeric_key>] rog: user.delete_to_previous_character(any_alphanumeric_keyor or "", 1)
kick golf [<user.any_alphanumeric_key>] ongy: user.delete_to_next_character(any_alphanumeric_keyor or "", 0)
kick golf [<user.any_alphanumeric_key>] rogy: user.delete_to_previous_character(any_alphanumeric_keyor or "", 0)

paint ong: user.go_next_paint(1)
paint ongy: user.go_next_paint(0)
paint rog: user.go_previous_paint(1)
paint rogy: user.go_previous_paint(0)
pick paint ong: user.select_to_next_paint(1)
pick paint ongy: user.select_to_next_paint(0)
pick paint rog: user.select_to_previous_paint(1)
pick paint rogy: user.select_to_previous_paint(0)
kick paint ong: user.delete_to_next_paint(1)
kick paint rog: user.delete_to_next_paint(0)
kick paint ongy: user.delete_to_previous_paint(1)
kick paint rogy: user.delete_to_previous_paint(0)
