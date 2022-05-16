rm(list = ls())
library("DESeq2")

directory <- "./htcut";
htseq_data= c("cont29.txt", "cont30.txt", "min31.txt", "min32.txt", "cont33.txt")

sampleCondition <- c('cont','cont','min','min','cont')

sampleTable <- data.frame(sampleName = htseq_data,
                          fileName = htseq_data,
                          condition = sampleCondition)

sampleTable$condition <- factor(sampleTable$condition)


ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                       directory = directory,
                                       design= ~ condition)
ddsHTSeq

DEs <- DESeq(ddsHTSeq)

resu <- results(DEs)
info=summary(DEs)
plotMA(DEs,ylim=c(-3,3))
