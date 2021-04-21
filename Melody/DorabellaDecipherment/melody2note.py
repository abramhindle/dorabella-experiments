import sys

noteMap = {
"u":"F3",
"v":"G3",
"a":"A3",
"w":"B3-",
"b":"B3",

"c":"C4",
"d":"D4",
"e":"E4",
"f":"F4",
"g":"G4",
"h":"A4",
"i":"B4-",
"j":"B4",

"k":"C5",
"l":"D5",
"m":"E5",
"n":"F5",
"o":"G5",
"p":"A5",
"x":"B5-",
"q":"B5",

"r":"C6",
"s":"D6",
"t":"E6"#

}

melody = open(sys.argv[1]).read().replace("\n","")

notes = []

for note in melody:
    notes.append(noteMap[note])

print(" ".join(notes))