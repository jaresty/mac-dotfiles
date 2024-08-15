select paste: user.select_paste()
paste select: user.paste_select()
push:
	insert(" ")
	edit.left()
toss:
	key(shift-enter)
	edit.up()
	edit.line_end()
