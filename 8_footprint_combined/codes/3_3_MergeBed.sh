#!/bin/bash

wk_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/8_footprint_combined/2_mpbs/1_pval_slt_bed
cd $wk_dir

sp_names=(Bcl6KO_Th1_mpbs_BKOdn Bcl6KO_Th1_mpbs_BKOup DKO_Tfh_mpbs_DKOTfhdn DKO_Tfh_mpbs_DKOTfhup DKO_Tfh_mpbs_PKOdn DKO_Tfh_mpbs_PKOup DKO_Th1_mpbs_BKOdn DKO_Th1_mpbs_BKOup DKO_Th1_mpbs_DKOTh1dn DKO_Th1_mpbs_DKOTh1up Naive_mpbs_BKOdn Naive_mpbs_BKOup Naive_mpbs_DKOTfhdn Naive_mpbs_DKOTfhup Naive_mpbs_DKOTh1dn Naive_mpbs_DKOTh1up Naive_mpbs_PKOdn Naive_mpbs_PKOup Naive_mpbs_TfhTh1dn Naive_mpbs_TfhTh1up Prdm1KO_Tfh_mpbs_DKOTfhdn Prdm1KO_Tfh_mpbs_DKOTfhup Prdm1KO_Tfh_mpbs_PKOdn Prdm1KO_Tfh_mpbs_PKOup WT_Tfh_mpbs_DKOTfhdn WT_Tfh_mpbs_DKOTfhup WT_Tfh_mpbs_PKOdn WT_Tfh_mpbs_PKOup WT_Tfh_mpbs_TfhTh1dn WT_Tfh_mpbs_TfhTh1up WT_Th1_mpbs_BKOdn WT_Th1_mpbs_BKOup WT_Th1_mpbs_DKOTh1dn WT_Th1_mpbs_DKOTh1up)

for i in ${sp_names[@]}
do
  cat *${i}.bed >> ${i}_merged.bed
done

sp_names=(Bcl6KO_Th1_mpbs_BKO DKO_Tfh_mpbs_DKOTfh DKO_Tfh_mpbs_PKO DKO_Th1_mpbs_BKO DKO_Th1_mpbs_DKOTh1 Naive_mpbs_BKO Naive_mpbs_DKOTfh Naive_mpbs_DKOTh1 Naive_mpbs_PKO Naive_mpbs_TfhTh1 Prdm1KO_Tfh_mpbs_DKOTfh Prdm1KO_Tfh_mpbs_PKO WT_Tfh_mpbs_DKOTfh WT_Tfh_mpbs_PKO WT_Tfh_mpbs_TfhTh1 WT_Th1_mpbs_BKO WT_Th1_mpbs_DKOTh1)
for i in ${sp_names[@]}
do
  cat ${i}*_merged.bed >> ${i}_merged_updn.bed
done