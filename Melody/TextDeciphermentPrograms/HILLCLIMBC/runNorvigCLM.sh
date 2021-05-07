cd Solver/

for filename in ../../Ciphers/*; do
    time python2 norvigsolver.py $filename > ../Decipherments/`basename "$filename"`
done
