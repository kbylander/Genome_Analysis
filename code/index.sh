#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 03:00:00
#SBATCH -J GA_index
#SBATCH -o /home/karlbyl/private/Genome_Analysis/logs/htseq_logs
#SBATCH -e /home/karlbyl/private/Genome_Analysis/logs/htseq_logs
#SBATCH --mail-type=ALL
#SBATCH --mail-user kalle.99@live.com

module load bioinfo-tools samtools

cd /home/karlbyl/private/Genome_Analysis/output/expression_analysis/bwa_results/

for i in .bam
do
samtools index $i
done
