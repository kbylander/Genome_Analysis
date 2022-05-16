# Genome Analysis
Genome_Analysis/code/

This directory contains scripts that are run for the analysis. 

Contains:

canu_assembly.sh - Performs a Genome assembly.

quast.sh - Evaluates generated assembly.

prokka.sh - Whole genome annotation.

bwa.sh - mapping sequences to our assembled genome. 

fastqc.sh - Evaluate read quality, before and after trimming. 

blastn.sh - Synteny information, run against our reference genome. 

trimmomatic.sh - Trim reads, setting similar to settings used in the article. 

htseq.sh - Calculate read count per gene.

index.sh - creates bai files, of the bam files from bwa. This is used in HTSeq. 

TruSeq3-PE.fa - Sequence files necessary in trimmomatic.sh

deseq2script.r - Script for differential analysis, this is not located in the uppmax directory, but is run on my local laptop with manually paths to given files. 
