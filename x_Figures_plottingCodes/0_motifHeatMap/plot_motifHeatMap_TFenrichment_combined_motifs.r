#################### motifHeatMap ####################
# Author: Huitian (Yolanda) Diao
# Nov 9th , 2018
# Dependencies:
# 1. Data prep <- prep_motifHeatMap.py <- fc_motifHeatMap.py
# 2. Motif finding <- Homer
# etc...

#################### Imports ####################
library(pheatmap)
library(RColorBrewer)
library(viridis)
library(tidyverse)
library(dplyr)

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

plot_heatmap <- function(infile, col.pal, wid, hei, max){
  #infile <- "vsNaive-dn_all_sig_motifs.srt_rmdup.csv"
  #col.pal <- c("lightyellow", "orange", "red")
  outname <- fnameNoPathPdf(infile)
  intab <- read_csv(infile) 
  intab.sltcols <- c( c("motif_name"), colnames(intab)[6:length(colnames(intab))])
  intab <- intab %>% select(one_of(intab.sltcols)) %>% distinct() %>% column_to_rownames("motif_name")

  myBreaks <- seq(0, max, by=1)
  myColor <- colorRampPalette(col.pal)(length(myBreaks))
  
  heat.map <- pheatmap(mat = intab, border_color = "gray90", 
                       color=myColor, breaks=myBreaks,
                       show_rownames = TRUE, show_colnames = TRUE, fontsize = 6,
                       cellwidth = 9, cellheight = 9, main = infile,
                       cluster_cols = FALSE, cluster_rows = FALSE)
  
  save_pheatmap_pdf(heat.map, outname, wid, hei)
}

#################### Main ####################
if(FALSE) {
  wk.dir <- "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/x_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps"
  setwd(wk.dir)
  
  plot_heatmap("vsNaive-up_all_sig_motifs.srt_rmdup.csv", c("white",brewer.pal(5,"YlOrRd"), "black"), 5, 80, 80)
  plot_heatmap("vsNaive-dn_all_sig_motifs.srt_rmdup.csv", c("white",brewer.pal(5,"YlGnBu"), "black"), 5, 80, 80)
  plot_heatmap("vsWTTfh-up_all_sig_motifs.srt_rmdup.csv", c("white",brewer.pal(5,"YlOrRd"), "black"), 5, 80, 80)
  plot_heatmap("vsWTTfh-dn_all_sig_motifs.srt_rmdup.csv", c("white",brewer.pal(5,"YlGnBu"), "black"), 5, 80, 80)
  
  wk.dir <- "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/x_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps/add_bcl6"
  setwd(wk.dir)
  plot_heatmap("vsNaive-up_all_sig_motifs.srt_rmdup.csv", c("white",brewer.pal(5,"YlOrRd"), "black"), 5, 80, 80)
  plot_heatmap("vsNaive-dn_all_sig_motifs.srt_rmdup.csv", c("white",brewer.pal(5,"YlGnBu"), "black"), 5, 80, 80)
  plot_heatmap("vsWTTfh-up_all_sig_motifs.srt_rmdup.csv", c("white",brewer.pal(5,"YlOrRd"), "black"), 5, 80, 80)
  plot_heatmap("vsWTTfh-dn_all_sig_motifs.srt_rmdup.csv", c("white",brewer.pal(5,"YlGnBu"), "black"), 5, 80, 80)
}


if(FALSE) {
  wk.dir <- "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/x_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps/all_sig/20190701"
  setwd(wk.dir)
  
  # Read selection motif list files
  open.slt.file <- "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/z_Figures/ATAC-Seq_Analyses_JYC_20190701_open.txt"
  close.slt.file <- "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/z_Figures/ATAC-Seq_Analyses_JYC_20190701_close.txt"
  open.slt.tb <- read_csv(open.slt.file)
  close.slt.tb <- read_csv(close.slt.file)
  open.slt.tb$simp_names <- toupper(open.slt.tb$simp_names)
  close.slt.tb$simp_names <- toupper(close.slt.tb$simp_names)
  
  # Read motif enrichment files
  open.file <- "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/x_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps/all_sig/vsWTTfh-up_all_sig_motifs.srt_rmdup.csv"
  close.file <- "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/x_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps/all_sig/vsWTTfh-dn_all_sig_motifs.srt_rmdup.csv"
  open.tb <- read_csv(open.file)
  close.tb <- read_csv(close.file)
  
  # Convert names to simple format (without family names)
  simp_name <- function(in_vec){
    out_vec <- character(length(in_vec))
    for (i in c(1: length(in_vec))){
      simp_i <- unlist(strsplit(in_vec[i], "\\("))[1]
      simp_i <- unlist(strsplit(simp_i, "\\+"))[1]
      out_vec[i] <- toupper(simp_i)
    }
    return(out_vec)
  }
  open.tb$simp_names <- simp_name(open.tb$motif_name)
  close.tb$simp_names <- simp_name(close.tb$motif_name)
  
  # Select motifs & plot
  open.slt.tb <- open.slt.tb %>% left_join(open.tb, by="simp_names")
  close.slt.tb <- close.slt.tb %>% left_join(close.tb, by="simp_names")
  write_csv(open.slt.tb, "vsWTTfh-up_all_sig_motifs.srt_rmdup_selected.csv")
  write_csv(close.slt.tb, "vsWTTfh-dn_all_sig_motifs.srt_rmdup_selected.csv")
  
  
  plot_heatmap("vsWTTfh-up_all_sig_motifs.srt_rmdup_selected_use.csv", c("white",brewer.pal(5,"YlOrRd"), "black"), 3, 8, 60)
  plot_heatmap("vsWTTfh-dn_all_sig_motifs.srt_rmdup_selected_use.csv", c("white",brewer.pal(5,"YlGnBu"), "black"), 3, 8, 60)
  
}


