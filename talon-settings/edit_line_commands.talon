tag: user.line_commands
-
walklet: user.camel_right()
rewalklet: user.camel_left()

punchlet:
	user.extend_camel_right()
	key("delete")

repunchlet:
	user.extend_camel_left()
	key("delete")
bipunchlet:
	user.camel_left()
	user.extend_camel_right()
	key(delete)

snatchlet: user.extend_camel_right()

resnatchlet: user.extend_camel_left()
