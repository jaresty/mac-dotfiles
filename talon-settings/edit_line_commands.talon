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

picklet: user.extend_camel_right()

repicklet: user.extend_camel_left()
