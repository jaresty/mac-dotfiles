# tag: browser
# browser.host: /miro\.com/
os: mac
and app.bundle: com.electron.realtimeboard
-
hand walk: "h"
select walk: "v"
text [<user.prose>] walk:
	"t"
	mouse_click()
	insert(prose or "")
	key(escape escape)
text [<user.prose>] tap:
	"t"
	mouse_click()
	insert(prose or "")
pen walk: "p"
sticky [<user.prose>] walk:
	"n"
	mouse_click()
	insert(prose or "")
	key(escape)
	sleep(50ms)
	key(escape)
sticky [<user.prose>] tap:
	"n"
	mouse_click()
	insert(prose or "")
mouse punch:
	mouse_click()
	key(backspace)
shape walk: "s"
frame walk: "f"
comment walk: "c"
