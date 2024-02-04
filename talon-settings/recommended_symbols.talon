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
wave: '~'
# @: dizzy, swirl
dizzy: '@'
# ": inch, double
inch: '"'
# ': foot, tick, single
foot: "'"
# ?: quark, quest
quest: '?'
# _: blank, score
blank: '_'
# ,: drip
drip: ','
# ;: dripper, semi, sasha
dripper: ';'
# :: stack
stack: ':'
# undo that: nope, nix, junk, blast
nope: edit.undo()
# backward delete: wipe, scratch
scratch: key("backspace")
# forward delete: wiper, wash, deli, flick, delright, drill, punch, scrub
drill: key("delete")
# go word left: drain, before
drain: edit.word_left()
# go word right: step, after
step: edit.word_right()
# go left: tug, left
tug: edit.left()
# go right: push, right
push: edit.right()
# delete word left: scratcher
scratcher: edit.delete_word()
# delete word right: swallow
swallow: key("alt-delete")
# {: lacer, lackey
# }: racer, rebrace, racky
# [: lacker, locker
# ]: racker, rocker, resquare
# <: langle, chomp
# >: rangle, rechomp
# ^: tangle, dagger
# (: curve, lub, lepper
# ): recurve, rub, repper
# () (user.insert_between): round
# [] (user.insert_between): square
# {} (user.insert_between): curly
# <> (user.insert_between): diamond
# "" (user.insert_between): quad
# '' (user.insert_between): twin
# `` (user.insert_between): ski
# open command prompt: please
# talon sleep: drowse, quiet
# save: okay, disk
disk: edit.save()
# control: troll, king
# shift: ship
