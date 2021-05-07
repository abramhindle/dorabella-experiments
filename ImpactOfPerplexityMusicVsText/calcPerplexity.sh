printf "\nElgar Perplexity\n" > Results.txt
python3 perplexity.py LM/Elgar.arpa Samples/Elgar/ >> Results.txt
printf "\nBach Perplexity\n" >> Results.txt
python3 perplexity.py LM/Bach.arpa Samples/Bach/ >> Results.txt
printf "\nEnglish Perplexity\n" >> Results.txt
python3 perplexity.py LM/Eng.arpa Samples/English/ >> Results.txt
printf "\nMelody Perplexity\n" >> Results.txt
python3 perplexity.py ../Melody/Melody.arpa ../Melody/TestAndTrainingSets/TestSamples/ >> Results.txt
printf "\nBest Dorabella Decipherment\n" >> Results.txt
python3 perplexity.py ../Melody/Melody.arpa ./dora2/ >> Results.txt
printf "\nBest 4 English Decipherments\n" >> Results.txt
python3 perplexity.py ../Melody/Melody.arpa  ../Melody/DorabellaDecipherment/EnglishToMelody/ >> Results.txt

cat Results.txt
# rm Results.txt
