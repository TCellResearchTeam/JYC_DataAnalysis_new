#!/bin/bash

wk_dir=/media/pipkin/Yolanda/JYC_DataAnalysis_new/8_footprint_combined/2_mpbs_3/0_TFs
cd $wk_dir


##### Ordered bed files
cd $wk_dir
for i in $(find . -name *_mpbs.bed -type f)
do
  awk '{print $1 "\t" $2 "\t" $3 "\t" "NR"NR"--"$4 "\t" $5 "\t" $6}' $i > ${i/.bed/.ordered.bed}
done


##### Reference peak files -- P-Val (DEseq2)
DKO_WT_up_Tfh=/media/pipkin/Yolanda/JYC_DataAnalysis_new/4_DEseq2/pval-0.1_selected/pval-0.1_updn/all.df.numx.c5-DKO_Tfh_vs_WT_Tfh-pval-0.1_up.bed
DKO_WT_dn_Tfh=/media/pipkin/Yolanda/JYC_DataAnalysis_new/4_DEseq2/pval-0.1_selected/pval-0.1_updn/all.df.numx.c5-DKO_Tfh_vs_WT_Tfh-pval-0.1_dn.bed

DKO_WT_up_Th1=/media/pipkin/Yolanda/JYC_DataAnalysis_new/4_DEseq2/pval-0.1_selected/pval-0.1_updn/all.df.numx.c5-DKO_Th1_vs_WT_Th1-pval-0.1_up.bed
DKO_WT_dn_Th1=/media/pipkin/Yolanda/JYC_DataAnalysis_new/4_DEseq2/pval-0.1_selected/pval-0.1_updn/all.df.numx.c5-DKO_Th1_vs_WT_Th1-pval-0.1_dn.bed

PKO_WT_up_Tfh=/media/pipkin/Yolanda/JYC_DataAnalysis_new/4_DEseq2/pval-0.1_selected/pval-0.1_updn/all.df.numx.c5-Prdm1KO_Tfh_vs_WT_Tfh-pval-0.1_up.bed
PKO_WT_dn_Tfh=/media/pipkin/Yolanda/JYC_DataAnalysis_new/4_DEseq2/pval-0.1_selected/pval-0.1_updn/all.df.numx.c5-Prdm1KO_Tfh_vs_WT_Tfh-pval-0.1_dn.bed

BKO_WT_up_Th1=/media/pipkin/Yolanda/JYC_DataAnalysis_new/4_DEseq2/pval-0.1_selected/pval-0.1_updn/all.df.numx.c5-Bcl6KO_Th1_vs_WT_Th1-pval-0.1_up.bed
BKO_WT_dn_Th1=/media/pipkin/Yolanda/JYC_DataAnalysis_new/4_DEseq2/pval-0.1_selected/pval-0.1_updn/all.df.numx.c5-Bcl6KO_Th1_vs_WT_Th1-pval-0.1_dn.bed

WTTfh_WTTh1_up=/media/pipkin/Yolanda/JYC_DataAnalysis_new/4_DEseq2/pval-0.1_selected/pval-0.1_updn/all.df.numx.c5-WT_Tfh_vs_WT_Th1-pval-0.1_up.bed
WTTfh_WTTh1_dn=/media/pipkin/Yolanda/JYC_DataAnalysis_new/4_DEseq2/pval-0.1_selected/pval-0.1_updn/all.df.numx.c5-WT_Tfh_vs_WT_Th1-pval-0.1_dn.bed

DKO_PKO_up=/media/pipkin/Yolanda/JYC_DataAnalysis_new/4_DEseq2/pval-0.1_selected/pval-0.1_updn/all.df.numx.c5-DKO_Tfh_vs_Prdm1KO_Tfh-pval-0.1_up.bed
DKO_PKO_dn=/media/pipkin/Yolanda/JYC_DataAnalysis_new/4_DEseq2/pval-0.1_selected/pval-0.1_updn/all.df.numx.c5-DKO_Tfh_vs_Prdm1KO_Tfh-pval-0.1_dn.bed

DKO_BKO_up=/media/pipkin/Yolanda/JYC_DataAnalysis_new/4_DEseq2/pval-0.1_selected/pval-0.1_updn/all.df.numx.c5-DKO_Th1_vs_Bcl6KO_Th1-pval-0.1_up.bed
DKO_BKO_dn=/media/pipkin/Yolanda/JYC_DataAnalysis_new/4_DEseq2/pval-0.1_selected/pval-0.1_updn/all.df.numx.c5-DKO_Th1_vs_Bcl6KO_Th1-pval-0.1_dn.bed

##### Merge peaks
for i in $(find . -type f -name "WT_Th1*ordered.bed")
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
done

for i in $(find . -type f -name "WT_Tfh*ordered.bed")
do
  arrin=(${i////})
  arrin=${arrin/.2_mpbs_/}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Tfh
  mv coBoundBy1.txt ${arrin/.ordered.bed/_DKOTfhup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Tfh
  mv coBoundBy1.txt ${arrin/.ordered.bed/_DKOTfhdn.txt}

  mergePeaks -d 200 -cobound 1 $i $PKO_WT_up_Tfh
  mv coBoundBy1.txt ${arrin/.ordered.bed/_PKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_dn_Tfh
  mv coBoundBy1.txt ${arrin/.ordered.bed/_PKOdn.txt}

  mergePeaks -d 200 -cobound 1 $i $WTTfh_WTTh1_up
  mv coBoundBy1.txt ${arrin/.ordered.bed/_TfhTh1up.txt}
  mergePeaks -d 200 -cobound 1 $i $WTTfh_WTTh1_dn
  mv coBoundBy1.txt ${arrin/.ordered.bed/_TfhTh1dn.txt}  
done


for i in $(find . -type f -name "DKO_Tfh*ordered.bed")
do
  arrin=(${i////})
  arrin=${arrin/.2_mpbs_/}

  mergePeaks -d 200 -cobound 1 $i $DKO_PKO_up
  mv coBoundBy1.txt ${arrin/.ordered.bed/_DKO-PKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_PKO_dn
  mv coBoundBy1.txt ${arrin/.ordered.bed/_DKO-PKOdn.txt}
done

for i in $(find . -type f -name "DKO_Th1*ordered.bed")
do
  arrin=(${i////})
  arrin=${arrin/.2_mpbs_/}  
  mergePeaks -d 200 -cobound 1 $i $DKO_BKO_up
  mv coBoundBy1.txt ${arrin/.ordered.bed/_DKO-BKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_BKO_dn
  mv coBoundBy1.txt ${arrin/.ordered.bed/_DKO-BKOdn.txt}  
done

rm coBoundBy0.txt
