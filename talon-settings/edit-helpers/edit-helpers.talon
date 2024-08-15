select paste: user.select_paste()
paste select: user.paste_select()
push:
	insert(" ")
	edit.left()
toss:
	insert("\n")
	edit.up()
	edit.line_end()
