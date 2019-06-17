#!/bin/bash

wk_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/8_footprint_combined/2_mpbs/1_pval_slt_bed_redo
cd $wk_dir

sp_names=(DKO_Tfh_mpbs_DKO-PKO_dn DKO_Tfh_mpbs_DKO-PKO_up DKO_Th1_mpbs_DKO-BKO_dn DKO_Th1_mpbs_DKO-BKO_up)

for i in ${sp_names[@]}
do
  cat *${i}.bed >> ${i}_merged.bed
done

sp_names=(DKO_Tfh_mpbs_DKO-PKO DKO_Th1_mpbs_DKO-BKO)
for i in ${sp_names[@]}
do
  cat ${i}*_merged.bed >> ${i}_merged_updn.bed
done