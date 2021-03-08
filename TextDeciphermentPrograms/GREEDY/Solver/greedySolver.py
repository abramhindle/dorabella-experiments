import numpy as np
from random import shuffle,sample,randint
import kenlm
import util
import util2
import os
import time
import pickle
from copy import deepcopy
from sys import argv
import re

def decrypt(string, key1, key2):
    dec_dict = dict(zip(key1,key2))
    dec_dict[' '] = ' '
    dec = []
    for char in string:
        dec.append(dec_dict[char])
    return ''.join(dec)

def score(string,model1):
    return (-1*model1.score(string))

def swap(perm,n_mutations):
    number = randint(1,n_mutations)
    for i in range(number):
        int1,int2 = sample(list(np.arange(26)),2)
        perm[int1],perm[int2] = perm[int2],perm[int1]
    return perm

model1 = kenlm.LanguageModel(argv[1])

corpus_tokens_vocab = [chr(i+ord('a')) for i in list(np.arange(26))]
our_tokens_vocab = [chr(i+ord('a')) for i in list(np.arange(26))]

# Lowercase and remove special characters from input
string = " ".join(list(re.sub(r'[^a-z]', '', open(argv[2]).read().lower())))
enc_str = string

letters = []
counts = []

min_score = None
min_perm = None
best_dec = None

def abram_search():
    min_score = None
    min_perm = None
    n_mutations = 10
    best_score = None
    best_dec = None
    iterations = 0

    min_iter = 0

    start_time = time.time()
    while True:
        perm = list(corpus_tokens_vocab)
        shuffle(perm)
        min_score = None
        min_perm = list(perm)

        for j in range(0,20):
            for i in range(0,len(perm)):
                for v in corpus_tokens_vocab:
                    perm = list(min_perm)
                    if v in perm:
                        v_index = perm.index(v)
                        perm[v_index],perm[i] = perm[i],perm[v_index]
                    else:
                        perm[i] = v

                    dec_str = decrypt(enc_str,our_tokens_vocab,perm)

                    cur_score = score(dec_str,model1)

                    if(min_score is None or cur_score<min_score):
                        min_score = cur_score
                        min_perm = list(perm)
                        min_iter = iterations

                        #print(score(decrypt(enc_str,our_tokens_vocab,perm),model1))
                    iterations+=1

        if(best_score is None or min_score<best_score):
            best_score = min_score
            best_perm = list(min_perm)
            best_dec = decrypt(enc_str,our_tokens_vocab,best_perm)

        if(time.time() - start_time > 30):
            return best_dec,best_score
    return best_dec,best_score

if __name__ == "__main__":
    best_dec, best_score = abram_search()

    #print("BESTSCORE",best_score)
    print(best_dec)

