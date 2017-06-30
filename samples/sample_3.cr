# Arch packages required:
#
# * aur/mbrola 3.0.1h-5 
# * aur/mbrola-voices-de1
#
# Installation:
#
# ```console
#  pacaur -S mbrola 
#  pacaur -S mbrola-voices-de1
# ``` 

require "../src/espeak_ng"

Olga = ESpeakNG.speaker({ speed: 115, lang: "mb-de1" })
Olga.say "Hallo ich bin deutsches Mädchen!"

