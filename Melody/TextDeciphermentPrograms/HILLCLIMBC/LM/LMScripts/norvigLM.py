import re
import sys
import itertools
import string

def getLetterCombos(n):
    LETTERS = string.ascii_lowercase
    letterCombos = list(itertools.product(list(LETTERS), repeat=n))
    return {"".join(i) : 0 for i in letterCombos}

def getWordCombos(corpus,n):
    if n == 1:
        return {i : 0 for i in set(corpus)}
    else:
        words = []
        for x in range(len(corpus)-1):
            words.append(corpus[x]+" "+corpus[x+1])
        return {i : 0 for i in set(words)}

def count_1w(corpus):
    corpus = re.sub(r'[^a-z ]', '', corpus.lower().replace("\n", " ")).split()
    words = getWordCombos(corpus, 1)

    for x in range(len(corpus)):
        words[corpus[x]] += 1

    return sorted(words.items(), key = lambda x: x[1], reverse=True)

    

def count_2w(corpus):
    corpus = re.sub(r'[^a-z ]', '', corpus.lower().replace("\n", " ")).split()
    words = getWordCombos(corpus, 2)

    for x in range(len(corpus)-1):
        words[corpus[x]+" "+corpus[x+1]] += 1
    
    return sorted(words.items(), key = lambda x: x[1], reverse=True)

def count_2l(corpus):
    corpus = re.sub(r'[^a-z]', '', corpus.lower())
    letterCombos = getLetterCombos(2)

    #for x in letterCombos.keys():
        #letterCombos[x] = corpus.count(x)

    for x in range(len(corpus)):
        if len(corpus[x:x+2]) != 2:
            continue
        letterCombos[corpus[x:x+2]] += 1

    return sorted(letterCombos.items(), key = lambda x: x[1], reverse=True)

def count_3l(corpus):
    corpus = re.sub(r'[^a-z]', '', corpus.lower())
    letterCombos = getLetterCombos(3)

    for x in range(len(corpus)):
        if len(corpus[x:x+3]) != 3:
            continue
        letterCombos[corpus[x:x+3]] += 1

    return sorted(letterCombos.items(), key = lambda x: x[1], reverse=True)


if __name__ == "__main__":
    corpus = open(sys.argv[1]).read()

    if sys.argv[2] == "1w":
        sortedCombos = count_1w(corpus)

        for x in sortedCombos:
            print(x[0]+"\t"+str(x[1]))

    elif sys.argv[2] == "2w":
        sortedCombos = count_2w(corpus)

        for x in sortedCombos:
            print(x[0]+"\t"+str(x[1]))

    elif sys.argv[2] == "2l":
        sortedCombos = count_2l(corpus)

        for x in sortedCombos:
            if x[1] != 0:
                print(x[0]+"\t"+str(x[1]))

    elif sys.argv[2] == "3l":
        sortedCombos = count_3l(corpus)

        for x in sortedCombos:
            if x[1] != 0:
                print(x[0]+"\t"+str(x[1]))

    elif sys.argv[2] == "a":
        c1w = open("count_1w.txt","w")
        sortedCombos = count_1w(corpus)
        for x in sortedCombos:
            c1w.write(x[0]+"\t"+str(x[1])+"\n")

        c2w = open("count_2w.txt","w")
        sortedCombos = count_2w(corpus)
        for x in sortedCombos:
            c2w.write(x[0]+"\t"+str(x[1])+"\n")

        c2l = open("count_2l.txt","w")
        sortedCombos = count_2l(corpus)
        for x in sortedCombos:
            if x[1] != 0:
                c2l.write(x[0]+"\t"+str(x[1])+"\n")

        c3l = open("count_3l.txt","w")
        sortedCombos = count_3l(corpus)
        for x in sortedCombos:
            if x[1] != 0:
                c3l.write(x[0]+"\t"+str(x[1])+"\n")