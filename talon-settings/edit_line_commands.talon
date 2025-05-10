tag: user.line_commands
-
joglet: user.camel_right()
roglet: user.camel_left()

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
