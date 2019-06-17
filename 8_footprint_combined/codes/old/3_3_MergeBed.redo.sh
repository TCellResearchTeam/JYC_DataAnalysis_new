#!/bin/bash

wk_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/8_footprint_combined
cd $wk_dir

sp_names=(WT_Tfh_mpbs_TfhTh1up WT_Tfh_mpbs_TfhTh1dn)

for i in ${sp_names[@]}
do
  cat *${i}.bed >> ${i}_merged.bed
done