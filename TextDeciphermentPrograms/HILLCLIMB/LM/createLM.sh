#!/bin/bash
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