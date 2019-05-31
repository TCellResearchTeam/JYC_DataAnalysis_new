#################### motifHeatMap ####################
# Author: Huitian (Yolanda) Diao
# Nov 11th , 2018
# Dependencies:
# 1. Data prep <- prep_motifHeatMap.py <- fc_motifHeatMap.py
# 2. Motif finding <- Homer
# etc...

#################### Imports ####################
library(pheatmap)
library(RColorBrewer)
library(viridis)

#################### Self-defined functions ####################
fnameNoPathPdf <- function(namex){
  namex.vec <- unlist(strsplit(namex, "/"))
  namex <- tail(namex.vec, n=1)
  namex <- gsub(".csv", "new.pdf", namex)
  return(namex)
}

fnameNoPath <- function(namex){
  namex.vec <- unlist(strsplit(namex, "/"))
  namex <- tail(namex.vec, n=1)
  namex <- gsub(".csv", "", namex)
  return(namex)
}

save_pheatmap_pdf <- function(x, filename, width=7, height=7) {
  stopifnot(!missing(x))
  stopifnot(!missing(filename))
  pdf(filename, width=width, height=height)
  grid::grid.newpage()
  grid::grid.draw(x$gtable)
  dev.off()
}

setRnames <- function(tabx){
  row.names(tabx) <- unlist(tabx[,1])
  head(tabx)
  tabx[,1] <- NULL
  return(tabx)
}

#################### Main ####################

########## vs Naive -- up_c10_byfamily ##########
if (FALSE) {
  wk.dir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsWT-Tfh-Naive_updn/WT_Tfh_vs_Naive"
  setwd(wk.dir)
  infile <- "vsNaive_pval-0.05_up-sig_c10-WT_Tfh_vs_Naive_diffHeatmap_byfamily.csv"
  outname <- fnameNoPathPdf(infile)
  intab <- read.csv(infile)
  intab <- setRnames(intab)
  myBreaks <- seq(-8, 8, by=0.25)
  myColor <- colorRampPalette(c("royalblue4","royalblue1", "white", "red1", "red4"))(length(myBreaks))
  heat.map <- pheatmap(mat = intab, color=myColor, breaks=myBreaks, border_color = "white", 
                       show_rownames = TRUE, show_colnames = TRUE, fontsize = 6,
                       cellwidth = 9, cellheight = 9,
                       cluster_cols = FALSE, cluster_rows = TRUE)
  
  save_pheatmap_pdf(heat.map, outname, 5, 10)
}


if (FALSE) {
  wk.dir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsWT-Tfh-Naive_updn/WT_Tfh_vs_Naive"
  setwd(wk.dir)
  infile <- "vsNaive_pval-0.05_up-sig_c25-WT_Tfh_vs_Naive_diffHeatmap_byfamily.csv"
  outname <- fnameNoPathPdf(infile)
  intab <- read.csv(infile)
  intab <- setRnames(intab)
  myBreaks <- seq(-8, 8, by=0.25)
  myColor <- colorRampPalette(c("royalblue4","royalblue1", "white", "red1", "red4"))(length(myBreaks))
  heat.map <- pheatmap(mat = intab, color=myColor, breaks=myBreaks, border_color = "white", 
                       show_rownames = TRUE, show_colnames = TRUE, fontsize = 6,
                       cellwidth = 9, cellheight = 9,
                       cluster_cols = FALSE, cluster_rows = TRUE)
  
  save_pheatmap_pdf(heat.map, outname, 5, 10)
}


if (FALSE) {
  wk.dir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsWT-Tfh-Naive_updn/WT_Tfh_vs_Naive"
  setwd(wk.dir)
  infile <- "vsNaive_pval-0.05_dn-sig_c10-WT_Tfh_vs_Naive_diffHeatmap_byfamily.csv"
  outname <- fnameNoPathPdf(infile)
  intab <- read.csv(infile)
  intab <- setRnames(intab)
  myBreaks <- seq(-10, 10, by=0.25)
  myColor <- colorRampPalette(c("mediumpurple4","mediumpurple1", "white", "orange1", "orange4"))(length(myBreaks))
  heat.map <- pheatmap(mat = intab, color=myColor, breaks=myBreaks, border_color = "white", 
                       show_rownames = TRUE, show_colnames = TRUE, fontsize = 6,
                       cellwidth = 9, cellheight = 9,
                       cluster_cols = FALSE, cluster_rows = TRUE)
  
  save_pheatmap_pdf(heat.map, outname, 5, 10)
}

if (FALSE) {
  wk.dir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsWT-Tfh-Naive_updn/WT_Tfh_vs_Naive"
  setwd(wk.dir)
  infile <- "vsNaive_pval-0.05_dn-sig_c25-WT_Tfh_vs_Naive_diffHeatmap_byfamily.csv"
  outname <- fnameNoPathPdf(infile)
  intab <- read.csv(infile)
  intab <- setRnames(intab)
  myBreaks <- seq(-10, 10, by=0.25)
  myColor <- colorRampPalette(c("mediumpurple4","mediumpurple1", "white", "orange1", "orange4"))(length(myBreaks))
  heat.map <- pheatmap(mat = intab, color=myColor, breaks=myBreaks, border_color = "white", 
                       show_rownames = TRUE, show_colnames = TRUE, fontsize = 6,
                       cellwidth = 9, cellheight = 9,
                       cluster_cols = FALSE, cluster_rows = TRUE)
  
  save_pheatmap_pdf(heat.map, outname, 5, 10)
}


if (FALSE) {
  wk.dir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsWT-Tfh-Naive_updn/WT_Th1_vs_Naive"
  setwd(wk.dir)
  infile <- "vsNaive_pval-0.05_up-sig_c10-WT_Th1_vs_Naive_diffHeatmap_byfamily.csv"
  outname <- fnameNoPathPdf(infile)
  intab <- read.csv(infile)
  intab <- setRnames(intab)
  myBreaks <- seq(-8, 8, by=0.25)
  myColor <- colorRampPalette(c("royalblue4","royalblue1", "white", "red1", "red4"))(length(myBreaks))
  heat.map <- pheatmap(mat = intab, color=myColor, breaks=myBreaks, border_color = "white", 
                       show_rownames = TRUE, show_colnames = TRUE, fontsize = 6,
                       cellwidth = 9, cellheight = 9,
                       cluster_cols = FALSE, cluster_rows = TRUE)
  
  save_pheatmap_pdf(heat.map, outname, 5, 10)
}

if (FALSE) {
  wk.dir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsWT-Tfh-Naive_updn/WT_Th1_vs_Naive"
  setwd(wk.dir)
  infile <- "vsNaive_pval-0.05_up-sig_c25-WT_Th1_vs_Naive_diffHeatmap_byfamily.csv"
  outname <- fnameNoPathPdf(infile)
  intab <- read.csv(infile)
  intab <- setRnames(intab)
  myBreaks <- seq(-8, 8, by=0.25)
  myColor <- colorRampPalette(c("royalblue4","royalblue1", "white", "red1", "red4"))(length(myBreaks))
  heat.map <- pheatmap(mat = intab, color=myColor, breaks=myBreaks, border_color = "white", 
                       show_rownames = TRUE, show_colnames = TRUE, fontsize = 6,
                       cellwidth = 9, cellheight = 9,
                       cluster_cols = FALSE, cluster_rows = TRUE)
  
  save_pheatmap_pdf(heat.map, outname, 5, 10)
}

if (FALSE) {
  wk.dir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsWT-Tfh-Naive_updn/WT_Th1_vs_Naive"
  setwd(wk.dir)
  infile <- "vsNaive_pval-0.05_dn-sig_c10-WT_Th1_vs_Naive_diffHeatmap_byfamily.csv"
  outname <- fnameNoPathPdf(infile)
  intab <- read.csv(infile)
  intab <- setRnames(intab)
  myBreaks <- seq(-10, 10, by=0.25)
  myColor <- colorRampPalette(c("mediumpurple4","mediumpurple1", "white", "orange1", "orange4"))(length(myBreaks))
  heat.map <- pheatmap(mat = intab, color=myColor, breaks=myBreaks, border_color = "white", 
                       show_rownames = TRUE, show_colnames = TRUE, fontsize = 6,
                       cellwidth = 9, cellheight = 9,
                       cluster_cols = FALSE, cluster_rows = TRUE)
  
  save_pheatmap_pdf(heat.map, outname, 5, 10)
}

if (FALSE) {
  wk.dir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsWT-Tfh-Naive_updn/WT_Th1_vs_Naive"
  setwd(wk.dir)
  infile <- "vsNaive_pval-0.05_dn-sig_c25-WT_Th1_vs_Naive_diffHeatmap_byfamily.csv"
  outname <- fnameNoPathPdf(infile)
  intab <- read.csv(infile)
  intab <- setRnames(intab)
  myBreaks <- seq(-10, 10, by=0.25)
  myColor <- colorRampPalette(c("mediumpurple4","mediumpurple1", "white", "orange1", "orange4"))(length(myBreaks))
  heat.map <- pheatmap(mat = intab, color=myColor, breaks=myBreaks, border_color = "white", 
                       show_rownames = TRUE, show_colnames = TRUE, fontsize = 6,
                       cellwidth = 9, cellheight = 9,
                       cluster_cols = FALSE, cluster_rows = TRUE)
  
  save_pheatmap_pdf(heat.map, outname, 5, 10)
}

