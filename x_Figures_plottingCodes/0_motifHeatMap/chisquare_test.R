######################################## Chi square test ########################################
# For testing differences of TF motif enrichment between groups
# Author: Huitian (Yolanda) Diao
# July 18th, 2019

######################################## Libraries ########################################
library(dplyr)
library(tidyverse)
library(MASS) 

######################################## Main ########################################
wk.dir <- "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/x_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps/all_sig/20190718"
setwd(wk.dir)
###----- Create info table:
#    DKO-Tfh vs Prdm1KO-Tfh       DKO-Tfh vs WT-Tfh      DKO-Th1 vs Bcl6KO-Th1      DKO-Th1 vs WT-Th1      WT-Tfh vs WT-Th1
#        (TotalPeak)                 (TotalPeak)
# TF1         xxx                        xxx
# TF2         xxx                        xxx


#--- Find motif finding result files
root.names <- c("DKO_Tfh_vs_Prdm1KO_Tfh",
                "DKO_Tfh_vs_WT_Tfh",
                "DKO_Th1_vs_Bcl6KO_Th1",
                "DKO_Th1_vs_WT_Th1",
                "WT_Tfh_vs_WT_Th1")

in.dir <- "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/5_Motif_finding/1_pval-0.05_updn_cb_mtfs/csv"
file.names <- list.files(path=in.dir, pattern=".*csv", full.name=TRUE, recursive=FALSE)
up.files <- c()
dn.files <- c()

for (file.x in file.names){
  use <- FALSE
  for (root.i in root.names){
    if (grepl(root.i, file.x) && !(grepl("STAT4", file.x))) {
      use <- TRUE
    }
  }
  if (use) {
    if (grepl("_up_", file.x)) {
      up.files <- c(up.files, file.x)
    }
    else {
      dn.files <- c(dn.files, file.x)
    }
  }
}

#--- Read list of TFs that are to be analyzed
up_use <- "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/x_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps/all_sig/20190718/up_use.txt"
dn_use <- "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/x_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps/all_sig/20190718/down_use.txt"

up_tb <- read_tsv(up_use) %>% mutate(motif_name = toupper(motif_name)) %>% 
  mutate(motif_name = gsub("-", "", motif_name)) %>%
  mutate(motif_name = gsub("−", "", motif_name)) %>%
  mutate(motif_name = gsub("\\(", "_", motif_name)) %>%
  mutate(motif_name = gsub("\\)", "", motif_name)) 
dn_tb <- read_tsv(dn_use) %>% mutate(motif_name = toupper(motif_name)) %>% 
  mutate(motif_name = gsub("-", "", motif_name))  %>%
  mutate(motif_name = gsub("−", "", motif_name)) %>%
  mutate(motif_name = gsub("\\(", "_", motif_name)) %>%
  mutate(motif_name = gsub("\\)", "", motif_name)) 

#--- Collect all data

up_target_n <- c()
sum_col_names <- c("motif_name")
for (file.x in up.files){
  sp_tb <- read_csv(file.x)
  file.x.name <- tail(unlist(strsplit(file.x, "/")), n=1)
  newcol <- gsub("-pval-0.05_up_cb_mtfs.csv", "", file.x.name)
  sum_col_names <- c(sum_col_names, newcol)
  
 
  # All peak number
  target_n <- colnames(sp_tb)[6]
  target_n <- gsub("# of Target Sequences with Motif\\(of ", "", target_n)
  target_n <- as.numeric(gsub("\\)", "", target_n))
  up_target_n <- c(up_target_n, target_n)
  
  # Add to sum table
  new.colnames <- c("mtf_fullname", "consensus", "pval", "logpval", "qval", "targetwithMTF", "percentMTF", "bkgwithMTF", "percentMTFbkg")
  colnames(sp_tb) <- new.colnames
  keep_cols <- c("motif_name", "targetwithMTF")
  sp_tb <- sp_tb %>% separate(mtf_fullname, c("motif_name", "family"), sep="/") %>% 
    select(one_of(keep_cols)) %>% mutate(motif_name = toupper(motif_name)) %>% 
    mutate(motif_name = gsub("-", "", motif_name)) %>%
    mutate(motif_name = gsub("−", "", motif_name)) %>%
    mutate(motif_name = gsub("\\(", "_", motif_name)) %>%
    mutate(motif_name = gsub("\\)", "", motif_name)) 
  up_tb <- up_tb %>% left_join(sp_tb, by="motif_name")
  colnames(up_tb) <- sum_col_names
}


dn_target_n <- c()
sum_col_names <- c("motif_name")
for (file.x in dn.files){
  sp_tb <- read_csv(file.x)
  file.x.name <- tail(unlist(strsplit(file.x, "/")), n=1)
  newcol <- gsub("-pval-0.05_dn_cb_mtfs.csv", "", file.x.name)
  sum_col_names <- c(sum_col_names, newcol)
  
  
  # All peak number
  target_n <- colnames(sp_tb)[6]
  target_n <- gsub("# of Target Sequences with Motif\\(of ", "", target_n)
  target_n <- as.numeric(gsub("\\)", "", target_n))
  dn_target_n <- c(dn_target_n, target_n)
  
  # Add to sum table
  new.colnames <- c("mtf_fullname", "consensus", "pval", "logpval", "qval", "targetwithMTF", "percentMTF", "bkgwithMTF", "percentMTFbkg")
  colnames(sp_tb) <- new.colnames
  keep_cols <- c("motif_name", "targetwithMTF")
  sp_tb <- sp_tb %>% separate(mtf_fullname, c("motif_name", "family"), sep="/") %>% 
    select(one_of(keep_cols)) %>% mutate(motif_name = toupper(motif_name)) %>% 
    mutate(motif_name = gsub("-", "", motif_name)) %>%
    mutate(motif_name = gsub("−", "", motif_name)) %>%
    mutate(motif_name = gsub("\\(", "_", motif_name)) %>%
    mutate(motif_name = gsub("\\)", "", motif_name)) 
  dn_tb <- dn_tb %>% left_join(sp_tb, by="motif_name")
  colnames(dn_tb) <- sum_col_names
}




###----- Chi-square test for each TF -- up
# DKO-Tfh vs WT-Tfh
# DKO-Tfh vs Prdm1KO-Tfh
use_df <- up_tb %>% dplyr::select(one_of(c("motif_name", "DKO_Tfh_vs_WT_Tfh", "DKO_Tfh_vs_Prdm1KO_Tfh")))
use_total_peak_n <- c(up_target_n[2], up_target_n[1])

# Create writing table
out_df <- data.frame(X="Total peak number", 
                     DKO_Tfh_vs_WT_Tfh=as.character(use_total_peak_n[1]), 
                     KO_Tfh_vs_Prdm1KO_Tfh=as.character(use_total_peak_n[2]))
emp_row <- data.frame(X="", DKO_Tfh_vs_WT_Tfh="", KO_Tfh_vs_Prdm1KO_Tfh="")
out_df <- rbind(out_df, emp_row)

# p-value and chi-square vectors
pval.vec <- c()
chi.sq.vec <- c()

for (i in c(1:nrow(up_tb))) {
  tf.tb <- slice(use_df, i)
  tf.name <- use_df$motif_name[i]
  cd.1 <- c(use_df$DKO_Tfh_vs_WT_Tfh[i])
  cd.2 <- c(use_df$DKO_Tfh_vs_Prdm1KO_Tfh[i])
  cd.1 <- c(cd.1, use_total_peak_n[1] - cd.1[1])
  cd.2 <- c(cd.2, use_total_peak_n[2] - cd.1[1])
  chi.tb <- data.frame(DKO_Tfh_vs_WT_Tfh=cd.1, DKO_Tfh_vs_Prdm1KO_Tfh=cd.2)
  rownames(chi.tb) <- c("Motif_found", "Motif_not_found")
  chi.out <- chisq.test(chi.tb)
  pval.vec <- c(pval.vec, chi.out$p.value)
  chi.sq.vec <- c(chi.sq.vec, as.numeric(chi.out$statistic))
  
  out_df <- rbind(out_df, emp_row)
  row_1 <- data.frame(X=tf.name, DKO_Tfh_vs_WT_Tfh="", KO_Tfh_vs_Prdm1KO_Tfh="")
  row_2 <- data.frame(X="", DKO_Tfh_vs_WT_Tfh="DKO_Tfh_vs_WT_Tfh", KO_Tfh_vs_Prdm1KO_Tfh="DKO_Tfh_vs_Prdm1KO_Tfh")
  row_3 <- data.frame(X="Motif found", DKO_Tfh_vs_WT_Tfh=as.character(cd.1[1]), KO_Tfh_vs_Prdm1KO_Tfh=as.character(cd.2[1]))
  row_4 <- data.frame(X="Motif not found", DKO_Tfh_vs_WT_Tfh=as.character(cd.1[2]), KO_Tfh_vs_Prdm1KO_Tfh=as.character(cd.2[2]))
  row_5 <- data.frame(X="X-squared", DKO_Tfh_vs_WT_Tfh=as.character(as.character(chi.out$statistic)), KO_Tfh_vs_Prdm1KO_Tfh=as.character(""))
  row_6 <- data.frame(X="p-value", DKO_Tfh_vs_WT_Tfh=as.character(as.character(chi.out$p.value)), KO_Tfh_vs_Prdm1KO_Tfh=as.character(""))
  
  out_df <- rbind(out_df, row_1, row_2, row_3, row_4, row_5, row_6)
}

val.df <-data.frame(motif_name=use_df$motif_name, X_square=chi.sq.vec, p_value=pval.vec)

write.csv(out_df, "Fig6E_chi-square_tests.csv", row.names = FALSE)
write.csv(val.df, "Fig6E_chi-square_values.csv", row.names = FALSE)


###----- Chi-square test for each TF -- dn
# DKO-Tfh vs WT-Tfh
# DKO-Tfh vs Prdm1KO-Tfh
use_df <- dn_tb %>% dplyr::select(one_of(c("motif_name", "DKO_Tfh_vs_WT_Tfh", "DKO_Tfh_vs_Prdm1KO_Tfh")))
use_total_peak_n <- c(dn_target_n[2], dn_target_n[1])

# Create writing table
out_df <- data.frame(X="Total peak number", 
                     DKO_Tfh_vs_WT_Tfh=as.character(use_total_peak_n[1]), 
                     KO_Tfh_vs_Prdm1KO_Tfh=as.character(use_total_peak_n[2]))
emp_row <- data.frame(X="", DKO_Tfh_vs_WT_Tfh="", KO_Tfh_vs_Prdm1KO_Tfh="")
out_df <- rbind(out_df, emp_row)

# p-value and chi-square vectors
pval.vec <- c()
chi.sq.vec <- c()

for (i in c(1:nrow(dn_tb))) {
  tf.tb <- slice(use_df, i)
  tf.name <- use_df$motif_name[i]
  cd.1 <- c(use_df$DKO_Tfh_vs_WT_Tfh[i])
  cd.2 <- c(use_df$DKO_Tfh_vs_Prdm1KO_Tfh[i])
  cd.1 <- c(cd.1, use_total_peak_n[1] - cd.1[1])
  cd.2 <- c(cd.2, use_total_peak_n[2] - cd.1[1])
  chi.tb <- data.frame(DKO_Tfh_vs_WT_Tfh=cd.1, DKO_Tfh_vs_Prdm1KO_Tfh=cd.2)
  rownames(chi.tb) <- c("Motif_found", "Motif_not_found")
  chi.out <- chisq.test(chi.tb)
  pval.vec <- c(pval.vec, chi.out$p.value)
  chi.sq.vec <- c(chi.sq.vec, as.numeric(chi.out$statistic))
  
  out_df <- rbind(out_df, emp_row)
  row_1 <- data.frame(X=tf.name, DKO_Tfh_vs_WT_Tfh="", KO_Tfh_vs_Prdm1KO_Tfh="")
  row_2 <- data.frame(X="", DKO_Tfh_vs_WT_Tfh="DKO_Tfh_vs_WT_Tfh", KO_Tfh_vs_Prdm1KO_Tfh="DKO_Tfh_vs_Prdm1KO_Tfh")
  row_3 <- data.frame(X="Motif found", DKO_Tfh_vs_WT_Tfh=as.character(cd.1[1]), KO_Tfh_vs_Prdm1KO_Tfh=as.character(cd.2[1]))
  row_4 <- data.frame(X="Motif not found", DKO_Tfh_vs_WT_Tfh=as.character(cd.1[2]), KO_Tfh_vs_Prdm1KO_Tfh=as.character(cd.2[2]))
  row_5 <- data.frame(X="X-squared", DKO_Tfh_vs_WT_Tfh=as.character(as.character(chi.out$statistic)), KO_Tfh_vs_Prdm1KO_Tfh=as.character(""))
  row_6 <- data.frame(X="p-value", DKO_Tfh_vs_WT_Tfh=as.character(as.character(chi.out$p.value)), KO_Tfh_vs_Prdm1KO_Tfh=as.character(""))
  
  out_df <- rbind(out_df, row_1, row_2, row_3, row_4, row_5, row_6)
}

val.df <-data.frame(motif_name=use_df$motif_name, X_square=chi.sq.vec, p_value=pval.vec)

write.csv(out_df, "FigS6B_chi-square_tests.csv", row.names = FALSE)
write.csv(val.df, "FigS6B_chi-square_values.csv", row.names = FALSE)


