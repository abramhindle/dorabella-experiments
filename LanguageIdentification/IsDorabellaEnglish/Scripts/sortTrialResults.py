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
    lines = open("../Results/DorabellaResults.txt").read().split("\n")
    ranked = sortRank(lines)

    for x in range(10):
        print(x+1, ranked[x][0].split("/")[-1], ranked[x][1], ranked[x][2])