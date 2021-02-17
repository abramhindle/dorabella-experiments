import sys

def sortRank(lines):
    scores = []
    for line in lines:

        if line[:12] == ">START PTEXT":
            x = line.split()
            try:
                scores.append([x[2],x[13],x[14]])
            except:
                continue

    ranked = sorted(scores, key=lambda kv: kv[2])
    
    return ranked

def rankIndex(l, lang):
    for c,x in enumerate(l):
        if x[0] == lang:
            return c
    
    return -1

if __name__ == "__main__":
    if len(sys.argv) > 2:
    
        lines = open(sys.argv[1]).read().split("\n")
        lines2 = open(sys.argv[2]).read().split("\n")

        original = sortRank(lines)
        compare = sortRank(lines2)

        for c,x in enumerate(compare, 1):
            oRank = rankIndex(original, x[0])
            cRank = rankIndex(compare, x[0])

            change  = oRank - cRank

            if change == 0 :
                print(c, x[0][13:30], x[1], x[2], "   Change:", change )
            elif change > 0:
                print(c, x[0][13:30], x[1], x[2], "   Change: +", change )
            else:
                print(c, x[0][13:30], x[1], x[2], "   Change: -", abs(change) )
    else:
        lines = open(sys.argv[1]).read().split("\n")
        ranked = sortRank(lines)

        for x in range(len(ranked)):
            print(x+1, ranked[x][0][13:30], ranked[x][1], ranked[x][2])