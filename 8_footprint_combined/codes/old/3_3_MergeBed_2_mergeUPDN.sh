#!/bin/bash

wk_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/8_footprint_combined/2_mpbs/pval_slt_merged_bed
cd $wk_dir

sp_names=(Bcl6KO_Th1_mpbs_BKO DKO_Tfh_mpbs_DKOTfh DKO_Th1_mpbs_DKOTh1 Naive_mpbs_BKO Naive_mpbs_DKOTfh Naive_mpbs_DKOTh1 Naive_mpbs_PKO Naive_mpbs_TfhTh1 Prdm1KO_Tfh_mpbs_PKO WT_Tfh_mpbs_DKOTfh WT_Tfh_mpbs_PKO WT_Tfh_mpbs_TfhTh1 WT_Th1_mpbs_BKO WT_Th1_mpbs_DKOTh1)

for i in ${sp_names[@]}
do
  cat ${i}* >> ${i}.bed
done