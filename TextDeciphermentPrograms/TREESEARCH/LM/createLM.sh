#!/bin/bash
LMCorpus=(LMCorpus/*)
echo "${LMCorpus[0]}"

python3 LMScripts/cleanTextChar.py ${LMCorpus[0]} > LMCorpus/cleanedTextChar.txt
python3 LMScripts/cleanTextWord.py ${LMCorpus[0]} > LMCorpus/cleanedTextWord.txt

perl LMScripts/get_unigram_lm.pl LMCorpus/cleanedTextChar.txt > LM/unigramChar.txt
perl LMScripts/get_bigram_lm.pl LMCorpus/cleanedTextChar.txt > LM/bigramChar.txt
perl LMScripts/get_trigram_lm.pl LMCorpus/cleanedTextChar.txt > LM/trigramChar.txt

perl LMScripts/get_unigram_lm.pl LMCorpus/cleanedTextWord.txt > LM/unigramWord.txt
perl LMScripts/get_bigram_lm.pl LMCorpus/cleanedTextWord.txt > LM/bigramWord.txt
perl LMScripts/get_trigram_lm.pl LMCorpus/cleanedTextWord.txt > LM/trigramWord.txt

perl LMScripts/deleted_interpolation.pl LMCorpus/cleanedTextChar.txt > LM/interpolationChar.txt
perl LMScripts/deleted_interpolation.pl LMCorpus/cleanedTextWord.txt > LM/interpolationWord.txt

python3 LMScripts/createPatternScript.py > LMScripts/get_pattern_list_inter.pl
perl LMScripts/get_pattern_list_inter.pl LMCorpus/cleanedTextWord.txt > LM/patternList.txt