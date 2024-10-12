# enter: okay, shock, slap, clap, send

# ~: wave
# wave:                       '~'
# # @: dizzy, swirl
# dizzy:                      '@'
# # ": inch, double
# inch:                       '"'
# # ': foot, tick, single
# foot:                       "'"
# # ?: quark, quest
# quest:                      '?'
# # _: blank, score
# blank:                      '_'
# # ,: drip
# drip:                       ','
# # ;: dripper, semi, sasha
# dripper:                    ';'
# # :: stack
# stack:                      ':'
# {: lacer, lackey
# }: racer, rebrace, racky
# [: lacker, locker
# ]: racker, rocker, resquare
# <: langle, chomp
# >: rangle, rechomp
# ^: tangle, dagger
# tangle: '^'
# (: curve, lub, lepper
# ): recurve, rub, repper
round: user.insert_between("(", ")")
rounder:
	insert("()")
	key(left enter)
empty round: "()"
round that:
	text = edit.selected_text()
	user.paste("({text})")
box: user.insert_between("[", "]")
boxer:
	insert("[]")
	key(left enter)
empty box: "[]"
box that:
	text = edit.selected_text()
	user.paste("[{text}]")
curly: user.insert_between("{", "}")
curlier:
	insert("{}")
	key(left enter)
empty curly: "{}"
curly that:
	text = edit.selected_text()
	user.paste("{{{text}}}")
diamond: user.insert_between("<", ">")
diamonder:
	insert("<>")
	key(left enter)
empty diamond: "<>"
diamond that:
	text = edit.selected_text()
	user.paste("<{text}>")
quad: user.insert_between('"', '"')
quadder:
	insert('""')
	key(left enter)
empty quad: '""'
quad that:
	text = edit.selected_text()
	user.paste('"{text}"')
twin: user.insert_between("'", "'")
twinner:
	insert("''")
	key(left enter)
empty twin: "''"
twin that:
	text = edit.selected_text()
	user.paste("'{text}'")
ski: user.insert_between('`', '`')
skier:
	insert("``")
	key(left enter)
empty ski: "``"
ski that:
	text = edit.selected_text()
	user.paste("`{text}`")

tween <user.symbol_key>: user.insert_between("{symbol_key}", "{symbol_key}")
tweener <user.symbol_key>:
	insert("{symbol_key}{symbol_key}")
	key(left enter)

# open command prompt: please
# talon sleep: drowse, quiet
# save: okay, disk
disk: edit.save()
# control: troll, king
# shift: ship
