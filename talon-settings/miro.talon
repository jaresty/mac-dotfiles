# tag: browser
# browser.host: /miro\.com/
os: mac
and app.bundle: com.electron.realtimeboard
-
hand walk: "h"
select walk: "v"
text [<user.spoken_search>] walk:
	"t"
	mouse_click()
	insert(spoken_search or "")
	key(escape escape)
text [<user.spoken_search>] tap:
	"t"
	mouse_click()
	insert(spoken_search or "")
pen walk: "p"
sticky [<user.spoken_search>] walk:
	"n"
	mouse_click()
	insert(spoken_search or "")
	key(escape)
	sleep(50ms)
	key(escape)
sticky [<user.spoken_search>] tap:
	"n"
	mouse_click()
	insert(spoken_search or "")
mouse punch:
	mouse_click()
	key(backspace)
shape walk: "s"
frame walk: "f"
comment walk: "c"
