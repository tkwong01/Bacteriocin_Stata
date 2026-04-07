#!/bin/bash
#SBATCH --job-name=STATA_MP
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8   # Requesting 8 cores for MP
#SBATCH --mem=60G

module load stata/18
stata-mp -b do 1.Load_Transpose.do
