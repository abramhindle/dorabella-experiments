uni2K = open("../Results/uni2KResults.txt").read().replace("\n", " ").split()
uni87 = open("../Results/uni87Results.txt").read().replace("\n", " ").split()
trial2K = open("../Results/trial2KResults.txt").read().replace("\n", " ").split()
trialNS2K = open("../Results/trialNS2KResults.txt").read().replace("\n", " ").split()
trial87 = open("../Results/trial87Results.txt").read().replace("\n", " ").split()
trialNS87 = open("../Results/trialNS87Results.txt").read().replace("\n", " ").split()

print("Method", "Length", "Spaces", "MRR", "AvgR", sep="\t", end="\n---------------------------------------\n")

def aggResults(method, length, spaces, data):
    MRR = []
    AvgRank = []
    Total = []

    for c, x in enumerate(data):
        x = float(x)
        if c%3 == 0:
            MRR.append(x)
        elif c%3 == 1:
            AvgRank.append(x)
        elif c%3 == 2:
            Total.append(x)

    print(method, length, spaces, round(sum(MRR)/sum(Total), 2), round(sum(AvgRank)/sum(Total), 2), sep="\t")

aggResults("UNIGRAM", "2000", "No", uni2K)
aggResults("UNIGRAM", "87", "No", uni87)
aggResults("TRIAL", "2000", "Yes", trial2K)
aggResults("TRIAL", "2000", "No", trialNS2K)
aggResults("TRIAL", "87", "Yes", trial87)
aggResults("TRIAL", "87", "No", trialNS87)
