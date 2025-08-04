tag: user.line_commands
-
onglet: user.camel_right()
roglet: user.camel_left()

dump onglet:
	user.extend_camel_right()
	key("delete")

dump roglet:
	user.extend_camel_left()
	key("delete")
dump boglet:
	user.camel_left()
	user.extend_camel_right()
	key(delete)

picklet: user.extend_camel_right()

repicklet: user.extend_camel_left()
