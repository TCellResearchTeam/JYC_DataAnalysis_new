#!/bin/bash

wk_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/8_footprint_combined/2_mpbs/slt_bed
cd $wk_dir

sp_names=( Bcl6KO_Th1_mpbs_BKOdn  Bcl6KO_Th1_mpbs_BKOup  DKO_Tfh_mpbs_DKOTfhdn  DKO_Tfh_mpbs_DKOTfhup  DKO_Th1_mpbs_DKOTh1dn  DKO_Th1_mpbs_DKOTh1up  Naive_mpbs_BKOdn  Naive_mpbs_BKOup  Naive_mpbs_DKOTfhdn  Naive_mpbs_DKOTfhup  Naive_mpbs_DKOTh1dn  Naive_mpbs_DKOTh1up  Naive_mpbs_PKOdn  Naive_mpbs_PKOup  Naive_mpbs_TfhTh1dn  Naive_mpbs_TfhTh1up  Prdm1KO_Tfh_mpbs_PKOdn  Prdm1KO_Tfh_mpbs_PKOup  WT_Tfh_mpbs_DKOTfhdn  WT_Tfh_mpbs_DKOTfhup  WT_Tfh_mpbs_PKOdn  WT_Tfh_mpbs_PKOup  WT_Tfh_mpbs_TfhTh1dn  WT_Tfh_mpbs_TfhTh1up  WT_Th1_mpbs_BKOdn  WT_Th1_mpbs_BKOup  WT_Th1_mpbs_DKOTh1dn  WT_Th1_mpbs_DKOTh1up)

for i in ${sp_names[@]}
do
  cat *${i}.bed >> ${i}_merged.bed
done