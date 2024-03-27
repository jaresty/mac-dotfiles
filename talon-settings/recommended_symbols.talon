# enter: okay, shock, slap, clap, send
clap:                       key("enter")
# tab: swing
swing:                      key("tab")
# backslash: whack, stroke, backstroke
# slash: stroke
# page up: upper, punk, dusk
upper:                      key("pageup")
# page down: downer, scroll, dawn
downer:                     key("pagedown")
# space: blank, void, ace, ta, pad
void:                       ' '
# ~: wave
wave:                       '~'
# @: dizzy, swirl
dizzy:                      '@'
# ": inch, double
inch:                       '"'
# ': foot, tick, single
foot:                       "'"
# ?: quark, quest
quest:                      '?'
# _: blank, score
blank:                      '_'
# ,: drip
drip:                       ','
# ;: dripper, semi, sasha
dripper:                    ';'
# :: stack
stack:                      ':'
# {: lacer, lackey
# }: racer, rebrace, racky
# [: lacker, locker
# ]: racker, rocker, resquare
# <: langle, chomp
# >: rangle, rechomp
# ^: tangle, dagger
# (: curve, lub, lepper
# ): recurve, rub, repper
round:                      user.insert_between("(", ")")
square:                     user.insert_between("[", "]")
curly:                      user.insert_between("{", "}")
diamond:                    user.insert_between("<", ">")
quad:                       user.insert_between('"', '"')
twin:                       user.insert_between("'", "'")
ski:                        user.insert_between("`", '`')

# open command prompt: please
# talon sleep: drowse, quiet
# save: okay, disk
disk:                       edit.save()
# control: troll, king
# shift: ship
scrape:                     key("escape")
