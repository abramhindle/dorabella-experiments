import fileinput

for n, line in enumerate(fileinput.input()):
    if n == 3:
        print("Key Acc",line.split()[-1])

    if n == 8:
        print("Dec Acc",line.split()[-1])