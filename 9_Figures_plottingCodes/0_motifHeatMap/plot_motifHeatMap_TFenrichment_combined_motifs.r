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

plot_heatmap <- function(infile, col.pal){
  #infile <- "vsNaive-dn_all_sig_motifs_c25_byfamily.csv"
  #col.pal <- c("lightyellow", "orange", "red")
  outname <- fnameNoPathPdf(infile)
  intab <- read.csv(infile)
  intab <- setRnames(intab)
  
  myBreaks <- seq(0, 80, by=1)
  myColor <- colorRampPalette(col.pal)(length(myBreaks))
  
  heat.map <- pheatmap(mat = intab, border_color = "gray90", 
                       color=myColor, breaks=myBreaks,
                       show_rownames = TRUE, show_colnames = TRUE, fontsize = 6,
                       cellwidth = 9, cellheight = 9, main = infile,
                       cluster_cols = FALSE, cluster_rows = FALSE)
  
  save_pheatmap_pdf(heat.map, outname, 6, 12)
}

#################### Main ####################
wk.dir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps"
setwd(wk.dir)

plot_heatmap("vsNaive-up_all_sig_motifs_c25_byfamily.csv", c("white",brewer.pal(5,"YlOrRd"), "black"))
plot_heatmap("vsNaive-dn_all_sig_motifs_c25_byfamily.csv", c("white",brewer.pal(5,"YlGnBu"), "black"))
plot_heatmap("vsWTTfh-up_all_sig_motifs_c25_byfamily.csv", c("white",brewer.pal(5,"YlOrRd"), "black"))
plot_heatmap("vsWTTfh-dn_all_sig_motifs_c25_byfamily.csv", c("white",brewer.pal(5,"YlGnBu"), "black"))





