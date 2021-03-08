import sys
import kenlm
import os
import math

def test(folder, LM):
    totalPerplexity = 0
    files = 0

    for file in os.listdir(folder):
        text = open(os.path.join(folder, file)).read()

        totalPerplexity += LM.perplexity(" ".join(list(text)))
        files += 1

    print("Average Perplexity",totalPerplexity/files)
    
if __name__ == "__main__":
    # Models
    LM = kenlm.LanguageModel(sys.argv[1])

    # Texts
    test(sys.argv[2], LM)