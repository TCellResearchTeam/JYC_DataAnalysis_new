#!/bin/bash

### Split bed files by chromosomes
wk_dir=/Volumes/Yolanda/JYC_DataAnalysis/z_codes_local
new_dir=/Volumes/Yolanda/JYC_DataAnalysis/z_codes_local/jycATAC_merged_peaks_chrs

cd $wk_dir

input_bed=jycATAC_merged_peaks.bed
for i in $(seq 1 20)
do
	awk -v var=chr$i '{if ($1==var) {print $0}}' $input_bed > ${input_bed/.bed/}_chr${i}.bed
done

mv *_chr*.bed $new_dir
