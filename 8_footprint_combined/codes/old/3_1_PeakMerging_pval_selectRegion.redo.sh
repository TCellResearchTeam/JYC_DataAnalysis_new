#!/bin/bash

wk_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/8_footprint_combined/2_mpbs/0_TFs


##### Ordered bed files
cd $wk_dir
for i in $(find . -name *_mpbs.bed -type f)
do
  awk '{print $1 "\t" $2 "\t" $3 "\t" "NR"NR"--"$4 "\t" $5 "\t" $6}' $i > ${i/.bed/.ordered.bed}
done


##### Reference peak files -- P-Val (DEseq2)
DKO_PKO_up=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.05_selected/bed/all.df.numx.c5-DKO_Tfh_vs_Prdm1KO_Tfh-pval-0.05_up.bed
DKO_PKO_dn=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.05_selected/bed/all.df.numx.c5-DKO_Tfh_vs_Prdm1KO_Tfh-pval-0.05_dn.bed

DKO_BKO_up=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.05_selected/bed/all.df.numx.c5-DKO_Th1_vs_Bcl6KO_Th1-pval-0.05_up.bed
DKO_BKO_dn=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.05_selected/bed/all.df.numx.c5-DKO_Th1_vs_Bcl6KO_Th1-pval-0.05_dn.bed

##### Merge peaks
for i in $(find . -type f -name "DKO_Tfh*ordered.bed")
do
  arrin=(${i////})
  arrin=${arrin/.2_mpbs_/}

  mergePeaks -d 200 -cobound 1 $i $DKO_PKO_up
  mv coBoundBy1.txt ${arrin/.ordered.bed/_DKO-PKO_up.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_PKO_dn
  mv coBoundBy1.txt ${arrin/.ordered.bed/_DKO-PKO_dn.txt}
done

for i in $(find . -type f -name "DKO_Th1*ordered.bed")
do
  arrin=(${i////})
  arrin=${arrin/.2_mpbs_/}  
  mergePeaks -d 200 -cobound 1 $i $DKO_BKO_up
  mv coBoundBy1.txt ${arrin/.ordered.bed/_DKO-BKO_up.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_BKO_dn
  mv coBoundBy1.txt ${arrin/.ordered.bed/_DKO-BKO_dn.txt}  
done

rm coBoundBy0.txt
