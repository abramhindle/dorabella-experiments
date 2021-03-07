import sys

results = open(sys.argv[1]).read().split("\n")
#print(sys.argv[1])
target = sys.argv[2]

scores = []
correct = 0
total = 0
MRR = []
Ranks = []

for line in results:
    
    if line[:12] == ">START CTEXT":
        #print()
        scores = []
        total += 1
    elif line[:12] == ">START PTEXT":
        line = line.split(" ")
        score = line[-1].split("\t")

        tra = line[2].split("/")[-1]
        
        if len(score) > 2:
            val = float(score[2])
        else:
            val = -999999999.99

        scores.append([tra, val])
    
    elif line[:6] == "RESULT":
        scores = sorted(scores, key = lambda x:x[1], reverse=True)
        best = scores[0]

        Rank = 1
        for s in scores:
            if target in s[0]:
                break
            else:
                Rank += 1
        #print(Rank)
        MRR.append(1/Rank)
        Ranks.append(Rank)
        # Top 1 accuracy
        if target in best[0]:
            correct += 1

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