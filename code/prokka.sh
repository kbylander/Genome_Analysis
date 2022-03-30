#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH --reservation=uppmax2022-2-5_2
#SBATCH -n 2
#SBATCH -t 00:10:00
#SBATCH -J GA_prokka_run
#SBATCH -o /home/karlbyl/private/Genome_Analysis/logs/prokka_log
#SBATCH -e /home/karlbyl/private/Genome_Analysis/logs/prokka_log
#SBATCH --mail-type=ALL
#SBATCH --mail-user karl.bylander.6061@student.uu.se

module load bioinfo-tools
module load prokka

prokka \
--outdir /home/karlbyl/private/Genome_Analysis/output/genome_assembly/prokka_results/ \
--addgenes --cpus 2 --kingdom Bacteria --species Leptospirillum_ferriphilum --strain DSM_14647T --prefix annotation-03-30 \
/home/karlbyl/private/Genome_Analysis/output/genome_assembly/canu_results/Assembly_F_ferriphilum_03-29.contigs.fasta

