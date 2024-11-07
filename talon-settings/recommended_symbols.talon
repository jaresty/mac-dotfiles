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
# # :: box
# box:                      ':'
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
sun: user.insert_between("(", ")")
suner:
	insert("()")
	key(left enter)
suny: "()"
sun that:
	text = edit.selected_text()
	user.paste("({text})")
box: user.insert_between("[", "]")
boxer:
	insert("[]")
	key(left enter)
boxy: "[]"
box that:
	text = edit.selected_text()
	user.paste("[{text}]")
crane: user.insert_between("{", "}")
craner:
	insert("{}")
	key(left enter)
craney: "{}"
crane that:
	text = edit.selected_text()
	user.paste("{{{text}}}")
leaf: user.insert_between("<", ">")
leafer:
	insert("<>")
	key(left enter)
leafy: "<>"
leaf that:
	text = edit.selected_text()
	user.paste("<{text}>")
bud: "</"
quad: user.insert_between('"', '"')
quadder:
	insert('""')
	key(left enter)
quady: '""'
quad that:
	text = edit.selected_text()
	user.paste('"{text}"')
twin: user.insert_between("'", "'")
twinner:
	insert("''")
	key(left enter)
twiny: "''"
twin that:
	text = edit.selected_text()
	user.paste("'{text}'")
rain: user.insert_between('`', '`')
rainer:
	insert("``")
	key(left enter)
rainy: "``"
rain that:
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
