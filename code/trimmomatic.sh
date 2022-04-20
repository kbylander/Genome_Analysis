#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00:00
#SBATCH -J GA_trimmomatic_1
#SBATCH -o /home/karlbyl/private/Genome_Analysis/logs/trimmomatic_ERR2036631_log
#SBATCH -e /home/karlbyl/private/Genome_Analysis/logs/trimmomatic_ERR2036631_log
#SBATCH --mail-type=ALL
#SBATCH --mail-user karl.bylander.6061@student.uu.se

module load bioinfo-tools trimmomatic

trimmomatic PE \
-threads 2 -phred33 \
/home/karlbyl/private/Genome_Analysis/raw_data/RNA_raw_data/ERR2036631_1.fastq.gz \
/home/karlbyl/private/Genome_Analysis/raw_data/RNA_raw_data/ERR2036631_2.fastq.gz \
/home/karlbyl/private/Genome_Analysis/output/expression_analysis/trimmomatic_results/ERR2036631_results/ERR2036631.left_paired.fastq.gz \
/home/karlbyl/private/Genome_Analysis/output/expression_analysis/trimmomatic_results/ERR2036631_results/ERR2036631.left_unpaired.fastq.gz \
/home/karlbyl/private/Genome_Analysis/output/expression_analysis/trimmomatic_results/ERR2036631_results/ERR2036631.right_paired.fastq.gz \
/home/karlbyl/private/Genome_Analysis/output/expression_analysis/trimmomatic_results/ERR2036631_results/ERR2036631.right_unpaired.fastq.gz \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 \
LEADING:3 TRAILING:3 SLIDINGWINDOW:1:3 MINLEN:40 MAXINFO:40:0.5 \

