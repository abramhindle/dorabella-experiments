import sys

def getRank(sList, language):
    for c,x in enumerate(sList,1):
        if x[0] == language:
            return c


text = open(sys.argv[1]).read().split("\n")
language = sys.argv[2]

scores = []
ranks = []
RR = []
lineNo = 0
for line in text:
    lineNo += 1
    if line[:13] == ">START PTEXT:":
        x = line.split()
        scores.append([x[2][-10:-8],x[14]])
    if line[:7] == "RESULT:":
        sScores = sorted(scores, key=lambda x: x[1])
        print(sScores,end="\n\n")
        scores = []
        ranks.append(getRank(sScores, language))
        RR.append(1/getRank(sScores, language))

print("Average Rank:",sum(ranks) / len(ranks))
print("MRR:",sum(RR) / len(ranks))