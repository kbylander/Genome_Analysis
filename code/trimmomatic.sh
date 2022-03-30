#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00:00
#SBATCH -J GA_trimmomatic
# --mail-type = ALL
# --mail-user karl.bylander.6061@student.uu.se

mkdir ../output/trimmomatic
module load bioinfo-tools
module load trimmomatic

trimmomatic PE -threads 2 -phred33 ./raw/ERR305399_1.fastq.gz ./raw/ERR305399_2.fastq.gz trimmomatic/ERR305399.left_paired.fastq.gz trimmomatic/ERR305399.left_unpaired.fastq.gz trimmomatic/ERR305399.right_paired.fastq.gz trimmomatic/ERR305399.right_unpaired.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

