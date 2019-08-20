#!/bin/bash

wk_dir=/Volumes/Yolanda/JYC_DataAnalysis/8_footprint_combined/2_mpbs_2/1_pval0.1_slt_txt
cd $wk_dir


for i in *.txt
do
  awk '{if (NR!=1) {split($1, a, "--"); print $2 "\t" $3 "\t" $4 "\t" a[2] "\t" "." "\t" $5}}' $i > ${i/.txt/.bed}
done