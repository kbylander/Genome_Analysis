#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH --reservation=uppmax2022-2-5_3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 06:00:00
#SBATCH -J GA_bwa_0
#SBATCH -o /home/karlbyl/private/Genome_Analysis/logs/bwa_log
#SBATCH -e /home/karlbyl/private/Genome_Analysis/logs/bwa_log
#SBATCH --mail-type=ALL
#SBATCH --mail-user kalle.99@live.com

module load bioinfo-tools bwa samtools

REF_GENOME="/home/karlbyl/private/Genome_Analysis/output/genome_assembly/canu_results/Assembly_F_ferriphilum_03-29.contigs.fasta"
LEFT_PAIRED="/home/karlbyl/private/Genome_Analysis/output/expression_analysis/trimmomatic_results/*/*left_paired.fastq*"
bwa index ${REF_GENOME}

for i in $LEFT_PAIRED
do
	READ_RIGHT=${i/.left_paired.fastq.gz/.right_paired.fastq.gz}
	NAME=$(basename $i .left_paired.fastq.gz)
	bwa mem -t 8 ${REF_GENOME} ${i} ${READ_RIGHT} | samtools sort -@8 -o /home/karlbyl/private/Genome_Analysis/output/expression_analysis/${NAME}.bam -
done
