# tag: browser
# browser.host: /miro\.com/
os: mac
and app.bundle: com.electron.realtimeboard
-
hand walk: "h"
select walk: "v"
text [<user.text>] walk:
	"t"
	mouse_click()
	insert(text or "")
	key(escape escape)
text [<user.text>] tap:
	"t"
	mouse_click()
	insert(text or "")
pen walk: "p"
sticky [<user.text>] walk:
	"n"
	mouse_click()
	insert(text or "")
	key(escape)
	sleep(50ms)
	key(escape)
sticky [<user.text>] tap:
	"n"
	mouse_click()
	insert(text or "")
mouse punch:
	mouse_click()
	key(backspace)
shape walk: "s"
frame walk: "f"
comment walk: "c"
