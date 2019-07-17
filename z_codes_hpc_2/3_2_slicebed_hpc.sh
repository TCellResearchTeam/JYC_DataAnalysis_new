#!/bin/bash
#PBS -t 0-13

bed_name=/gpfs/home/hdiao/jycATAC/GEO_ATAC/codes/jycATAC_merged_peaks.bed
py_script=/gpfs/home/hdiao/jycATAC/GEO_ATAC/codes/3_2_slicebed_hpc.py

wk_dir=/gpfs/home/hdiao/jycATAC/GEO_ATAC/codes/log2fc_1_selected
cd $wk_dir
sp_names=(all.df.numx.c5-Bcl6KO_Th1_vs_WT_Th1-log2fc-1_dn all.df.numx.c5-Bcl6KO_Th1_vs_WT_Th1-log2fc-1_up all.df.numx.c5-DKO_Tfh_vs_Prdm1KO_Tfh-log2fc-1_dn all.df.numx.c5-DKO_Tfh_vs_Prdm1KO_Tfh-log2fc-1_up all.df.numx.c5-DKO_Tfh_vs_WT_Tfh-log2fc-1_dn all.df.numx.c5-DKO_Tfh_vs_WT_Tfh-log2fc-1_up all.df.numx.c5-DKO_Th1_vs_Bcl6KO_Th1-log2fc-1_dn all.df.numx.c5-DKO_Th1_vs_Bcl6KO_Th1-log2fc-1_up all.df.numx.c5-DKO_Th1_vs_WT_Th1-log2fc-1_dn all.df.numx.c5-DKO_Th1_vs_WT_Th1-log2fc-1_up all.df.numx.c5-Prdm1KO_Tfh_vs_WT_Tfh-log2fc-1_dn all.df.numx.c5-Prdm1KO_Tfh_vs_WT_Tfh-log2fc-1_up all.df.numx.c5-WT_Tfh_vs_WT_Th1-log2fc-1_dn all.df.numx.c5-WT_Tfh_vs_WT_Th1-log2fc-1_up)

use_csv=${sp_names[$PBS_ARRAYID]}.csv
python $py_script $bed_name $use_csv


wk_dir=/gpfs/home/hdiao/jycATAC/GEO_ATAC/codes/pval-0.1_updn
cd $wk_dir
sp_names=(all.df.numx.c5-Bcl6KO_Th1_vs_WT_Th1-pval-0.1_dn all.df.numx.c5-Bcl6KO_Th1_vs_WT_Th1-pval-0.1_up all.df.numx.c5-DKO_Tfh_vs_Prdm1KO_Tfh-pval-0.1_dn all.df.numx.c5-DKO_Tfh_vs_Prdm1KO_Tfh-pval-0.1_up all.df.numx.c5-DKO_Tfh_vs_WT_Tfh-pval-0.1_dn all.df.numx.c5-DKO_Tfh_vs_WT_Tfh-pval-0.1_up all.df.numx.c5-DKO_Th1_vs_Bcl6KO_Th1-pval-0.1_dn all.df.numx.c5-DKO_Th1_vs_Bcl6KO_Th1-pval-0.1_up all.df.numx.c5-DKO_Th1_vs_WT_Th1-pval-0.1_dn all.df.numx.c5-DKO_Th1_vs_WT_Th1-pval-0.1_up all.df.numx.c5-Prdm1KO_Tfh_vs_WT_Tfh-pval-0.1_dn all.df.numx.c5-Prdm1KO_Tfh_vs_WT_Tfh-pval-0.1_up all.df.numx.c5-WT_Tfh_vs_WT_Th1-pval-0.1_dn all.df.numx.c5-WT_Tfh_vs_WT_Th1-pval-0.1_up)

use_csv=${sp_names[$PBS_ARRAYID]}.csv
python $py_script $bed_name $use_csv
