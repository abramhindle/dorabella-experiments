#!/bin/bash

rm  -f results_k.txt results_v.txt
files=../TextDeciphermentPrograms/Decipherments/*

for file in $files
do
    python3 scripts/decAccuracy.py $file ../TextDeciphermentPrograms/samples/`basename $file` v >> results_v.txt
    python3 scripts/decAccuracy.py $file ../TextDeciphermentPrograms/samples/`basename $file` kv >> results_k.txt
done
printf "Key Accuracy\n"
python3 scripts/aggResults.py results_k.txt
printf "\nDecipherment Accuracy\n"
python3 scripts/aggResults.py results_v.txt


# rm results*
