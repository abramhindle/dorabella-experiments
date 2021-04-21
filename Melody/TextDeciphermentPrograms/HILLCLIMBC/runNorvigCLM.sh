cd Solver/

for filename in ../../Ciphers/*; do
    python2 norvigsolver.py $filename > ../Decipherments/`basename "$filename"`
done