#!/bin/bash

#SBATCH -J predict
#SBATCH -p cpu_student
#SBATCH --cpus-per-task=1
#SBATCH -N 1
#SBATCH -o CPUoutput.txt

module load python
#conda install python=3.6 numpy theano keras scikit-learn Biopython
cd ~/fyp/DeepViral_3newTry/
#python dvf.py -i ./test/bacterial_test.fasta -o ./test/ -l 300
python dvf.py -i ./test/DNA_test.fasta -o ./test/ -l 300
#python dvf.py -i ./test/RNA_test.fasta -o ./test/ -l 300
~

