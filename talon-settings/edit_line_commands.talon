tag: user.line_commands
-
onglet: user.camel_right()
roglet: user.camel_left()

zap onglet:
	user.extend_camel_right()
	key("delete")

zap roglet:
	user.extend_camel_left()
	key("delete")
zap boglet:
	user.camel_left()
	user.extend_camel_right()
	key(delete)

picklet: user.extend_camel_right()

repicklet: user.extend_camel_left()
