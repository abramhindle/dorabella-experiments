import sys

def calcResults(filepath, target):
    results = open(filepath).read().split("\n")

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
    return [sum(MRR)/len(MRR),sum(Ranks)/len(Ranks)]

MRR = []
Acc = []

cMRR,cAcc = calcResults("../Results/EnResults.txt", "en")
MRR.append(round(cMRR,2))
Acc.append(round(cAcc,2))

cMRR,cAcc = calcResults("../Results/FrResults.txt", "fr")
MRR.append(round(cMRR,2))
Acc.append(round(cAcc,2))

cMRR,cAcc = calcResults("../Results/PlResults.txt", "pl")
MRR.append(round(cMRR,2))
Acc.append(round(cAcc,2))

cMRR,cAcc = calcResults("../Results/DeResults.txt", "de")
MRR.append(round(cMRR,2))
Acc.append(round(cAcc,2))

cMRR,cAcc = calcResults("../Results/ItResults.txt", "it")
MRR.append(round(cMRR,2))
Acc.append(round(cAcc,2))

print("","En","Fr","Pl","De","It",sep="\t",end="\n---------------------------------------------\nMRR\t")

for x in MRR:
    print(x,end="\t")
print("\nAcc",end="\t")
for a in Acc:
    print(a,end="\t")
print("")