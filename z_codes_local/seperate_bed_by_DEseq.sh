#!/bin/bash

out_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/6_GeneGroupMotifAnalysis/byGroup_DEseq_log2fc
source_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/6_GeneGroupMotifAnalysis/byGroup/bed
wk_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/log2fc_selected

source_list=(Group_I Group_II Group_III Group_IV TFH_Associated TH1_Associated)

cd $wk_dir
for i in *.bed
do
	for j in ${source_list[@]}
	do
		mergePeaks -d 200 -cobound 1 ${source_dir}/${j}--ATAC_peaks.bed $i
		mv coBoundBy1.txt $out_dir/${j}__${i/.bed/.txt}
	done
done
rm coBoundBy0.txt


cd $out_dir
for i in *.txt
do
  awk '{if (NR!=1) {print $2 "\t" $3 "\t" $4 "\t" $1 "\t" "." "\t" $5}}' $i > ${i/.txt/.bed}
done