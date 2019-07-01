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

plot_heatmap <- function(infile, col.pal, sizex, sizey){
  #infile <- "vsNaive-dn_all_sig_motifs.srt_rmdup.csv"
  #col.pal <- c("lightyellow", "orange", "red")
  outname <- fnameNoPathPdf(infile)
  intab <- read_csv(infile) 
  intab.sltcols <- c( c("motif_name"), colnames(intab)[6:length(colnames(intab))])
  intab <- intab %>% select(one_of(intab.sltcols)) %>% distinct() %>% column_to_rownames("motif_name")

  myBreaks <- seq(0, 80, by=1)
  myColor <- colorRampPalette(col.pal)(length(myBreaks))
  
  heat.map <- pheatmap(mat = intab, border_color = "gray90", 
                       color=myColor, breaks=myBreaks,
                       show_rownames = TRUE, show_colnames = TRUE, fontsize = 6,
                       cellwidth = 9, cellheight = 9, main = infile,
                       cluster_cols = FALSE, cluster_rows = FALSE)
  
  save_pheatmap_pdf(heat.map, outname, sizex, sizey)
}

#################### Main ####################
if (FALSE) {
  wk.dir <- "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/x_Figures_plottingCodes/0_motifHeatMap_genegroup/2_compiled_pctg_dupr"
  setwd(wk.dir)
  
  files <- list.files(path=wk.dir, pattern="*.csv", full.names=FALSE, recursive=FALSE)
  for (i in files){
    plot_heatmap(i, c("white",brewer.pal(5,"YlOrRd"), "black"), 5, 80)
  }
}

if (TRUE) {
  slt.genes <- read_table("/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/z_Figures/Heatmap Gene List for ATAC-Seq.txt")
  slt.genes <- slt.genes %>% mutate(GENE = toupper(GENE))
  
  wk.dir <- "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/x_Figures_plottingCodes/0_motifHeatMap_genegroup/2_compiled_pctg_dupr_slt"
  setwd(wk.dir)
  files <- list.files(path=wk.dir, pattern="*rmdup.csv", full.names=FALSE, recursive=FALSE)
  
  for (i in files){
    out.name <- gsub(".csv", "", i)
    out.name <- paste(out.name, "_flt.csv", sep="")
    i.tb <- read_csv(i)
    mtf_simp <- character(length(i.tb$motif_name))
    for (x in c(1:length(mtf_simp))){
      new.name <- unlist(strsplit(unlist(strsplit(i.tb$motif_name[x] , '\\('))[1], '\\+'))[1]
      new.name <- toupper(new.name)
      mtf_simp[x] <- new.name
    }
    i.tb$simp_mtf_name <- mtf_simp
    i.tb <- i.tb %>%  filter(simp_mtf_name %in% slt.genes$GENE)
    i.tb$simp_mtf_name <- NULL
    write_csv(i.tb, out.name)
    
    if (grepl("up.srt", i)) {
      plot_heatmap(out.name, c("white",brewer.pal(5,"YlOrRd"), "black"), 5,15)
    } else if (grepl("dn.srt", i)) {
      plot_heatmap(out.name, c("white",brewer.pal(5,"YlGnBu"), "black"), 5,15)
    }

  }
}




