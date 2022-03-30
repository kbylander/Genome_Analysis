#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH --reservation=uppmax2022-2-5_2
#SBATCH -n 1
#SBATCH -t 00:10:00
#SBATCH -J GA_quast_run
#SBATCH -o /home/karlbyl/private/Genome_Analysis/logs/quast_log
#SBATCH -e /home/karlbyl/private/Genome_Analysis/logs/quast_log
#SBATCH --mail-type=ALL
#SBATCH --mail-user karl.bylander.6061@student.uu.se

module load bioinfo-tools
module load quast

quast.py \
-o /home/karlbyl/private/Genome_Analysis/trash/ \
--threads 1 \
-r /home/karlbyl/private/Genome_Analysis/raw_data/reference/OBMB01.fasta \
/home/karlbyl/private/Genome_Analysis/output/genome_assembly/canu_results/Assembly_F_ferriphilum_03-29.contigs.fasta

