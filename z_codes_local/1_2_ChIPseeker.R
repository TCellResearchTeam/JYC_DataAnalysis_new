########## ATACseq subsetted peak annotation ##########
# Author: Huitian (Yolanda) Diao
# Oct 6, 2018
# Reference: 
# - http://www.gzhshoulu.wang/article/7020564

########## Prerequisites ##########
# Dependencies:
# - 1. Peak calling <- MACS2
# - 2. Peak merging <- Homer
# - 3. Tn5 insertion site count <- HTseq-count
# - 4. Differentiaial analysis <- DEseq2
# - 5. Convert peak list to bed <- 3_2_slicebed.py 

########## libraries ##########
### Install dependencies
#source ("https://bioconductor.org/biocLite.R")
#biocLite("org.Hs.eg.db")
#biocLite("TxDb.Hsapiens.UCSC.hg38.knownGene")
#BiocManager::install("TxDb.Mmusculus.UCSC.mm10.knownGene", version = "3.8")
#BiocManager::install("org.Mm.eg.db", version = "3.8")

### Load libraries
library("ChIPseeker") # For peak annotation
library("GenomicFeatures") # For creating reference file
library(ReactomePA)
library("clusterProfiler")
#library("org.Hs.eg.db")
#library("TxDb.Hsapiens.UCSC.hg38.knownGene")
library("org.Mm.eg.db")
library("TxDb.Mmusculus.UCSC.mm10.knownGene")
library("ggplot2")
txdb <- TxDb.Mmusculus.UCSC.mm10.knownGene
#library('TxDb.Hsapiens.UCSC.hg38.lincRNAsTranscripts')
#lincRNA_txdb=TxDb.Hsapiens.UCSC.hg38.lincRNAsTranscripts


### Make TxDb annotation files
#hg38.refseq.db <- makeTxDbFromUCSC(genome="hg38", table="refGene") # Create reference file
mm10.refseq.db <- makeTxDbFromUCSC(genome="mm10", tablename="knownGene")


### Working directory
wk.dir <- "/Users/yolandatiao/Desktop/jycATAC/4_DEseq2_bed"
setwd(wk.dir)


### Input file list
input.files <- dir(wk.dir, pattern =".bed")
input.files


### Genomic features pie chart
if(FALSE) {
  for (i in input.files) {
    #i <- "all.df.numx.c5-Bcl6KO_Th1_vs_Naive-pval-0.05_dn.bed"
    peakAnno.i <- annotatePeak(i, tssRegion=c(-5000, 5000), TxDb=txdb, annoDb="org.Mm.eg.db")
    pdf(paste(i,".Pie.pdf",sep=""))
    plotAnnoPie(peakAnno.i)
    dev.off()
    pdf(paste(i, ".UpsetVennPie.pdf", sep=""), height=6, width=10)
    upsetplot(peakAnno.i, vennpie=TRUE)
    #class(upsetplot.i)
    dev.off()
  }
}

### Go-term dot plot
if (FALSE) {
  for (i in input.files) {
    #i <- "all.df.numx.c5-Bcl6KO_Th1_vs_Naive-pval-0.05_dn.bed"
    print(i)
    peakAnno.i <- annotatePeak(i, tssRegion=c(-5000, 5000), TxDb=txdb, annoDb="org.Mm.eg.db")
    df.peakAnno.i <- as.data.frame(peakAnno.i)
    #head(df.peakAnno.i$annotation)
    #class(df.peakAnno.i$annotation)
    #mode(df.peakAnno.i$annotation)
    #df.peakAnno.i.promoter <- subset(df.peakAnno.i, grepl("Promoter", annotation))
    #head(df.peakAnno.i.promoter)
    genes.i <- as.data.frame(peakAnno.i)$ENSEMBL
    genes.i
    egoBP <- enrichGO(gene = genes.i, keyType = 'ENSEMBL', OrgDb = org.Mm.eg.db, ont = "BP", pAdjustMethod = "BH", qvalueCutoff = 0.05, readable = TRUE)
    egoCC <- enrichGO(gene = genes.i, keyType = 'ENSEMBL', OrgDb = org.Mm.eg.db, ont = "CC", pAdjustMethod = "BH", qvalueCutoff = 0.05, readable = TRUE)
    egoMF <- enrichGO(gene = genes.i, keyType = 'ENSEMBL', OrgDb = org.Mm.eg.db, ont = "MF", pAdjustMethod = "BH", qvalueCutoff = 0.05, readable = TRUE)
    
    # Dotplot visualization
    egoBP.dotplot <- dotplot(egoBP, showCategory=25)
    ggsave(paste(i,"_BP_dotplot.pdf",sep=""), egoBP.dotplot, device = "pdf", width = 30, height = 20, units = "cm")
    
    egoCC.dotplot <- dotplot(egoCC, showCategory=25)
    ggsave(paste(i,"_CC_dotplot.pdf",sep=""), egoCC.dotplot, device = "pdf", width = 30, height = 20, units = "cm")
    
    egoMF.dotplot <- dotplot(egoMF, showCategory=25)
    ggsave(paste(i,"_MF_dotplot.pdf",sep=""), egoMF.dotplot, device = "pdf", width = 30, height = 20, units = "cm")
  }
}


### Annotation
if(FALSE) {
  for (i in input.files) {
    #i <- "all.df.numx.c5-Bcl6KO_Th1_vs_Naive-pval-0.05_dn.bed"
    peakAnno.i <- annotatePeak(i, tssRegion=c(-5000, 5000), TxDb=txdb, annoDb="org.Mm.eg.db")
    str(peakAnno.i)
    df.peakAnno.i <- as.data.frame(peakAnno.i)
    head(df.peakAnno.i)
    outname <- paste(i,".anno.csv",sep="")
    write.csv(df.peakAnno.i, file = outname)
  }
}


wk.dir <- "/Volumes/Huitian/jycATAC/0_codes"
setwd(wk.dir)

### Annotate whole reference file
if (FALSE) {
  i <- "jycATAC_merged_peaks.bed"
  peakAnno.i <- annotatePeak(i, tssRegion=c(-5000, 5000), TxDb=txdb, annoDb="org.Mm.eg.db")
  str(peakAnno.i)
  df.peakAnno.i <- as.data.frame(peakAnno.i)
  head(df.peakAnno.i)
  outname <- paste(i,".anno.csv",sep="")
  write.csv(df.peakAnno.i, file = outname)
}
    
    
    
    
    
    
    