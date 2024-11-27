tag: user.line_commands
-
steppier: user.camel_right()
resteppier: edit.camel_left()

punchier:
	user.extend_camel_right()
	key("delete")

repunchier:
	user.extend_camel_left()
	key("delete")
bipunchier:
	edit.camel_left()
	edit.extend_camel_right()
	key(delete)

snatchy er: user.extend_camel_right()

resnatchy er: user.extend_camel_left()
