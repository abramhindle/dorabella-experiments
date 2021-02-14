#!/bin/bash


files=udhr-unicode/*.tra

for file in $files
do
    python3 rmspace.py $file > udhr-unicode-ns/${file:13}
done