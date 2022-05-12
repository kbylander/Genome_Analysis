#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 08:00:00
#SBATCH -J GA_htseq
#SBATCH -o /home/karlbyl/private/Genome_Analysis/logs/htseq_logs
#SBATCH -e /home/karlbyl/private/Genome_Analysis/logs/htseq_logs
#SBATCH --mail-type=ALL
#SBATCH --mail-user kalle.99@live.com

module load bioinfo-tools htseq

BAM_FILE="/home/karlbyl/private/Genome_Analysis/output/expression_analysis/bwa_results/*.bam"
GFF_file="/home/karlbyl/private/Genome_Analysis/output/genome_assembly/prokka_results/annotation-03-30.gff"
OUTFILE="/home/karlbyl/private/Genome_Analysis/output/expression_analysis/htseq_results/"

htseq-count -s no -t CDS -r pos -i ID -f bam ${BAM_FILE} ${GFF_file} > ${OUTFILE}/htseq_results.txt
