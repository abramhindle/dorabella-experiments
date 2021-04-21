import sys
import re
import random

samples = []

def getSample(wordList, sampleLen):

    for _ in range(100000):
        sample = random.randint(0,len(wordList)-sampleLen)

        # prevent duplicate samples
        if sample in samples:
            continue
        else:
            samples.append(sample)

        sampleText = ""

        for word in wordList[sample:]:
            sampleText += word

            if len(sampleText) == sampleLen and len(set(sampleText)) <= 24:
                return sampleText
            elif len(sampleText) > sampleLen:
                break

    return False

def textToList(text):
    text = re.sub(r'[\n]', ' ', text.upper())
    text = re.sub(r'[^A-Z ]', '', text.upper())
    wordList = text.split()

    return wordList

def getSampleSentence(sentenceList, sampleLen):
    for _ in range(100000):
        sample = random.randint(0,len(sentenceList)-1)

        # prevent duplicate samples
        if sample in samples:
            continue
        else:
            samples.append(sample)

        sampleText = ""

        for word in sentenceList[sample]:
            sampleText += word

            if len(sampleText) == sampleLen and len(set(sampleText)) <= 24:
                return sampleText
            elif len(sampleText) > sampleLen:
                print("break")
                break

    return False

def textToSentences(text):
    text = re.sub(r'[\n]', ' ', text.lower())
    text = re.sub(r'[^a-z ]', '', text.lower())
    sentences = text.split()

    return sentences

if __name__ == "__main__":
    '''
    python3 randomTextSample.py [path of text] [number of samples to generate] [optionally add the output directory]
    python3 randomTextSample.py randomTextTest/test/Frankenstein.txt 10000 results/
    '''

    
    text = open(sys.argv[1]).read()
    sentenceList = textToSentences(text)

    sample = ""
    counter = 1
    for x in sentenceList:
        sample += x

        if len(sample) == 87:
            if len(sys.argv) > 3:
                filename = sys.argv[3]+sys.argv[1].split("/")[-1].split(".")[0]+str(counter)+".sample"
            else:
                filename = sys.argv[1].split("/")[-1].split(".")[0]+str(x+1)+".sample"

            fh = open(filename, "w")
            fh.write(sample)
            sample = ""
            counter += 1

        