#!/bin/bash

wk_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/8_footprint_combined/2_mpbs


##### Ordered bed files
cd $wk_dir
#for i in $(find . -name *.bed -type f)
#do
#  awk '{print $1 "\t" $2 "\t" $3 "\t" "NR"NR"--"$4 "\t" $5 "\t" $6}' $i > ${i/.bed/.ordered.bed}
#done


##### Reference peak files (DEseq2)
DKO_WT_up_Tfh=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/log2fc_selected/all.df.numx.c5-DKO_Tfh_vs_WT_Tfh.up.bed
DKO_WT_dn_Tfh=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/log2fc_selected/all.df.numx.c5-DKO_Tfh_vs_WT_Tfh.dn.bed

DKO_WT_up_Th1=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/log2fc_selected/all.df.numx.c5-DKO_Th1_vs_WT_Th1.up.bed
DKO_WT_dn_Th1=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/log2fc_selected/all.df.numx.c5-DKO_Th1_vs_WT_Th1.dn.bed

PKO_WT_up_Tfh=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/log2fc_selected/all.df.numx.c5-Prdm1KO_Tfh_vs_WT_Tfh.up.bed
PKO_WT_dn_Tfh=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/log2fc_selected/all.df.numx.c5-Prdm1KO_Tfh_vs_WT_Tfh.dn.bed

BKO_WT_up_Th1=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/log2fc_selected/all.df.numx.c5-Bcl6KO_Th1_vs_WT_Th1.up.bed
BKO_WT_dn_Th1=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/log2fc_selected/all.df.numx.c5-Bcl6KO_Th1_vs_WT_Th1.dn.bed


##### Merge peaks
for i in $(find . -type f -name "*ordered.bed")
do
  arrin=(${i////})
  arrin=${arrin/.2_mpbs_/}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_up_Th1
  mv coBoundBy1.txt ${arrin/.ordered.bed/_BKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_dn_Th1
  mv coBoundBy1.txt ${arrin/.ordered.bed/_BKOdn.txt}

  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Th1
  mv coBoundBy1.txt ${arrin/.ordered.bed/_DKOTh1up.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Th1
  mv coBoundBy1.txt ${arrin/.ordered.bed/_DKOTh1dn.txt}

  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Tfh
  mv coBoundBy1.txt ${arrin/.ordered.bed/_DKOTfhup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Tfh
  mv coBoundBy1.txt ${arrin/.ordered.bed/_DKOTfhdn.txt}

  mergePeaks -d 200 -cobound 1 $i $PKO_WT_up_Tfh
  mv coBoundBy1.txt ${arrin/.ordered.bed/_PKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_dn_Tfh
  mv coBoundBy1.txt ${arrin/.ordered.bed/_PKOdn.txt} 
done

rm coBoundBy0.txt
