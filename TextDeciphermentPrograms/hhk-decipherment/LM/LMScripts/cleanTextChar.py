import fileinput
import re

for line in fileinput.input():
    
    cleanedLine = re.sub(r'[^a-z ]', '', line.lower()).strip().replace(" ","_")
  
    if cleanedLine.strip() != "":
        print(" ".join( list( cleanedLine ) ))
