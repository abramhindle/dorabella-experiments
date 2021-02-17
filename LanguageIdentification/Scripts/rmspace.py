import sys

file = open(sys.argv[1]).read()

print(file.replace(" ", "").replace("\n", ""), end="")