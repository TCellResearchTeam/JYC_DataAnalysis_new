#!/bin/bash

wk_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/8_footprint_combined/2_mpbs/1_log2fc-1_slt_bed
cd $wk_dir

sp_names=(DKO_Tfh_mpbs_DKO-PKOdn DKO_Tfh_mpbs_DKO-PKOup DKO_Th1_mpbs_DKO-BKOdn DKO_Th1_mpbs_DKO-BKOup WT_Tfh_mpbs_DKOTfhdn WT_Tfh_mpbs_DKOTfhup WT_Tfh_mpbs_PKOdn WT_Tfh_mpbs_PKOup WT_Tfh_mpbs_TfhTh1dn WT_Tfh_mpbs_TfhTh1up WT_Th1_mpbs_BKOdn WT_Th1_mpbs_BKOup WT_Th1_mpbs_DKOTh1dn WT_Th1_mpbs_DKOTh1up)
for i in ${sp_names[@]}
do
  cat *${i}.bed >> ${i}_merged.bed
done

sp_names=(DKO_Tfh_mpbs_DKO-PKO DKO_Th1_mpbs_DKO-BKO WT_Tfh_mpbs_DKOTfh WT_Tfh_mpbs_PKO WT_Tfh_mpbs_TfhTh1 WT_Th1_mpbs_BKO WT_Th1_mpbs_DKOTh1)
for i in ${sp_names[@]}
do
  cat ${i}*_merged.bed >> ${i}_mergedupdn.bed
done