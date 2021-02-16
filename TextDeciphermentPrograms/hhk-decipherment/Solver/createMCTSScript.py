import sys

solverFile = open("mcts_template.pl").read().split("\n")
interFileW = open("../LM/LM/interpolationWord.txt").read().split("\n")
interFileC = open("../LM/LM/interpolationChar.txt").read().split("\n")

WLM = [interFileW[2].split()[-1], interFileW[1].split()[-1], interFileW[0].split()[-1]]
CLM = [interFileC[2].split()[-1], interFileC[1].split()[-1], interFileC[0].split()[-1]]

for line in solverFile:
    if line == "#WLM":
        print("  = (", WLM[0], ", ", WLM[1], ", ", WLM[2],");", sep = "")
    elif line == "#CLM":
        print("  = (", CLM[0], ", ", CLM[1], ", ", CLM[2],");", sep = "")
    else:
        print(line)
