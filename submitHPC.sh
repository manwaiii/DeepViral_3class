#!/bin/bash

#SBATCH -J test
#SBATCH -p gpu_student
#SBATCH --cpus-per-task=1
#SBATCH -N 1
#SBATCH --gres=gpu:1
#SBATCH -o GPUoutput.txt

module load python
cd /home/manwho5/fyp/DeepViral_3newTry/
# Fragmenting sequences into fixed lengths, and encoding them using one-hot encoding (may take about 5 minutes)
#for l in 500 1000 2000
#do
# for training 
#python encode.py -i ./training_data/tr/RNA_tr.fasta -l $l
#python encode.py -i ./training_data/tr/DNA_tr.fasta -l $l
#python encode.py -i ./training_data/tr/bacterial_tr.fasta -l $l
# for validation
#python encode.py -i ./training_data/val/RNA_val.fasta -l $l
#python encode.py -i ./training_data/val/DNA_val.fasta -l $l
#python encode.py -i ./training_data/val/bacterial_val.fasta -l $l
#done

# Training multiple models for different contig lengths
# The following deep neural networks is with 500 filters of length 10 in the convolutional layer, 
# and 500 dense neurons in the dense layer. Training for 10 epochs.
# Users may add THEANO_FLAGS='mode=FAST_RUN,device=cuda0,floatX=float32,GPUARRAY_CUDA_VERSION=80' in front of the python command to set GPU and cuda.
# Using GPU (k40), the training process takes about 20 minutes
#for l in 500 1000 2000
#do
#python train.py -l $l -i ./training_data/tr/encode -j ./training_data/val/encode -o ./training_data/models -f 10 -n 500 -d 500 -e 10
#done
python train.py -l 2000 -i ./training_data/tr/encode -j ./training_data/val/encode -o ./training_data/models -f 10 -n 500 -d 500 -e 10
