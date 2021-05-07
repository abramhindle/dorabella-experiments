import sys

correct = 0
total = 0
avg = 0

results = open(sys.argv[1]).read().split("\n")[:-1]

for line in results:
    data = line.split(" ")
    correct += int(data[0])
    total += int(data[1])
    avg += int(data[0])/int(data[1])

print(correct,"/",total)
print("Total Accuracy: ",correct/total)
print("Average Accuracy: ", avg/len(results))
