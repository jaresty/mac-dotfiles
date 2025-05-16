# tag: browser
# browser.host: /miro\.com/
os: mac
and app.bundle: com.electron.realtimeboard
-
hand ong: "h"
select ong: "v"
text [<user.text>] ong:
	"t"
	mouse_click()
	insert(text or "")
	key(escape escape)
text [<user.text>] tap:
	"t"
	mouse_click()
	insert(text or "")
pen ong: "p"
note [<user.text>] ong:
	"n"
	mouse_click()
	insert(text or "")
	key(escape)
	sleep(50ms)
	key(escape)
note [<user.text>] tap:
	"n"
	mouse_click()
	insert(text or "")
pointer kick:
	mouse_click()
	key(backspace)
shape ong: "s"
frame ong: "f"
comment ong: "c"
