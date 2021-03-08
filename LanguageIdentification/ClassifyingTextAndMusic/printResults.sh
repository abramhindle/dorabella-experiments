printf "\nBach Vs English:\n\nBach Acc\n"
python3 calcResults.py Results/Bach-EnBa.txt ba.tra
printf "\nEnglish Acc\n"
python3 calcResults.py Results/Eng-EnBa.txt eng.tra
printf "\nDorabella log-probability\n"
python3 outputProb.py Results/Dora-EnBa.txt

printf "\n==================================\nElgar Vs English:\n\nElgar Acc\n"
python3 calcResults.py Results/Elgar-EnEl.txt el.tra
printf "\nEnglish Acc\n"
python3 calcResults.py Results/Eng-EnEl.txt eng.tra
printf "\nDorabella log-probability\n"
python3 outputProb.py Results/Dora-EnEl.txt