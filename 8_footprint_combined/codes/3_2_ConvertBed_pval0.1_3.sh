#!/bin/bash

wk_dir=/media/pipkin/Yolanda/JYC_DataAnalysis_new/8_footprint_combined/2_mpbs_3
cd $wk_dir

mkdir 1_pval0.1_slt_txt

mv 0_TFs/*.txt 1_pval0.1_slt_txt

cd 1_pval0.1_slt_txt

for i in *.txt
do
  awk '{if (NR!=1) {split($1, a, "--"); print $2 "\t" $3 "\t" $4 "\t" a[2] "\t" "." "\t" $5}}' $i > ${i/.txt/.bed}
done

cd $wk_dir

mkdir 1_pval0.1_slt_bed

mv 1_pval0.1_slt_txt/*.bed 1_pval0.1_slt_bed