######################################## Gene transcript summit significance plot ########################################
# Author: Huitian (Yolanda) Diao
# Oct.3, 2019

######################################## Libraries ########################################

library(dplyr)
library(tidyverse)
library(reshape2)

######################################## Self defined functions ########################################
sig_peak_highlight_box <- function(in_file, ts_range, cd_order, gene_name){
  window_range <- c((ts_range[1] - (ts_range[2] - ts_range[1])*1.5),  (ts_range[2] + (ts_range[2] - ts_range[1])))
  
  in_tb <- read_csv(in_file)
  in_tb$chr <- NULL
  in_tb$se <- paste(in_tb$start, in_tb$end, sep="_")
  in_tb$start <- NULL
  in_tb$end <- NULL
  plot_tb <- melt(data=in_tb, id.vars="se")
  colnames(plot_tb) <- c("se", "condition", "val")
  plot_tb <- plot_tb %>%  mutate(val = replace_na(val, "none")) %>%
    filter(val != "none") %>%
    separate(se, c("start", "end"), sep="_")
  plot_tb$condition <- factor(plot_tb$condition, levels=cd_order)
  plot_tb$cd_num <- as.numeric(plot_tb$condition)
  plot_tb$start <- as.numeric(plot_tb$start)
  plot_tb$end <- as.numeric(plot_tb$end)
  
  anno_tb <- tibble(cd = factor(cd_order, levels=cd_order))
  anno_tb$pos <- (as.numeric(anno_tb$cd) - 1 )*2 + 0.5
  anno_x <- ts_range[1] - (ts_range[2] - ts_range[1])*1.2
  
  sig_peak_plot <- ggplot() +
    geom_rect(data=plot_tb, mapping=aes(xmin=start, xmax=end, ymin=((cd_num-1)*2), ymax=((cd_num-1)*2+1)),
              fill="red", alpha=0.5) +
    geom_vline(xintercept = ts_range[1], size=0.2, alpha=0.7) +
    geom_vline(xintercept = ts_range[2], size=0.2, alpha=0.7) +
    scale_x_continuous(limits=window_range) +
    scale_y_continuous(limits=c(0, (length(cd_order)*2))) +
    geom_text(data = anno_tb, aes(x=anno_x, y=anno_tb$pos, label=anno_tb$cd)) +
    xlab(gene_name) +
    theme(legend.position = "none",
          panel.grid = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank(),
          axis.title.y=element_blank(),
          axis.title.x = element_text(size = 16),
          panel.background = element_rect(fill = "transparent"), # bg of the panel
          plot.background = element_rect(fill = "transparent", color = NA), # bg of the plot
          panel.grid.major = element_blank(), # get rid of major grid
          panel.grid.minor = element_blank(), # get rid of minor grid
          legend.background = element_rect(fill = "transparent"), # get rid of legend bg
          legend.box.background = element_rect(fill = "transparent") )# get rid of legend p
  
  out_name <- paste(gene_name, "pdf", sep=".")
  ggsave(out_name, plot = sig_peak_plot, device = "pdf",  
         width = 20, height = 5, units = "cm",bg = "transparent")
}


######################################## Main ########################################
wk.dir <- "/Volumes/Yolanda/JYC_DataAnalysis/3_MACS2/xls_sep_p0.1_nonshift/txt/p0.01_bed/d150_merged"
setwd(wk.dir)

pos.file <- "/Volumes/Yolanda/JYC_DataAnalysis/z_codes_local/0_1_MACS_peak_find_genes_transcript_loci.csv"
pos.tb <- read_csv(pos.file)
#cd_order <- rev(c("WT_Tfh", "Prdm1KO_Tfh", "WT_Th1", "Bcl6KO_Th1", "DKO_Th1", "DKO_Tfh", "Naive"))
cd_order <- rev(c("WT_Tfh_rep1", "WT_Tfh_rep2", "WT_Tfh_rep3", "Prdm1KO_Tfh_rep1", "Prdm1KO_Tfh_rep2", "Prdm1KO_Tfh_rep3",
                  "WT_Th1_rep1", "WT_Th1_rep2", "WT_Th1_rep3", "Bcl6KO_Th1_rep1", "Bcl6KO_Th1_rep2", "Bcl6KO_Th1_rep3", 
                  "DKO_Th1_rep1", "DKO_Th1_rep2", "DKO_Th1_rep3", "DKO_Tfh_rep1", "DKO_Tfh_rep2", "DKO_Tfh_rep3", 
                  "Naive_rep1", "Naive_rep2", "Naive_rep3"))

for (i in c(1: nrow(pos.tb))) {
  gene.i <- pos.tb[i,]$gene_name[1]
  start.i <- pos.tb[i,]$start[1]
  end.i <- pos.tb[i,]$end[1]
  range.i <- c(start.i, end.i)
  file.i <- paste(wk.dir, "/merged_", gene.i, "_simp.csv", sep="")
  sig_peak_highlight_box(file.i, range.i, cd_order, gene.i)
}

