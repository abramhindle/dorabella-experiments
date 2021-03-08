import fileinput
import re

for line in fileinput.input():
    cleanedLine = re.sub(r'[^a-z ]', ' ', line.lower().replace("'",""))
    
    if cleanedLine.strip() != "":
        print(" ".join( cleanedLine.split() ))

print("<u>")