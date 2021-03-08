cd LangIDProgram

# 2000 length samples with spaces
perl langid_lmopt.pl -c '../ImpactOfLanguageSampleSize/TestSamples/Samples/En/*' -p '../ImpactOfLanguageSampleSize/TrainingData/open-subtitles/*' -r 20 -f 5 -b 10 > ../ImpactOfLanguageSampleSize/Results/EnResults.txt
perl langid_lmopt.pl -c '../ImpactOfLanguageSampleSize/TestSamples/Samples/Fr/*' -p '../ImpactOfLanguageSampleSize/TrainingData/open-subtitles/*' -r 20 -f 5 -b 10 > ../ImpactOfLanguageSampleSize/Results/FrResults.txt
perl langid_lmopt.pl -c '../ImpactOfLanguageSampleSize/TestSamples/Samples/Pl/*' -p '../ImpactOfLanguageSampleSize/TrainingData/open-subtitles/*' -r 20 -f 5 -b 10 > ../ImpactOfLanguageSampleSize/Results/PlResults.txt
perl langid_lmopt.pl -c '../ImpactOfLanguageSampleSize/TestSamples/Samples/De/*' -p '../ImpactOfLanguageSampleSize/TrainingData/open-subtitles/*' -r 20 -f 5 -b 10 > ../ImpactOfLanguageSampleSize/Results/DeResults.txt
perl langid_lmopt.pl -c '../ImpactOfLanguageSampleSize/TestSamples/Samples/It/*' -p '../ImpactOfLanguageSampleSize/TrainingData/open-subtitles/*' -r 20 -f 5 -b 10 > ../ImpactOfLanguageSampleSize/Results/ItResults.txt