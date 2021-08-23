# This script will replace the first occurance of a string with anotner one

# Text string
$txt = "Hey, how are you?
he quick, brown fox jumps over a lazy dog.
DJs flock by when MTV ax quiz prog.
Hey, how are you?
Junk MTV quiz graced by fox whelps.
Hey, lets do something
Bawds jog, flick quartz, vex nymphs.
Hey, how are you?
Waltz, bad nymph, for quick jigs vex!
Fox nymphs grab quick-jived waltz.
Brick quiz whangs jumpy veldt fox. Bright vixens
"
# replace the first occurance of the pattern
[regex]$pattern = "Hey, how are you?"
$pattern.replace($txt, "Hi, how are you?", 1) 
