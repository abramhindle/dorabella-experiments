cd Solver
rm masc_solver_mcts.pl
python3 createMCTSScript.py > masc_solver_mcts.pl

ciphers=../Ciphers/*

for file in $ciphers
do
    python3 cleanCipher.py $file | perl masc_solver_mcts.pl -n > ../Decipherments/${file:11}
done

for filename in ../Ciphers/*; do
    python2 norvigsolver.py $filename > ../Decipherments/`basename "$filename"`
done