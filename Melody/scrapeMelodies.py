import sys
from urllib.request import urlopen

# Script used to extract the melodies from http://cantusindex.org/melody
# You can run it like this:
# python3 scrapeMelodies.py [melody url] [number of melodies to extract]
#
# This link is an example of a melody url http://cantusindex.org/melody/msch001 
# Don't include the numbers at the end of the url when running
#
# Try runnig this
# python3 scrapeMelodies.py http://cantusindex.org/melody/msch 10

def extractMelody(baseurl, n):
    url = baseurl + n
    print(url)

    output = baseurl.split("/")[-1]
    page = urlopen(url)
    html_bytes = page.read()
    html = html_bytes.decode("utf-8")

    melody = []

    for line in html.split("\n"):
        if 'class="melody"' in line:
            for note in line[20:]:
                if note == "<":
                    break

                if note in list("abcdefghijklmnopqrs89"):
                    if note == "8":
                        note = "u"
                    elif note == "9":
                        note = "v"
                   
                    print(note, end = " ")
                    melody.append(note)
    print()
    f = open(output, "a+")
    f.write(" ".join(melody)+"\n")

baseurl = sys.argv[1]
n = int(sys.argv[2])

for x in range(n):
    x = str(x+1).zfill(3)
    try:
        extractMelody(baseurl, x)
    except:
        continue