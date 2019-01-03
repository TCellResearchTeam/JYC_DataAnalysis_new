########## ChIP Peak Differential Analysis ##########
# Author: Huitian (Yolanda) Diao
# Oct 31, 2018

########## Prerequisites ##########
# Aligned Bam files
# MACS2 called peaks (narrowPeak file)
# Data info spreadsheet

########## Reference ##########
# https://mp.weixin.qq.com/s/fiMhFDr14AN4hdCNAoTnsA

library(DiffBind)
setwd("/gpfs/group/pipkin/jycATAC/DiffBind")

### Load data
dbObj <- dba(sampleSheet="/gpfs/group/pipkin/jycATAC/DiffBind/jyc.ChIP.cond.csv")
### Calculate binding matrix
dbObj <- dba.count(dbObj, summits=100) # "Summits" option re-center each peak around the point of greatest enrichment, peak width 200bp

### Check dba
dba.plotPCA(dbObj,  attributes=DBA_FACTOR)
pdf("dba.plotPCA.pdf")
plot(dbObj)
dev.off()

### Establishing contrast
dbObj <- dba.contrast(dbObj, categories=DBA_FACTOR, minMembers = 2)

### Differential binding analysis
dbObj <- dba.analyze(dbObj, method=DBA_ALL_METHODS)

### Check differential analysis
pdf("dba.plotVenn.pdf")
dba.plotVenn(dbObj,contrast=1,method=DBA_ALL_METHODS)
dev.off()

# Retrieve count results
counts <- dba.peakset(dbObj, bRetrieve=T, DataType=DBA_DATA_FRAME)

dbObj <- dba.count(dbObj, peaks=NULL, score=DBA_SCORE_READS)
counts.raw <- dba.peakset(dbObj, bRetrieve=T, DataType=DBA_DATA_FRAME)

write.table(counts, file="/gpfs/group/pipkin/jycATAC/DiffBind/counts.csv", sep=",", quote=F)
write.table(counts.raw, file="/gpfs/group/pipkin/jycATAC/DiffBind/counts.raw.csv", sep=",", quote=F)