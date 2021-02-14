python3 randomTextSample.py Corpus/de.tes 1000 87/DeSamples87/ 87
python3 randomTextSample.py Corpus/en.tes 1000 87/EnSamples87/ 87
python3 randomTextSample.py Corpus/fr.tes 1000 87/FrSamples87/ 87
python3 randomTextSample.py Corpus/it.tes 1000 87/ItSamples87/ 87
python3 randomTextSample.py Corpus/LJA.txt 1000 87/JASamples87/ 87
python3 randomTextSample.py Corpus/pl.tes 1000 87/PlSamples87/ 87

for filename in 87/DeSamples87/*; do
    python3 rmSpaces.py $filename > 87/DeSamples87NS/`basename "$filename"`
done

for filename in 87/EnSamples87/*; do
    python3 rmSpaces.py $filename > 87/EnSamples87NS/`basename "$filename"`
done

for filename in 87/FrSamples87/*; do
    python3 rmSpaces.py $filename > 87/FrSamples87NS/`basename "$filename"`
done

for filename in 87/ItSamples87/*; do
    python3 rmSpaces.py $filename > 87/ItSamples87NS/`basename "$filename"`
done

for filename in 87/JASamples87/*; do
    python3 rmSpaces.py $filename > 87/JASamples87NS/`basename "$filename"`
done

for filename in 87/PlSamples87/*; do
    python3 rmSpaces.py $filename > 87/PlSamples87NS/`basename "$filename"`
done

python3 randomTextSample.py Corpus/de.tes 1000 2K/DeSamples2K/ 2000
python3 randomTextSample.py Corpus/en.tes 1000 2K/EnSamples2K/ 2000
python3 randomTextSample.py Corpus/fr.tes 1000 2K/FrSamples2K/ 2000
python3 randomTextSample.py Corpus/it.tes 1000 2K/ItSamples2K/ 2000
python3 randomTextSample.py Corpus/LJA.txt 1000 2K/JASamples2K/ 2000
python3 randomTextSample.py Corpus/pl.tes 1000 2K/PlSamples2K/ 2000

for filename in 2K/DeSamples2K/*; do
    python3 rmSpaces.py $filename > 2K/DeSamples2KNS/`basename "$filename"`
done

for filename in 2K/EnSamples2K/*; do
    python3 rmSpaces.py $filename > 2K/EnSamples2KNS/`basename "$filename"`
done

for filename in 2K/FrSamples2K/*; do
    python3 rmSpaces.py $filename > 2K/FrSamples2KNS/`basename "$filename"`
done

for filename in 2K/ItSamples2K/*; do
    python3 rmSpaces.py $filename > 2K/ItSamples2KNS/`basename "$filename"`
done

for filename in 2K/JASamples2K/*; do
    python3 rmSpaces.py $filename > 2K/JASamples2KNS/`basename "$filename"`
done

for filename in 2K/PlSamples2K/*; do
    python3 rmSpaces.py $filename > 2K/PlSamples2KNS/`basename "$filename"`
done