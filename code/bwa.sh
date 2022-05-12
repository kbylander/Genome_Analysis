#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH --reservation=uppmax2022-2-5_7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 06:00:00
#SBATCH -J GA_bwa_0
#SBATCH -o /home/karlbyl/private/Genome_Analysis/logs/bwa_log2
#SBATCH -e /home/karlbyl/private/Genome_Analysis/logs/bwa_log2
#SBATCH --mail-type=ALL
#SBATCH --mail-user kalle.99@live.com

module load bioinfo-tools bwa samtools

REF_GENOME="/home/karlbyl/private/Genome_Analysis/output/genome_assembly/canu_results/Assembly_F_ferriphilum_03-29.contigs.fasta"
LEFT_PAIRED="/home/karlbyl/private/Genome_Analysis/output/expression_analysis/trimmomatic_results/*/*30.*left_paired.fastq*"
bwa index ${REF_GENOME}

for i in $LEFT_PAIRED
do
	READ_RIGHT=${i/.left_paired.fastq.gz/.right_paired.fastq.gz}
	NAME=$(basename $i .left_paired.fastq.gz)
	bwa mem -t 16 ${REF_GENOME} ${i} ${READ_RIGHT} | samtools sort -o /home/karlbyl/private/Genome_Analysis/output/expression_analysis/bwa_results/${NAME}.bam -
done
