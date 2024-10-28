# ### Blends
# 1. **bl** - *blue* (like the bluebird)
# 2. **br** - *bran* (for the brambling bird)
# 3. **cl** - *claw* (bird’s claw)
# 4. **cr** - *crow* (as in the bird)
# 5. **dr** - *drake* (male duck)
# 6. **fl** - *flap* (wing movement)
# 7. **fr** - *fry* (young birds are sometimes called fry in some dialects)
# 8. **gl** - *glide* (how birds move in the air)
# 9. **gr** - *grouse* (type of bird)
# 10. **pl** - *plume* (feather)
# 11. **pr** - *preen* (birds grooming)
# 12. **sc** - *scrub* (like a scrub jay)
# 13. **sk** - *skua* (seabird)
# 14. **sl** - *sleet* (for cold-weather birds)
# 15. **sm** - *smew* (type of duck)
# 16. **sn** - *snipe* (type of bird)
# 17. **sp** - *spar* (from sparrow)
# 18. **st** - *stern* (close to *tern*)
# 19. **sw** - *swift* (type of bird)
# 20. **tr** - *trap* (as birds are sometimes trapped)

# Consonant Digraphs
chirp: "ch"
shear: "sh"
thorn: "th"
whin: "wh"
cluck: "ck"
song: "ng"
milk: "lk"
honk: "nk"
hymn: "mn"
sphinx: "nx"
wrack: "wr"
knap: "kn"
sign: "gn"

# Vowel Digraphs
haul: "au"
aim: "ai"
creek: "ee"
teal: "ea"
die: "ie"
skein: "ei"
soar: "oa"
doe: "oe"
hoot: "oo"
flew: "ew"
caw: "aw"
oriole: "io"
pouch: "ou"
fowl: "ow"
coif: "oi"
fruit: "ui"
pigeon: "eo"
toy: "oy"
ray: "ay"
prey: "ey"
cue: "ue"
stir: "ir"
scorn: "or"
spur: "ur"
dart: "ar"
perch: "er"

# Special Cases
pheasant: "ph"
flight: "gh"
tweet: "tt"
gull: "ll"
ruff: "ff"
limb: "mb"
pennant: "nn"
summit: "mm"
accip: "cc"
fuzz: "zz"
peep: "pp"
whirr: "rr"
odd: "dd"
nibble: "bb"
jagged: "gg"
moss: "ss"

# User Insertions
mere <user.letter>: "e{letter}e"
mere:
	user.insert_between("e", "e")

rise <user.letter>: "i{letter}e"
rise:
	user.insert_between("i", "e")

ruse <user.letter>: "u{letter}e"
ruse:
	user.insert_between("u", "e")

stone <user.letter>: "o{letter}e"
stone:
	user.insert_between("o", "e")

cape <user.letter>: "a{letter}e"
cape:
	user.insert_between("a", "e")
