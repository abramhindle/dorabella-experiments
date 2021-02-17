cd LangID
# Would recommend running these all in parallel with somthing like this
#screen -dm bash -c "perl langid_lmopt.pl -c '../TestSamples/2K/DeSamples2K/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/2K/DeSamples2KTrial.txt"
#screen -dm bash -c "perl langid_probdist.pl -c '../TestSamples/2K/DeSamples2K/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/2K/DeSamples2KUni.txt"
#screen -dm bash -c "perl langid_lmopt.pl -c '../TestSamples/2K/EnSamples2K/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/2K/EnSamples2KTrial.txt"
#screen -dm bash -c "perl langid_probdist.pl -c '../TestSamples/2K/EnSamples2K/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/2K/EnSamples2KUni.txt"

# 2000 length samples with spaces
perl langid_lmopt.pl -c '../TestSamples/2K/DeSamples2K/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/2K/DeSamples2KTrial.txt
perl langid_probdist.pl -c '../TestSamples/2K/DeSamples2K/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/2K/DeSamples2KUni.txt
perl langid_lmopt.pl -c '../TestSamples/2K/EnSamples2K/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/2K/EnSamples2KTrial.txt
perl langid_probdist.pl -c '../TestSamples/2K/EnSamples2K/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/2K/EnSamples2KUni.txt
perl langid_lmopt.pl -c '../TestSamples/2K/FrSamples2K/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/2K/FrSamples2KTrial.txt
perl langid_probdist.pl -c '../TestSamples/2K/FrSamples2K/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/2K/FrSamples2KUni.txt
perl langid_lmopt.pl -c '../TestSamples/2K/ItSamples2K/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/2K/ItSamples2KTrial.txt
perl langid_probdist.pl -c '../TestSamples/2K/ItSamples2K/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/2K/ItSamples2KUni.txt
perl langid_lmopt.pl -c '../TestSamples/2K/JASamples2K/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/2K/JASamples2KTrial.txt
perl langid_probdist.pl -c '../TestSamples/2K/JASamples2K/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/2K/JASamples2KUni.txt
perl langid_lmopt.pl -c '../TestSamples/2K/PlSamples2K/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/2K/PlSamples2KTrial.txt
perl langid_probdist.pl -c '../TestSamples/2K/PlSamples2K/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/2K/PlSamples2KUni.txt

# 2000 length samples with no spaces
perl langid_lmopt.pl -c '../TestSamples/2K/DeSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/2KNS/DeSamples2KTrialNS.txt
perl langid_probdist.pl -c '../TestSamples/2K/DeSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/2KNS/DeSamples2KUniNS.txt
perl langid_lmopt.pl -c '../TestSamples/2K/EnSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/2KNS/EnSamples2KTrialNS.txt
perl langid_probdist.pl -c '../TestSamples/2K/EnSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/2KNS/EnSamples2KUniNS.txt
perl langid_lmopt.pl -c '../TestSamples/2K/FrSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/2KNS/FrSamples2KTrialNS.txt
perl langid_probdist.pl -c '../TestSamples/2K/FrSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/2KNS/FrSamples2KUniNS.txt
perl langid_lmopt.pl -c '../TestSamples/2K/ItSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/2KNS/ItSamples2KTrialNS.txt
perl langid_probdist.pl -c '../TestSamples/2K/ItSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/2KNS/ItSamples2KUniNS.txt
perl langid_lmopt.pl -c '../TestSamples/2K/JASamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/2KNS/JASamples2KTrialNS.txt
perl langid_probdist.pl -c '../TestSamples/2K/JASamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/2KNS/JASamples2KUniNS.txt
perl langid_lmopt.pl -c '../TestSamples/2K/PlSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/2KNS/PlSamples2KTrialNS.txt
perl langid_probdist.pl -c '../TestSamples/2K/PlSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/2KNS/PlSamples2KUniNS.txt

# 87 length samples with spaces
perl langid_lmopt.pl -c '../TestSamples/87/DeSamples87/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/87/DeSamples87Trial.txt
perl langid_probdist.pl -c '../TestSamples/87/DeSamples87/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/87/DeSamples87Uni.txt
perl langid_lmopt.pl -c '../TestSamples/87/EnSamples87/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/87/EnSamples87Trial.txt
perl langid_probdist.pl -c '../TestSamples/87/EnSamples87/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/87/EnSamples87Uni.txt
perl langid_lmopt.pl -c '../TestSamples/87/FrSamples87/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/87/FrSamples87Trial.txt
perl langid_probdist.pl -c '../TestSamples/87/FrSamples87/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/87/FrSamples87Uni.txt
perl langid_lmopt.pl -c '../TestSamples/87/ItSamples87/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/87/ItSamples87Trial.txt
perl langid_probdist.pl -c '../TestSamples/87/ItSamples87/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/87/ItSamples87Uni.txt
perl langid_lmopt.pl -c '../TestSamples/87/JASamples87/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/87/JASamples87Trial.txt
perl langid_probdist.pl -c '../TestSamples/87/JASamples87/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/87/JASamples87Uni.txt
perl langid_lmopt.pl -c '../TestSamples/87/PlSamples87/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/87/PlSamples87Trial.txt
perl langid_probdist.pl -c '../TestSamples/87/PlSamples87/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/87/PlSamples87Uni.txt

# 87 length samples with no spaces
perl langid_lmopt.pl -c '../TestSamples/87/DeSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/87NS/DeSamples87TrialNS.txt
perl langid_probdist.pl -c '../TestSamples/87/DeSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/87NS/DeSamples87UniNS.txt
perl langid_lmopt.pl -c '../TestSamples/87/EnSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/87NS/EnSamples87TrialNS.txt
perl langid_probdist.pl -c '../TestSamples/87/EnSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/87NS/EnSamples87UniNS.txt
perl langid_lmopt.pl -c '../TestSamples/87/FrSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/87NS/FrSamples87TrialNS.txt
perl langid_probdist.pl -c '../TestSamples/87/FrSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/87NS/FrSamples87UniNS.txt
perl langid_lmopt.pl -c '../TestSamples/87/ItSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/87NS/ItSamples87TrialNS.txt
perl langid_probdist.pl -c '../TestSamples/87/ItSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/87NS/ItSamples87UniNS.txt
perl langid_lmopt.pl -c '../TestSamples/87/JASamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/87NS/JASamples87TrialNS.txt
perl langid_probdist.pl -c '../TestSamples/87/JASamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/87NS/JASamples87UniNS.txt
perl langid_lmopt.pl -c '../TestSamples/87/PlSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/87NS/PlSamples87TrialNS.txt
perl langid_probdist.pl -c '../TestSamples/87/PlSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/87NS/PlSamples87UniNS.txt

# 2000 length samples with spaces
perl langid_lmopt.pl -c '../TestSamples/2K2/DeSamples2K/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/2K/DeSamples2KTrial.txt2
perl langid_probdist.pl -c '../TestSamples/2K2/DeSamples2K/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/2K/DeSamples2KUni.txt2
perl langid_lmopt.pl -c '../TestSamples/2K2/EnSamples2K/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/2K/EnSamples2KTrial.txt2
perl langid_probdist.pl -c '../TestSamples/2K2/EnSamples2K/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/2K/EnSamples2KUni.txt2
perl langid_lmopt.pl -c '../TestSamples/2K2/FrSamples2K/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/2K/FrSamples2KTrial.txt2
perl langid_probdist.pl -c '../TestSamples/2K2/FrSamples2K/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/2K/FrSamples2KUni.txt2
perl langid_lmopt.pl -c '../TestSamples/2K2/ItSamples2K/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/2K/ItSamples2KTrial.txt2
perl langid_probdist.pl -c '../TestSamples/2K2/ItSamples2K/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/2K/ItSamples2KUni.txt2
perl langid_lmopt.pl -c '../TestSamples/2K2/JASamples2K/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/2K/JASamples2KTrial.txt2
perl langid_probdist.pl -c '../TestSamples/2K2/JASamples2K/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/2K/JASamples2KUni.txt2
perl langid_lmopt.pl -c '../TestSamples/2K2/PlSamples2K/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/2K/PlSamples2KTrial.txt2
perl langid_probdist.pl -c '../TestSamples/2K2/PlSamples2K/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/2K/PlSamples2KUni.txt2

# 2000 length samples with no spaces
perl langid_lmopt.pl -c '../TestSamples/2K2/DeSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/2KNS/DeSamples2KTrialNS.txt2
perl langid_probdist.pl -c '../TestSamples/2K2/DeSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/2KNS/DeSamples2KUniNS.txt2
perl langid_lmopt.pl -c '../TestSamples/2K2/EnSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/2KNS/EnSamples2KTrialNS.txt2
perl langid_probdist.pl -c '../TestSamples/2K2/EnSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/2KNS/EnSamples2KUniNS.txt2
perl langid_lmopt.pl -c '../TestSamples/2K2/FrSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/2KNS/FrSamples2KTrialNS.txt2
perl langid_probdist.pl -c '../TestSamples/2K2/FrSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/2KNS/FrSamples2KUniNS.txt2
perl langid_lmopt.pl -c '../TestSamples/2K2/ItSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/2KNS/ItSamples2KTrialNS.txt2
perl langid_probdist.pl -c '../TestSamples/2K2/ItSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/2KNS/ItSamples2KUniNS.txt2
perl langid_lmopt.pl -c '../TestSamples/2K2/JASamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/2KNS/JASamples2KTrialNS.txt2
perl langid_probdist.pl -c '../TestSamples/2K2/JASamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/2KNS/JASamples2KUniNS.txt2
perl langid_lmopt.pl -c '../TestSamples/2K2/PlSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/2KNS/PlSamples2KTrialNS.txt2
perl langid_probdist.pl -c '../TestSamples/2K2/PlSamples2KNS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/2KNS/PlSamples2KUniNS.txt2

# 87 length samples with spaces
perl langid_lmopt.pl -c '../TestSamples/872/DeSamples87/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/87/DeSamples87Trial.txt2
perl langid_probdist.pl -c '../TestSamples/872/DeSamples87/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/87/DeSamples87Uni.txt2
perl langid_lmopt.pl -c '../TestSamples/872/EnSamples87/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/87/EnSamples87Trial.txt2
perl langid_probdist.pl -c '../TestSamples/872/EnSamples87/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/87/EnSamples87Uni.txt2
perl langid_lmopt.pl -c '../TestSamples/872/FrSamples87/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/87/FrSamples87Trial.txt2
perl langid_probdist.pl -c '../TestSamples/872/FrSamples87/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/87/FrSamples87Uni.txt2
perl langid_lmopt.pl -c '../TestSamples/872/ItSamples87/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/87/ItSamples87Trial.txt2
perl langid_probdist.pl -c '../TestSamples/872/ItSamples87/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/87/ItSamples87Uni.txt2
perl langid_lmopt.pl -c '../TestSamples/872/JASamples87/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/87/JASamples87Trial.txt2
perl langid_probdist.pl -c '../TestSamples/872/JASamples87/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/87/JASamples87Uni.txt2
perl langid_lmopt.pl -c '../TestSamples/872/PlSamples87/*' -p '../TrainingData/udhr-unicode/*' -r 20 -f 5 -b 10 > ../Results/87/PlSamples87Trial.txt2
perl langid_probdist.pl -c '../TestSamples/872/PlSamples87/*' -p '../TrainingData/udhr-unicode/*' -d unigram > ../Results/87/PlSamples87Uni.txt2

# 87 length samples with no spaces
perl langid_lmopt.pl -c '../TestSamples/872/DeSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/87NS/DeSamples87TrialNS.txt2
perl langid_probdist.pl -c '../TestSamples/872/DeSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/87NS/DeSamples87UniNS.txt2
perl langid_lmopt.pl -c '../TestSamples/872/EnSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/87NS/EnSamples87TrialNS.txt2
perl langid_probdist.pl -c '../TestSamples/872/EnSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/87NS/EnSamples87UniNS.txt2
perl langid_lmopt.pl -c '../TestSamples/872/FrSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/87NS/FrSamples87TrialNS.txt2
perl langid_probdist.pl -c '../TestSamples/872/FrSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/87NS/FrSamples87UniNS.txt2
perl langid_lmopt.pl -c '../TestSamples/872/ItSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/87NS/ItSamples87TrialNS.txt2
perl langid_probdist.pl -c '../TestSamples/872/ItSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/87NS/ItSamples87UniNS.txt2
perl langid_lmopt.pl -c '../TestSamples/872/JASamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/87NS/JASamples87TrialNS.txt2
perl langid_probdist.pl -c '../TestSamples/872/JASamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/87NS/JASamples87UniNS.txt2
perl langid_lmopt.pl -c '../TestSamples/872/PlSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../Results/87NS/PlSamples87TrialNS.txt2
perl langid_probdist.pl -c '../TestSamples/872/PlSamples87NS/*' -p '../TrainingData/udhr-unicode-ns/*' -d unigram > ../Results/87NS/PlSamples87UniNS.txt2