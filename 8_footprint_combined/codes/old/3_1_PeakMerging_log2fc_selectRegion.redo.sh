#!/bin/bash

wk_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/8_footprint_combined/2_mpbs


##### Ordered bed files
cd $wk_dir
#for i in $(find . -name *.bed -type f)
#do
#  awk '{print $1 "\t" $2 "\t" $3 "\t" "NR"NR"--"$4 "\t" $5 "\t" $6}' $i > ${i/.bed/.ordered.bed}
#done


##### Reference peak files (DEseq2)
WTTfh_WTTh1_up=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/log2fc_selected/all.df.numx.c5-WT_Tfh_vs_WT_Th1.up.bed
WTTfh_WTTh1_dn=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/log2fc_selected/all.df.numx.c5-WT_Tfh_vs_WT_Th1.dn.bed

##### Merge peaks
for i in $(find . -type f -name "*ordered.bed")
do
  arrin=(${i////})
  arrin=${arrin/.2_mpbs_/}
  mergePeaks -d 200 -cobound 1 $i $WTTfh_WTTh1_up
  mv coBoundBy1.txt ${arrin/.ordered.bed/_TfhTh1up.txt}
  mergePeaks -d 200 -cobound 1 $i $WTTfh_WTTh1_dn
  mv coBoundBy1.txt ${arrin/.ordered.bed/_TfhTh1dn.txt} 
done

rm coBoundBy0.txt
