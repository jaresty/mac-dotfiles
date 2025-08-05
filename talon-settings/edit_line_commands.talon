tag: user.line_commands
-
onglet: user.camel_right()
roglet: user.camel_left()

blot onglet:
	user.extend_camel_right()
	key("delete")

blot roglet:
	user.extend_camel_left()
	key("delete")
blot boglet:
	user.camel_left()
	user.extend_camel_right()
	key(delete)

picklet: user.extend_camel_right()

repicklet: user.extend_camel_left()
