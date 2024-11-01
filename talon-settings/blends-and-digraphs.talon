# Beginning blends
bluff: "bl"
bran: "br"
claw: "cl"
crest: "cr"
drake: "dr"
flap: "fl"
frog: "fr"
glide: "gl"
plod: "pl"
preen: "pr"
scrub: "sc"
skua: "sk"
sleet: "sl"
smew: "sm"
snug: "sn"
speck: "sp"
stern: "st"
swan: "sw"
twig: "tw"
trip: "tr"

# Ending blends
drift: "ft"
pond: "nd"
flint: "nt"
molt: "lt"
clump: "mp"
honk: "nk"
gulp: "lp"
stalk: "lk"
herd: "rd"

# Consonant Digraphs
chirp: "ch"
shear: "sh"
thorn: "th"
whin: "wh"
cluck: "ck"
song: "ng"
hymn: "mn"
wrack: "wr"
knap: "kn"
sign: "gn"
exile: "gz"

# Vowel Digraphs
haul: "au"
guano: "ua"
aim: "ai"
creek: "ee"
teal: "ea"
aether: "ae"
pie: "ie"
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
spar: "ar"
perch: "er"

# Special Cases
pheasant: "ph"
flight: "gh"
quack: "qu"
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

lyre <user.letter>: "y{letter}e"
lyre:
	user.insert_between("y", "e")

hike <user.letter>: "i{letter}e"
hike:
	user.insert_between("i", "e")

fluke <user.letter>: "u{letter}e"
fluke:
	user.insert_between("u", "e")

stone <user.letter>: "o{letter}e"
stone:
	user.insert_between("o", "e")

cape <user.letter>: "a{letter}e"
cape:
	user.insert_between("a", "e")
