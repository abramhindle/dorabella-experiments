import sys
import re
import random

samples = []

def getSample(wordList, sampleLen):

    for _ in range(100000):
        sample = random.randint(0,len(wordList)-(sampleLen+1))

        # prevent duplicate samples
        if sample in samples:
            continue
        else:
            samples.append(sample)

        sampleText = []

        for word in wordList[sample:]:
            sampleText.append(word)

            if len("".join(sampleText)) == sampleLen: # if we want to keep samples under 24 symbols and len(set(sampleText)) <= 24:
                return "".join(sampleText)
            elif len("".join(sampleText)) > sampleLen:
                break

    return False

if __name__ == "__main__":
    '''
    python3 randomTextSample.py [path of text] [number of samples to generate] [optionally add the output directory]
    python3 randomTextSample.py randomTextTest/test/Frankenstein.txt 10000 results/
    '''
    text = open(sys.argv[1]).read()
    text = re.sub(r"[^a-z ÆÐƎƏƐƔĲŊŒẞÞǷȜæðǝəɛɣĳŋœĸſßþƿȝĄƁÇĐƊĘĦĮƘŁØƠŞȘŢȚŦŲƯY̨Ƴąɓçđɗęħįƙłøơşșţțŧųưy̨ƴÁÀÂÄǍĂĀÃÅǺĄÆǼǢƁĆĊĈČÇĎḌĐƊÐÉÈĖÊËĚĔĒĘẸƎƏƐĠĜǦĞĢƔáàâäǎăāãåǻąæǽǣɓćċĉčçďḍđɗðéèėêëěĕēęẹǝəɛġĝǧğģɣĤḤĦIÍÌİÎÏǏĬĪĨĮỊĲĴĶƘĹĻŁĽĿʼNŃN̈ŇÑŅŊÓÒÔÖǑŎŌÕŐỌØǾƠŒĥḥħıíìiîïǐĭīĩįịĳĵķƙĸĺļłľŀŉńn̈ňñņŋóòôöǒŏōõőọøǿơœŔŘŖŚŜŠŞȘṢẞŤŢṬŦÞÚÙÛÜǓŬŪŨŰŮŲỤƯẂẀŴẄǷÝỲŶŸȲỸƳŹŻŽẒŕřŗſśŝšşșṣßťţṭŧþúùûüǔŭūũűůųụưẃẁŵẅƿýỳŷÿȳỹƴźżžẓ]", '', text.lower())
    sentenceList = text.split()

    for x in range(int(sys.argv[2])):
        result = getSample(sentenceList, int(sys.argv[4]))

        if not result: 
            break

        filename = sys.argv[3]+sys.argv[1].split("/")[-1].split(".")[0]+str(x+1)+".sample"

        fh = open(filename, "w")
        fh.write(result)