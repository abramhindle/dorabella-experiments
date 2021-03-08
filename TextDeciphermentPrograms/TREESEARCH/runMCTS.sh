cd Solver
python3 createMCTSScript.py > masc_solver_mcts.pl

for filename in ../../Ciphers/*; do
    python3 cleanCipher.py $filename | perl masc_solver_mcts.pl -n > ../Decipherments/`basename "$filename"`
done