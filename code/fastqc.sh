#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 01:30:00
#SBATCH -J GA_fastqc
#SBATCH -o /home/karlbyl/private/Genome_Analysis/logs/fastqc
#SBATCH -e /home/karlbyl/private/Genome_Analysis/logs/fastqc
#SBATCH --mail-type=ALL
#SBATCH --mail-user kalle.99@live.com

module load bioinfo-tools FastQC

UNTR_READS="/home/karlbyl/private/Genome_Analysis/raw_data/RNA_raw_data/*"
TRIM_READS="/home/karlbyl/private/Genome_Analysis/output/expression_analysis/trimmomatic_results/*/*_paired*"
OUTDIR="/home/karlbyl/private/Genome_Analysis/output/expression_analysis/fastqc_results"


for i in $UNTR_READS
do
	FILE1=$(basename ${i} .fastq.gz)	
	fastqc -t 8 -f fastq -o ${OUTDIR}/untrimmed ${i} 
	unset FILE1
done

for j in $TRIM_READS
do
        FILE2=$(basename ${j} .fastq.gz)
	fastqc -t 8 -f fastq -o ${OUTDIR}/trimmed ${j}
	unset FILE2
done

