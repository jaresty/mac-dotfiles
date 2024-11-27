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

snatchier: user.extend_camel_right()

resnatchier: user.extend_camel_left()
