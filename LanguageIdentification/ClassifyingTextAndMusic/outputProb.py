import sys

results = open(sys.argv[1]).read().split("\n")

for line in results:

    if line[:12] == ">START PTEXT":
        line = line.split(" ")
        score = line[-1].split("\t")

        tra = line[2].split("/")[-1]

        print(tra,score[2])
