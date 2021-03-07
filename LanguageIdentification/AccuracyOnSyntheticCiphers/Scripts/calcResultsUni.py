import sys

results = open(sys.argv[1]).read().split("\n")
#print(sys.argv[1])
target = sys.argv[2]

MRR = []
Ranks = []

for line in results:
    line = line.strip()
    
    if line[:4] == "RANK":
        line = line.split()
        if line[2].startswith(target):
            #print(line)
            MRR.append(1/int(line[1][:-1]))
            Ranks.append(int(line[1][:-1]))

'''
print("MRR")
print(sum(MRR)/len(MRR))
print("Average Rank")
print(sum(Ranks)/len(Ranks))
print()
'''
print(sum(MRR))
print(sum(Ranks))
print(len(Ranks))