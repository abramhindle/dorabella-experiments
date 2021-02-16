rm LM/count_1w.txt
rm LM/count_2l.txt
rm LM/count_2w.txt
rm LM/count_3l.txt

rm ../Solver/count_1w.txt
rm ../Solver/count_2l.txt
rm ../Solver/count_2w.txt
rm ../Solver/count_3l.txt

LMCorpus=(LMCorpus/*)
echo "${LMCorpus[0]}"

python3 LMScripts/norvigLM.py ${LMCorpus[0]} a

cp count_1w.txt ../Solver
cp count_2l.txt ../Solver
cp count_2w.txt ../Solver
cp count_3l.txt ../Solver

mv count_1w.txt LM
mv count_2l.txt LM
mv count_2w.txt LM
mv count_3l.txt LM