import re
import random

random.seed(42)

def genRandKey(textList):
    '''
    Given a List of characters as input ["A", "AB", "B123", "AB"] return a random dorabella key 
    A key is a dictionary of the characters from the input list as the key and a mapping to a dorabella characters for the value
    '''

    directions = ['1⇑', '1⇗', '1⇒', '1⇘', '1⇓', '1⇙', '1⇐', '1⇖', '2⇑', '2⇗', '2⇒', '2⇘', '2⇓', '2⇙', '2⇐', '2⇖', '3⇑', '3⇗', '3⇒', '3⇘', '3⇓', '3⇙', '3⇐', '3⇖']
    characters = list(set(textList))
    key = {}

    for i, c in enumerate(characters):
        if not i % len(directions):
            random.shuffle(directions)
        
        key[c] = directions[i%len(directions)] 

    return key

def listToDorabella(textList, key = None, retKey = False):
    '''
    Given a list of characters, substitute the characters for dorabella symbols
    If a key is not provided, a random key will be generated
    '''

    if not key:
        key = genRandKey(textList)

    encodedText = [key[i] for i in textList]

    if retKey == True:
        return (encodedText, key)
    else:
        return encodedText

def isReflection(c1, c2):
    '''
    Return True if c1 and c2 are reflections
    '''

    reflections = {"⇑":"⇓" ,"⇙":"⇗" ,"⇐":"⇒" ,"⇖":"⇘" ,"⇓":"⇑" ,"⇗":"⇙" ,"⇒":"⇐" ,"⇘":"⇖"}
    
    if c2 == "":
        return False

    if c1[1] == reflections[c2[1]] and c1[0] == c2[0]:
        return True

    else:
        return False

def countReflections(encodedText, sampleLen):
    '''
    Given a text encoded with dorabella symbols
    return the count of the number of reflected symbols
    '''

    count = 0

    # Get a random sample of sampleLen charaters
    sample = random.randint(0,len(encodedText)-sampleLen)
    sampleText = encodedText[sample:sample+sampleLen]

    prev = ""

    for c in sampleText:
        if isReflection(c, prev):
            count += 1
        prev = c

    return count

def countSequences(encodedText, sampleLen):
    sequences = {}
    count = -1
    prev = "0"

    sample = random.randint(0,len(encodedText)-sampleLen)
    sampleText = encodedText[sample:sample+sampleLen]

    for l in sampleText:
        count += 1

        if l[0] == prev[0]:
            if count in sequences:
                sequences[count] += 1
            else:
                sequences[count] = 1
            
            count = 0
            
        prev = l

    # Add count of last sequence
    if count in sequences:
        sequences[count] += 1
    elif count != 0:
        sequences[count] = 1

    return sequences


if __name__ == "__main__":
    pass
    #text = open("englishText/The_Adventures_of_Sherlock_Holmes.txt").read()
    #print(countReflections("Hello World How Are You Doing", "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 10))