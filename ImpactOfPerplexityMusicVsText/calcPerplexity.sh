printf "\nElgar Perplexity\n" >> Results.txt
python3 perplexity.py LM/Elgar.arpa Samples/Elgar/ >> Results.txt
printf "\nBach Perplexity\n" >> Results.txt
python3 perplexity.py LM/Bach.arpa Samples/Bach/ >> Results.txt
printf "\nEnglish Perplexity\n" >> Results.txt
python3 perplexity.py LM/Eng.arpa Samples/English/ >> Results.txt

cat Results.txt
rm Results.txt