import numpy as np
from nltk.tokenize import RegexpTokenizer,sent_tokenize
import random
from matplotlib import pyplot as plt
import util
import collections
from collections import defaultdict
import pickle

def words_score(text,model):
    return model.score(text)


def bestResult(filename,model):
    with open(filename, 'r') as f:
        lines = f.readlines()

    min = 100000
    for i,j in enumerate(lines):
        if(model.perplexity(j) < min):
            min = model.perplexity(j)
            min_index = i

    return lines[min_index]

def UCBScore(data,childVisit,parentVisit,cipherText,model1,model2):
    if(childVisit == 0):
        #return 1000000
        return 50
    else :
        score1 = util.treeScore(data,cipherText,model1,model2)

        #score2 = C*(ln(parentVisit)/childVisit)^(0.5)
        # Taking C = 100 here!!!
        score2 = 100*np.sqrt((np.log(parentVisit)/childVisit))
        #print("score1,score2",score1,score2)
        return (score1 + score2)



def treeScore(key,cipherText,model1,model2):
    tempString = []
    for l,m in enumerate(cipherText):
        tempString.append(key[m])
    tempString = (''.join(tempString))

    score = (0.25*model1.score(tempString) + 0.75*model2.score(util.un_process(tempString)))
    #score = (model1.score(tempString)) #+ 0.75*model2.score(util.un_process(tempString)))

    return score


def bigram_p_equiv(filename):

    tokenizer = RegexpTokenizer(r'\w+')
    pDict = defaultdict(list)

    with open(filename, 'r') as f:
        lines = f.readlines()

    for line in lines:
        words = tokenizer.tokenize(line)

        for current,next in zip(words,words[1:]):
            equiv = util.p_equiv(current + ' ' + next)
            if(not((current + ' ' + next) in pDict[equiv])):
                pDict[equiv].append(current + ' ' + next)

    writefile = 'pDict2.pickle'

    with open(writefile ,'w') as g:
        pickle.dump(pDict,g)


def unigram_p_equiv(filename):

    tokenizer = RegexpTokenizer(r'\w+')
    pDict  = defaultdict(list)

    with open(filename,'r') as f:
        lines = f.readlines()

    for line in lines:
        words = tokenizer.tokenize(line)

        for word in words:
            equiv = util.p_equiv(word)
            if(not(word in pDict[equiv])):
                pDict[equiv].append(word)

    writefile = 'pDict1.pickle'

    with open(writefile , 'w') as g:
        pickle.dump(pDict,g)

# returns pattern equivalent of a string
def p_equiv(string):
    count = ord('A')
    # for letters
    col1 = [chr(i) for i in list(np.add(np.arange(26),ord('a')))]

    # for numbers
    col2 = [chr(i) for i in list(np.add(np.arange(10),ord('0')))]

    col1 = col1+col2

    col3 = np.zeros(36)
    myDict = dict(zip(col1,col3))

    for i  in string:
        if(i.isalnum()):
        #if(i!= ' '):
            if(myDict[i] == 0):
                myDict[i] = chr(count)
                count+=1
    myDict[' '] = ' '

    retString = []
    for i in string:
        retString.append(myDict[i])
    return ''.join(retString)



def un_process(string):
    string = string.replace(' ','')
    string = string.replace('_',' ')
    return string

def total_score(string,model1,model2):

    #model1 => character n-grams
    #model2 => word n-grams

    score1 = model1.perplexity(string)
    score2 = model2.perplexity(util.un_process(string))

    return (0.50*score1 + 0.50*score2)
    #return (score1)

def str_process(string):
    tokenizer = RegexpTokenizer(r'\w+')
    string = string.lower()
    result = tokenizer.tokenize(string)
    for i,j in enumerate(result):
        result[i] = ' '.join(j)

    return (' _ '.join(result)+' ')

def letter_ngrammer (word, length):
	return [word[i:i+length] for i in range(len(word)-length+1)]


def least_common_bigrams(string):
    stringList = (string.replace(' ',''))
    bigrams = util.letter_ngrammer(stringList,2)
    counter = collections.Counter(bigrams)
    return (counter.keys()[-10:])

def swapKey(sentKey,s1,s2):
    newKey = sentKey
    for key,value in sentKey.items():
        if value == s1:
            newKey[key]= s2
        if value == s2:
            newKey[key] = s1
    return newKey
#def random_number():

def perplexity(string,languageModel):
    return languageModel.perplexity(string)


def train_test_split(stringList, trnPct):
    random.shuffle(stringList)
    trainLength = int(round(0.01*trnPct*len(stringList)))
    train = stringList[:trainLength]
    test = stringList[trainLength:]
    return train,test

def plot_hist(perplexityList):
    x = plt.hist(perplexityList,bins = 500)
    plt.show(x)

def generate_key():
    key = list(np.arange(26))
    random.shuffle(key)
    return key

def decipher(string):
    key = generate_key()
    key = [chr(i+ord('a')) for i in key]

    values = list(np.arange(26)+ord('a'))
    values = [chr(i) for i in values]

    decipherDict = dict(zip(key,values))
    #print(decipherDict)
    decipherDict['_'] = '_'
    decipherString = []
    for i in string:
        decipherString.append(decipherDict[i])
    return decipherString

def encipher(string,key):
    # Key is an array of 0-25 suffled

    values = list(np.arange(26)+ord('a'))
    values = [chr(i) for i in values]

    keys = np.add(key,ord('a'))
    keys = [chr(i) for i in keys]

    encipherDict = dict(zip(values,keys))
    encipherDict['_'] = '_'
    encipherDict[' '] = ' '
    encipherString = []
    for i in string:
        encipherString.append(encipherDict[i])
    return encipherString


def decipher2(initialKey,newString,encipherString,model):

    for m in range(100):
        swapList = util.least_common_bigrams(newString)
        for i in swapList:
            newKey = util.swapKey(initialKey,i[0],i[1])
            tempString = []
            for i,j in enumerate(encipherString):
                tempString.append(newKey[j])
            tempString = (''.join(tempString))

            newPerplexity = model.perplexity(tempString)

            if(newPerplexity < model.perplexity(newString)):
                initialKey = newKey
    return newPerplexity,tempString,newKey
