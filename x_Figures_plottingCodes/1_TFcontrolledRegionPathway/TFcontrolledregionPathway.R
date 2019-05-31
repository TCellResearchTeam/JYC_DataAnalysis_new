########## TFcontrolledregionPathway ##########
# Author: Huitian (Yolanda) Diao
# Nov 12th, 2018

########## Prerequisites ##########
# Dependencies:
# - 1. bed files <- 3_2_slicebed_multi.py
# - 2. seperate merged peaks by TF <- fc_TFpeak_sep.sh
# - 3. merged peaks TF annotation <- 4_0.0.7_homer.motif.finding_annoMergedPeaks.sh
# - 4. peak merging <- Homer
# ... etc.

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

mm10.refseq.db <- makeTxDbFromUCSC(genome="mm10", tablename="knownGene")

########## Self-defined functions ##########
pathway <- function(indir, basedir, i){
  #indir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/1_TFcontrolledRegionPathway/up"
  #basedir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/1_TFcontrolledRegionPathway/WT-Tfh_vs_Naive--up"
  #i <- "AP-1_bZIP--ThioMac-PU.1-ChIP-Seq_GSE21512/all.df.numx.c5-STAT4_WT_Tfh_vs_Naive-pval-0.05_up.bed"
  
  setwd(indir)
  peakAnno.i <- annotatePeak(i, tssRegion=c(-5000, 5000), TxDb=txdb, annoDb="org.Mm.eg.db")
  df.peakAnno.i <- as.data.frame(peakAnno.i)
  outnamebase <- unlist(strsplit(i, "/"))
  outnamebase <- head(outnamebase, n=1)
  print(outnamebase)
  
  genes.i <- as.data.frame(peakAnno.i)$ENSEMBL
  egoBP <- enrichGO(gene = genes.i, keyType = 'ENSEMBL', OrgDb = org.Mm.eg.db, ont = "BP", pAdjustMethod = "BH", qvalueCutoff = 0.05, readable = TRUE)
  egoCC <- enrichGO(gene = genes.i, keyType = 'ENSEMBL', OrgDb = org.Mm.eg.db, ont = "CC", pAdjustMethod = "BH", qvalueCutoff = 0.05, readable = TRUE)
  egoMF <- enrichGO(gene = genes.i, keyType = 'ENSEMBL', OrgDb = org.Mm.eg.db, ont = "MF", pAdjustMethod = "BH", qvalueCutoff = 0.05, readable = TRUE)
  
  setwd(basedir)
  outnameanno <- paste(outnamebase,".anno.csv",sep="")
  write.csv(df.peakAnno.i, file = outnameanno)
  write.csv(egoBP@result, file = paste(outnamebase,"_BP.csv",sep=""))
  write.csv(egoCC@result, file = paste(outnamebase,"_CC.csv",sep=""))
  write.csv(egoMF@result, file = paste(outnamebase,"_MF.csv",sep=""))
  egoBP.dotplot <- dotplot(egoBP, showCategory=25)
  ggsave(paste(outnamebase,"_BP_dotplot.pdf",sep=""), egoBP.dotplot, device = "pdf", width = 30, height = 20, units = "cm")
  egoCC.dotplot <- dotplot(egoCC, showCategory=25)
  ggsave(paste(outnamebase,"_CC_dotplot.pdf",sep=""), egoCC.dotplot, device = "pdf", width = 30, height = 20, units = "cm")
  egoMF.dotplot <- dotplot(egoMF, showCategory=25)
  ggsave(paste(outnamebase,"_MF_dotplot.pdf",sep=""), egoMF.dotplot, device = "pdf", width = 30, height = 20, units = "cm")
}

### WT-Tfh v.s. Naive upregulated
if (TRUE) {
  updir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/1_TFcontrolledRegionPathway/up"
  outdir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/1_TFcontrolledRegionPathway/WT-Tfh_vs_Naive--up"
  setwd(updir)
  file.list <- list.files(pattern = "all.df.numx.c5-WT_Tfh_vs_Naive-pval-0.05_up.bed$", recursive = TRUE)
  for (filex in file.list[1:5]){
    print(filex)
    pathway(updir, outdir, filex)
  }
}

### WT-Tfh v.s. Naive downregulated
if (FALSE) {
  updir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/1_TFcontrolledRegionPathway/dn"
  outdir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/1_TFcontrolledRegionPathway/WT-Tfh_vs_Naive--dn"
  setwd(updir)
  file.list <- list.files(pattern = "all.df.numx.c5-WT_Tfh_vs_Naive-pval-0.05_dn.bed$", recursive = TRUE)
  for (filex in file.list){
    print(filex)
    pathway(updir, outdir, filex)
  }
}


### WT-Tfh v.s. WT-Th1 upregulated
if (TRUE) {
  updir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/1_TFcontrolledRegionPathway/up"
  outdir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/1_TFcontrolledRegionPathway/WT_Tfh_vs_WT_Th1--up"
  setwd(updir)
  file.list <- list.files(pattern = "all.df.numx.c5-WT_Tfh_vs_WT_Th1-pval-0.05_up.bed$", recursive = TRUE)
  for (filex in file.list){
    print(filex)
    pathway(updir, outdir, filex)
  }
}

### WT-Tfh v.s. WT-Th1 downregulated
if (TRUE) {
  updir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/1_TFcontrolledRegionPathway/dn"
  outdir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/1_TFcontrolledRegionPathway/WT_Tfh_vs_WT_Th1--dn"
  setwd(updir)
  file.list <- list.files(pattern = "all.df.numx.c5-WT_Tfh_vs_WT_Th1-pval-0.05_dn.bed$", recursive = TRUE)
  for (filex in file.list){
    print(filex)
    pathway(updir, outdir, filex)
  }
}












