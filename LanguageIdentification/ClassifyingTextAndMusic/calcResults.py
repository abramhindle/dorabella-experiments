import sys

results = open(sys.argv[1]).read().split("\n")
target = sys.argv[2]+"'"

scores = []
correct = 0
total = 0

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
            val = -999.99

        scores.append([tra, val])
    
    elif line[:6] == "RESULT":
        best = max(scores, key = lambda x:x[1])
        #print(scores)
        #print(best)

        if best[0] == target:
            correct += 1

print(correct,"/",total)
print(correct/total)