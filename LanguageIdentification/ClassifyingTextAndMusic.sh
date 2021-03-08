cd LangIDProgram

perl langid_lmopt.pl -c '../ClassifyingTextAndMusic/TestSamples/TestingBach/*' -p '../ClassifyingTextAndMusic/TrainingData/eng-bach/*' -r 20 -f 5 -b 10 > ../ClassifyingTextAndMusic/Results/Bach-EnBa.txt
perl langid_lmopt.pl -c '../ClassifyingTextAndMusic/TestSamples/TestingEng/*' -p '../ClassifyingTextAndMusic/TrainingData/eng-bach/*' -r 20 -f 5 -b 10 > ../ClassifyingTextAndMusic/Results/Eng-EnBa.txt

perl langid_lmopt.pl -c '../ClassifyingTextAndMusic/TestSamples/TestingElgar/*' -p '../ClassifyingTextAndMusic/TrainingData/eng-elgar/*' -r 20 -f 5 -b 10 > ../ClassifyingTextAndMusic/Results/Elgar-EnEl.txt
perl langid_lmopt.pl -c '../ClassifyingTextAndMusic/TestSamples/TestingEng/*' -p '../ClassifyingTextAndMusic/TrainingData/eng-elgar/*' -r 20 -f 5 -b 10 > ../ClassifyingTextAndMusic/Results/Eng-EnEl.txt

perl langid_lmopt.pl -c '../ClassifyingTextAndMusic/DorabellaTranscription.txt' -p '../ClassifyingTextAndMusic/TrainingData/eng-bach/*' -r 20 -f 5 -b 10 > ../ClassifyingTextAndMusic/Results/Dora-EnBa.txt
perl langid_lmopt.pl -c '../ClassifyingTextAndMusic/DorabellaTranscription.txt' -p '../ClassifyingTextAndMusic/TrainingData/eng-elgar/*' -r 20 -f 5 -b 10 > ../ClassifyingTextAndMusic/Results/Dora-EnEl.txt