#!/bin/bash

files=decipherments/*

for file in $files
do
    python3 scripts/decAccuracy.py $file ../MusicSamples/Elgar/${file:14} v >> results_v.txt
    python3 scripts/decAccuracy.py $file ../MusicSamples/Elgar/${file:14} kv >> results_k.txt
done
    printf "Key Accuracy\n"
    python3 scripts/aggResults.py results_k.txt
    printf "\nDecipherment Accuracy\n"
    python3 scripts/aggResults.py results_v.txt


rm results*