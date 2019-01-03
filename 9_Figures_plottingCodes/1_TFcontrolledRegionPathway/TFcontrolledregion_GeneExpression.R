#################### TFcontrolledregionPathway ####################
# Author: Huitian (Yolanda) Diao
# Nov 13th, 2018

#################### Prerequisites ####################
# Dependencies:
# - 1. TF controlled gene annotation <- TFcontrolledregionPathway.R
# - 2. bed files <- 3_2_slicebed_multi.py
# - 3. seperate merged peaks by TF <- fc_TFpeak_sep.sh
# - 4. merged peaks TF annotation <- 4_0.0.7_homer.motif.finding_annoMergedPeaks.sh
# - 5. peak merging <- Homer
# ... etc.

#################### libraries ####################
library(tidyverse)
library(ggrepel)

#################### Self defined functions ####################
strInVec <- function(strx, vectorx){
  out.vec <- c()
  for (i in vectorx){
    if (grepl(strx, i)){
      out.vec <- c(out.vec, i)
    }
  }
  return(out.vec)
}

#################### Main ####################
###----- Prepare datasets with TPM and foldchange
# Groups:
# WT_TH1 Bcl6KO_TH1 DKO_TH1
# WT_TFH Prdm1KO_TFH DKO_TFH
# Naive
fcBHdata <- function(g1, g2, anno, outdir) {
  g1 <- "WT_TFH"
  g2 <- "WT_TH1"
  anno <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/1_TFcontrolledRegionPathway/WT_Tfh_vs_WT_Th1--dn/RUNX-AML_Runt--CD4+-PolII-ChIP-Seq_Barski_et_al..anno.csv"
  outdir <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/1_TFcontrolledRegionPathway/plots"
  
  #-- create output file name
  anno.vec <- unlist(strsplit(anno, "/"))
  anno.comparison <- anno.vec[length(anno.vec)-1]
  anno.tf <- unlist(strsplit(tail(anno.vec, n=1), "--"))[1]
  out.name <- paste(anno.tf, anno.comparison, sep=".")
  out.name <- paste(out.name, "RNA", sep="__")
  out.name <- paste(out.name, g1, g2, sep=".")
  out.name <- paste(out.name, ".csv", sep="")

  tpm.all <- "/Volumes/Huitian/jycATAC/RNAseq/All_TPM.csv"
  tpm.all.df <- read_csv("/Volumes/Huitian/jycATAC/RNAseq/All_TPM.csv")
  tpm.all.df.colnames <- colnames(tpm.all.df)
  anno.df <- read_csv(anno)
  symbols <- unique(unlist(anno.df$SYMBOL))
  tpm.sub.df <- subset(tpm.all.df, tpm.all.df$Feature_name %in% symbols)
  g1.df <- tpm.sub.df[strInVec(g1, tpm.all.df.colnames)]
  g2.df <- tpm.sub.df[strInVec(g2, tpm.all.df.colnames)]
  g1.df["avg"] <- rowMeans(g1.df)
  g2.df["avg"] <- rowMeans(g2.df)
  
  out.df <- data.frame(G1=g1.df$avg, G2=g2.df$avg) # Create output dataframe
  out.df["maxTPM"] <- apply(out.df, 1, function(x) max(x)) 
  out.df["geneName"] <- tpm.sub.df$Feature_name
  out.df <- subset(out.df, out.df$maxTPM >= 5) # Filter out not expressed things
  out.df["FC"] <- out.df$G1 / out.df$G2 
  out.df <- na.omit(out.df)
  out.df["log2FC"] <- log2(out.df["FC"]) # Calculate log2 Foldchange
  
  setwd(outdir)
  write.csv(out.df, file = out.name, row.names = FALSE)
}


###----- Plot
bbplot <- function(in.file, outdir){
  in.file <- "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/1_TFcontrolledRegionPathway/plots/RUNX-AML_Runt.WT_Tfh_vs_WT_Th1--dn__RNA.WT_TFH.WT_TH1.csv"
  
  reflists <- c("/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/1_TFcontrolledRegionPathway/TFH_associated.csv",
                "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/1_TFcontrolledRegionPathway/TH1_associated.csv")
  reflistnames <- c("Tfh associated", "Th1 associated")
  ref.list1 <- unlist(read_csv(reflists[1])$GeneName)
  ref.list2 <- unlist(read_csv(reflists[2])$GeneName)
  #--- Out png name
  out.name <- gsub(".csv", ".png", in.file)
  
  #--- X lab name
  in.file.vec <- unlist(strsplit(in.file, "/"))
  file.name.no.path <- tail(in.file.vec, n=1)
  file.name.no.path.vec <- unlist(strsplit(file.name.no.path, "__"))
  RNA.comparison <- tail( file.name.no.path.vec, n=1)
  RNA.comparison <- gsub("RNA.", "", RNA.comparison)
  RNA.comparison <- gsub(".csv", "", RNA.comparison)
  RNA.comparison <- gsub("\\.", " v.s. ", RNA.comparison)
  R1 <- unlist(strsplit(RNA.comparison, " v.s. "))[1]
  R2 <- unlist(strsplit(RNA.comparison, " v.s. "))[2]
  x.name <- paste(RNA.comparison, "log2FC", sep=" ")
  x.name <- paste(x.name, "  (postivie value: ", R1, " > ", R2, ")", sep="")
  x.name
  #--- Figure title
  fig.title <- "Genes nearby \n"
  atac.name <- file.name.no.path.vec[length(file.name.no.path.vec) - 1]
  TF.full <- unlist(strsplit(atac.name, "\\."))[1]
  fig.title <- paste(fig.title, TF.full, " motifs \n in regions ", sep="")
  updn <- tail(unlist(strsplit(atac.name, "--")), n=1)
  updn <- gsub("dn", "less accessible in", updn)
  updn <- gsub("up", "more accessible in", updn)
  fig.title <- paste(fig.title, updn, sep="")
  atat.comparison <- tail(unlist(strsplit(atac.name, "\\.")), n=1)
  atat.comparison <- unlist(strsplit(atat.comparison, "--"))[1]
  g1 <- unlist(strsplit(atat.comparison, "_vs_"))[1]
  g2 <- unlist(strsplit(atat.comparison, "_vs_"))[2]
  fig.title <- paste(fig.title, "\n", g1, " than ", g2, sep="")
  
  
  in.df <- read_csv(in.file)
  in.df <- in.df[order(-in.df$log2FC), ]
  in.df["G1sqrt"] <- sqrt(in.df$G1)
  in.df["Ranks"] <- factor(c(1:nrow(in.df)))
  in.df$geneName <- factor(in.df$geneName, levels = in.df$geneName)
  
  dot.col <- c()
  dot.size <- c()
  dot.name <- c()
  for (x in c(1:length(in.df$geneName))){
    genex <- as.character(unlist(in.df$geneName))[x]
    tpmsqrtx <- unlist(in.df$G1sqrt)[x]
    if (genex %in% ref.list1){
      dot.col <- c(dot.col, "red")
      dot.size <- c(dot.size, tpmsqrtx)
      dot.name <- c(dot.name, genex)
    }
    else if (genex %in% ref.list2){
      dot.col <- c(dot.col, "blue")
      dot.size <- c(dot.size, tpmsqrtx)
      dot.name <- c(dot.name, genex)
    }
    else {
      dot.col <- c(dot.col, "grey")
      dot.size <- c(dot.size, 0)
      dot.name <- c(dot.name, "")
    }
  }
  
  in.df["dotcol"] <- dot.col
  in.df["dotsize"] <- dot.size
  in.df["dotname"] <- dot.name
  
  bbplot <- ggplot(in.df, aes(x=in.df$log2FC, y=in.df$Ranks)) +
    geom_point(color = "grey", shape=20, size = 1)
    bbplot
  bbplot <- ggplot(in.df, aes(x=in.df$log2FC, y=in.df$Ranks, size=dot.size)) +
    geom_point(alpha=0.7, color = dot.col, shape=20) +
    geom_vline(xintercept=0, colour="black") +
    geom_vline(xintercept=2, colour="grey", size=0.1) +
    geom_vline(xintercept=-2, colour="grey", size=0.1) +
    xlab(x.name) + labs(title = fig.title, subtitle = "Highlighted Tfh(red) / Th1(blue) associated genes", size=paste(g1, " TPM", sep="")) + 
    scale_x_continuous(limits = c(-8, 8)) +
    theme(axis.text.y=element_blank(), axis.ticks.y=element_blank(), axis.title.y=element_blank(), 
          panel.background = element_rect(fill = "white", linetype = "solid"),
          panel.grid.major = element_line(size = 0.1, linetype = 'solid', colour = "grey"),
          plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5))
  bbplot <- bbplot + 
    geom_text_repel(aes(label=in.df$dotname), alpha=0.8 )
  
  #--- Save
  ggsave(out.name, bbplot, device="png", width = 7, height = 7, dpi=320)
}






