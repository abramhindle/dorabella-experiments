import fileinput

for line in fileinput.input():
    if line == "\n":
        continue
    print(line.upper().replace(" ",""), end = "")
    