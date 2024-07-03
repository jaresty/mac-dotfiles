# enter: okay, shock, slap, clap, send
clap: key("enter")
# tab: swing
swing: key("tab")
# backslash: whack, stroke, backstroke
# slash: stroke
# page up: upper, punk, dusk
upper: key("pageup")
# page down: downer, scroll, dawn
downer: key("pagedown")
# space: blank, void, ace, ta, pad
void: ' '
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
empty round: "()"
round that:
	text = edit.selected_text()
	user.paste("({text})")
box: user.insert_between("[", "]")
empty box: "[]"
box that:
	text = edit.selected_text()
	user.paste("[{text}]")
curly: user.insert_between("{", "}")
empty curly: "{}"
curly that:
	text = edit.selected_text()
	user.paste("{{text}}")
diamond: user.insert_between("<", ">")
empty diamond: "<>"
diamond that:
	text = edit.selected_text()
	user.paste("<{text}>")
quad: user.insert_between('"', '"')
empty quad: '""'
quad that:
	text = edit.selected_text()
	user.paste('"{text}"')
twin: user.insert_between("'", "'")
empty twin: "''"
twin that:
	text = edit.selected_text()
	user.paste("'{text}'")
ski: user.insert_between("`", '`')
empty ski: "``"
ski that:
	text = edit.selected_text()
	user.paste("`{text}`")

tween <user.symbol_key>: user.insert_between("{symbol_key}", "{symbol_key}")

# open command prompt: please
# talon sleep: drowse, quiet
# save: okay, disk
disk: edit.save()
# control: troll, king
# shift: ship
scrape: key("escape")
