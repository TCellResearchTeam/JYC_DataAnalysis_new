######################################## Chi square test ########################################
# For testing differences of TF motif enrichment between groups
# Author: Huitian (Yolanda) Diao
# July 18th, 2019

######################################## Libraries ########################################
library(dplyr)
library(tidyverse)
library(MASS) 

######################################## Self-defined functions ########################################
chisq_run <- function(in_tb, slt_comp, total_num_vec, o_name){
  use_df <- in_tb %>% dplyr::select(one_of(c("motif_name", slt_comp)))
  colnames(use_df) <- c("motif_name", "c1", "c2")
  use_total_peak_n <- total_num_vec
  
  # Create writing table
  cond1_name <- paste(slt_comp[1], ": ", as.character(use_total_peak_n[1]), sep="")
  cond2_name <- paste(slt_comp[2], ": ", as.character(use_total_peak_n[2]), sep="")
  out_df <- data.frame(X="Total peak number", Condition1=cond1_name, Condition2=cond2_name)
  emp_row <- data.frame(X="", Condition1="", Condition2="")
  out_df <- rbind(out_df, emp_row)
  
  # p-value and chi-square vectors
  pval.vec <- c()
  chi.sq.vec <- c()
  
  for (i in c(1:nrow(in_tb))) {
    tf.tb <- slice(use_df, i)
    tf.name <- use_df$motif_name[i]
    cd.1 <- c(use_df$c1[i])
    cd.2 <- c(use_df$c2[i])
    cd.1 <- c(cd.1, use_total_peak_n[1] - cd.1[1])
    cd.2 <- c(cd.2, use_total_peak_n[2] - cd.1[1])
    chi.tb <- data.frame(Condition1=cd.1, Condition2=cd.2)
    rownames(chi.tb) <- c("Motif_found", "Motif_not_found")
    chi.out <- chisq.test(chi.tb)
    pval.vec <- c(pval.vec, chi.out$p.value)
    chi.sq.vec <- c(chi.sq.vec, as.numeric(chi.out$statistic))
    
    out_df <- rbind(out_df, emp_row)
    row_1 <- data.frame(X=tf.name, Condition1="", Condition2="")
    row_2 <- data.frame(X="", Condition1=slt_comp[1], Condition2=slt_comp[2])
    row_3 <- data.frame(X="Motif found", Condition1=as.character(cd.1[1]), Condition2=as.character(cd.2[1]))
    row_4 <- data.frame(X="Motif not found", Condition1=as.character(cd.1[2]), Condition2=as.character(cd.2[2]))
    row_5 <- data.frame(X="X-squared", Condition1=as.character(as.character(chi.out$statistic)), Condition2=as.character(""))
    row_6 <- data.frame(X="p-value", Condition1=as.character(as.character(chi.out$p.value)), Condition2=as.character(""))
    
    out_df <- rbind(out_df, row_1, row_2, row_3, row_4, row_5, row_6)
  }
  
  val.df <-data.frame(motif_name=use_df$motif_name, X_square=chi.sq.vec, p_value=pval.vec)
  
  out_name_1 <- paste(o_name, "_ChiSQtests_", slt_comp[1], "-vs-", slt_comp[2], ".csv", sep="")
  out_name_2 <- paste(o_name, "_ChiSQvals_", slt_comp[1], "-vs-", slt_comp[2], ".csv", sep="")
  write.csv(out_df, out_name_1, row.names = FALSE)
  write.csv(val.df, out_name_2, row.names = FALSE)
}


######################################## Main ########################################
wk.dir <- "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/x_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps/all_sig/20190801"
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
up_sum_col_names <- c("motif_name")
for (file.x in up.files){
  sp_tb <- read_csv(file.x)
  file.x.name <- tail(unlist(strsplit(file.x, "/")), n=1)
  newcol <- gsub("-pval-0.05_up_cb_mtfs.csv", "", file.x.name)
  up_sum_col_names <- c(up_sum_col_names, newcol)
  
 
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
    dplyr::select(one_of(keep_cols)) %>% mutate(motif_name = toupper(motif_name)) %>% 
    mutate(motif_name = gsub("-", "", motif_name)) %>%
    mutate(motif_name = gsub("−", "", motif_name)) %>%
    mutate(motif_name = gsub("\\(", "_", motif_name)) %>%
    mutate(motif_name = gsub("\\)", "", motif_name)) 
  up_tb <- up_tb %>% left_join(sp_tb, by="motif_name")
  colnames(up_tb) <- up_sum_col_names
}


dn_target_n <- c()
dn_sum_col_names <- c("motif_name")
for (file.x in dn.files){
  sp_tb <- read_csv(file.x)
  file.x.name <- tail(unlist(strsplit(file.x, "/")), n=1)
  newcol <- gsub("-pval-0.05_dn_cb_mtfs.csv", "", file.x.name)
  dn_sum_col_names <- c(dn_sum_col_names, newcol)
  
  
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
    dplyr::select(one_of(keep_cols)) %>% mutate(motif_name = toupper(motif_name)) %>% 
    mutate(motif_name = gsub("-", "", motif_name)) %>%
    mutate(motif_name = gsub("−", "", motif_name)) %>%
    mutate(motif_name = gsub("\\(", "_", motif_name)) %>%
    mutate(motif_name = gsub("\\)", "", motif_name)) 
  dn_tb <- dn_tb %>% left_join(sp_tb, by="motif_name")
  colnames(dn_tb) <- dn_sum_col_names
}




###----- Chi-square test for each TF -- up
comp_set <- c(up_sum_col_names[3], up_sum_col_names[2])
num_set <- c(up_target_n[2], up_target_n[1])
out_name_root <- "Fig6E"
chisq_run(up_tb, comp_set, num_set, out_name_root)

comp_set <- c(up_sum_col_names[4], up_sum_col_names[2])
num_set <- c(up_target_n[3], up_target_n[1])
out_name_root <- "Fig6E"
chisq_run(up_tb, comp_set, num_set, out_name_root)

comp_set <- c(up_sum_col_names[5], up_sum_col_names[2])
num_set <- c(up_target_n[4], up_target_n[1])
out_name_root <- "Fig6E"
chisq_run(up_tb, comp_set, num_set, out_name_root)

comp_set <- c(up_sum_col_names[6], up_sum_col_names[2])
num_set <- c(up_target_n[5], up_target_n[1])
out_name_root <- "Fig6E"
chisq_run(up_tb, comp_set, num_set, out_name_root)



###----- Chi-square test for each TF -- dn
comp_set <- c(dn_sum_col_names[3], dn_sum_col_names[2])
num_set <- c(dn_target_n[2], dn_target_n[1])
out_name_root <- "FigS6B"
chisq_run(dn_tb, comp_set, num_set, out_name_root)

comp_set <- c(dn_sum_col_names[4], dn_sum_col_names[2])
num_set <- c(dn_target_n[3], dn_target_n[1])
out_name_root <- "FigS6B"
chisq_run(dn_tb, comp_set, num_set, out_name_root)

comp_set <- c(dn_sum_col_names[5], dn_sum_col_names[2])
num_set <- c(dn_target_n[4], dn_target_n[1])
out_name_root <- "FigS6B"
chisq_run(dn_tb, comp_set, num_set, out_name_root)

comp_set <- c(dn_sum_col_names[6], dn_sum_col_names[2])
num_set <- c(dn_target_n[5], dn_target_n[1])
out_name_root <- "FigS6B"
chisq_run(dn_tb, comp_set, num_set, out_name_root)