# tag: browser
# browser.host: /miro\.com/
os: mac
and app.bundle: com.electron.realtimeboard
-
hand jog: "h"
select jog: "v"
text [<user.text>] jog:
	"t"
	mouse_click()
	insert(text or "")
	key(escape escape)
text [<user.text>] tap:
	"t"
	mouse_click()
	insert(text or "")
pen jog: "p"
note [<user.text>] jog:
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
pointer punch:
	mouse_click()
	key(backspace)
shape jog: "s"
frame jog: "f"
comment jog: "c"
