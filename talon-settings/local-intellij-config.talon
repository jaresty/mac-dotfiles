# Requires https://plugins.jetbrains.com/plugin/10504-voice-code-idea
app: jetbrains
-
please [<user.text>]:
	key("cmd-shift-a")
	sleep(200ms)
	insert(user.text or "")

file hunt [<user.text>]:
	key("cmd-shift-o")
	sleep(200ms)
	insert(user.text or "")

symbol hunt all [<user.text>]:
	key("cmd-alt-o")
	sleep(200ms)
	insert(user.text or "")
