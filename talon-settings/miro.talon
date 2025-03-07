# tag: browser
# browser.host: /miro\.com/
os: mac
and app.bundle: com.electron.realtimeboard
-
hand step: "h"
select step: "v"
text [<user.prose>] step:
	"t"
	mouse_click()
	insert(prose or "")
	key(escape escape)
text [<user.prose>] tap:
	"t"
	mouse_click()
	insert(prose or "")
pen step: "p"
sticky [<user.prose>] step:
	"n"
	mouse_click()
	insert(prose or "")
	key(escape escape)
sticky [<user.prose>] tap:
	"n"
	mouse_click()
	insert(prose or "")
mouse punch:
	mouse_click()
	key(backspace)
shape step: "s"
frame step: "f"
comment step: "c"
