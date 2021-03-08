import sys
import re
import random

if __name__ == "__main__":
    original = open(sys.argv[1]).read().replace(" ", "").replace("\n", "").lower()
    decipherment = open(sys.argv[2]).read().replace(" ", "").replace("\n", "").lower()

    mistakes = 0
    letterErrors = []
    for o, d in zip(original, decipherment):
        if o != d:
            mistakes += 1
            letterErrors.append(o+"="+d)

    letterErrors = set(letterErrors)

    if len(original) != len(decipherment):
            print("Length Difference", sys.argv[1])
        
    if len(sys.argv) > 3:
        if sys.argv[3] == "k":
            print((len(set(original))-len(letterErrors))/len(set(original)))
        elif sys.argv[3] == "d":
            print((len(original)-mistakes)/len(original))
        elif sys.argv[3] == "v":
            print(len(original)-mistakes,len(original))
        elif sys.argv[3] == "kv":
            print((len(set(original))-len(letterErrors)),len(set(original)))
    else:

        print("Original:    ",original)
        print("Decipherment:",decipherment,"\n")

        print("Text Length:", len(original))
        print("Number of Decipherment Errors:", mistakes)
        print("Number of Distinct Characters:", len(set(original)))
        print("Number of Mismapped Characters:", len(letterErrors), letterErrors)
        print()
        print("Key Accuracy:", (len(set(original))-len(letterErrors))/len(set(original)))
        print("Decipherment Accuracy:", (len(original)-mistakes)/len(original))