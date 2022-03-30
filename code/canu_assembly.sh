#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00:00
#SBATCH -J GA_canu_run
#SBACTH -e /home/karlbyl/private/Genome_Analysis/logs/canu_logs
#SBACTH -o /home/karlbyl/private/Genome_Analysis/logs/canu_logs
#SBATCH --mail-type=ALL
#SBATCH --mail-user karl.bylander.6061@student.uu.se

module load bioinfo-tools
module load canu/2.0

canu -p Assembly_F_ferriphilum_03-29 \
-d /home/karlbyl/private/Genome_Analysis/output \
genomeSize=2.4m useGrid=false -maxThreads=4 \
-pacbio-raw /home/karlbyl/private/Genome_Analysis/raw_data/DNA_raw_data/*

