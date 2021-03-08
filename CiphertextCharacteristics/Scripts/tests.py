from encodeDorabella import *
import sys

def formatResults(results):
    frequency, labels = [], []
    results = sorted(list(results.items()), key=lambda kv: kv[0])

    for x in results:
        frequency.append(x[1])
        labels.append(x[0])
        
    print("#| ", end="")
    for x in labels:
        print(str(x).ljust(3), end ="")
    print()
    print("C| ", end="")
    for x in frequency:
        print(str(x).ljust(3), end ="")
    print()
    
    return (frequency, labels)

def testReflections(textPath, n, sampleLength = 87):
    text = open(textPath).read()
    text = text.split()

    average = 0
    refFrequency = {}

    for x in range(n):
        random.seed(x)
        dText = listToDorabella(text)

        result = countReflections(dText, sampleLength)
        average += result

        if result in refFrequency:
            refFrequency[result] += 1
        else:
            refFrequency[result] = 1

    print("Average:", average/n)
    
    return refFrequency

def testLongestSequence(textPath, n, sampleLength = 87):
    text = open(textPath).read()
    text = text.split()

    average = 0
    refFrequency = {}

    for x in range(n):
        random.seed(x)
        dText = listToDorabella(text)

        result = countSequences(dText, sampleLength)
        longestSeq = max(result.keys())
        average += longestSeq

        if longestSeq in refFrequency:
            refFrequency[longestSeq] += 1
        else:
            refFrequency[longestSeq] = 1

    print("Average:", average/n)
    
    return refFrequency


if __name__ == "__main__":
    filePath = sys.argv[1]
    samples = int(sys.argv[2])

    if sys.argv[3] == "r":
        result = testReflections(filePath, samples)
        formatResults(result)
    elif sys.argv[3] == "l":
        result = testLongestSequence(filePath, samples)
        formatResults(result)
    
