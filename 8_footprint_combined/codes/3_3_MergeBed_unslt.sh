#!/bin/bash

wk_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/8_footprint_combined/2_mpbs/0_TFs
cd $wk_dir

sp_names=(Bcl6KO_Th1_mpbs.bed DKO_Tfh_mpbs.bed DKO_Th1_mpbs.bed Naive_mpbs.bed Prdm1KO_Tfh_mpbs.bed WT_Tfh_mpbs.bed WT_Th1_mpbs.bed)

for i in ${sp_names[@]}
do
	for j in $(find . -type f -name *${i})
	do
		cat $j >> merged_${i}
	done
done