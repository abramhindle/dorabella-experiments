cd LangIDProgram

#TRIAL on dorabella transcription
perl langid_lmopt.pl -c '../IsDorabellaEnglish/DorabellaTranscription.txt' -p '../AccuracyOnSyntheticCiphers/TrainingData/udhr-unicode-ns/*' -r 20 -f 5 -b 10 > ../IsDorabellaEnglish/Results/DorabellaResults.txt