require "../src/espeak_ng"

bob = ESpeakNG.speaker({ speed: 44, volume: 35, pitch: 50, gap: 0})
bob.say "One. Two. Three. Four!"
