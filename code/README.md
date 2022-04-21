# Genome Analysis
Genome_Analysis/code/

This directory contains scripts that are run for the analysis. 

Contains:
canu_assembly.sh - Perfomrs a Genome assembly.
quast.sh - Evaluates generated assembly.
prokka.sh - Whole genome annotation.
bwa.sh - mapping sequences to our assembled genome. 
fastqc.sh - Evaluate read quality, before and after trimming. 
blastn.sh - Synteny information, run against our reference genome. 
trimmomatic.sh - Trim reads, setting similar to settings used in the article. 
TruSeq3-PE.fa - Sequence files necessary in trimmomatic.sh
