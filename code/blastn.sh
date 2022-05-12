#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH --reservation=uppmax2022-2-5_10
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 10:00:00
#SBATCH -J GA_blastn
#SBATCH -o /home/karlbyl/private/Genome_Analysis/logs/blastn_log
#SBATCH -e /home/karlbyl/private/Genome_Analysis/logs/blastn_log
#SBATCH --mail-type=ALL
#SBATCH --mail-user kalle.99@live.com

module load bioinfo-tools blast

GENOME="/home/karlbyl/private/Genome_Analysis/output/genome_assembly/canu_results/Assembly_F_ferriphilum_03-29.contigs.fasta"
OUTDIR="/home/karlbyl/private/Genome_Analysis/output/genome_assembly/blastn_results"
REF="/home/karlbyl/private/Genome_Analysis/raw_data/reference/OBMB01.fasta"

blastn -query ${GENOME} -subject ${REF} -out ${OUTDIR}/blastn.out -outfmt 6
