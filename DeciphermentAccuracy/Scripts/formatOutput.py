import fileinput

for n, line in enumerate(fileinput.input()):
    if n == 3:
        print("Key Acc ",round(float(line.split()[-1])*100,1),"%",sep="")

    if n == 8:
        print("Dec Acc ",round(float(line.split()[-1])*100,1),"%",sep="")