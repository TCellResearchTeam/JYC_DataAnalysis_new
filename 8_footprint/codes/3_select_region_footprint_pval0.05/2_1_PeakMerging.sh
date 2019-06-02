#!/bin/bash

wk_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/8_footprint/1_mpbs

DKO_WT_up_Tfh=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.05_selected/pval-0.05-up/bed/all.df.numx.c5-DKO_Tfh_vs_WT_Tfh-pval-0.05_up.bed
DKO_WT_dn_Tfh=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.05_selected/pval-0.05-dn/bed/all.df.numx.c5-DKO_Tfh_vs_WT_Tfh-pval-0.05_dn.bed

DKO_WT_up_Th1=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.05_selected/pval-0.05-up/bed/all.df.numx.c5-DKO_Th1_vs_WT_Th1-pval-0.05_up.bed
DKO_WT_dn_Th1=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.05_selected/pval-0.05-dn/bed/all.df.numx.c5-DKO_Th1_vs_WT_Th1-pval-0.05_dn.bed

PKO_WT_up_Tfh=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.05_selected/pval-0.05-up/bed/all.df.numx.c5-Prdm1KO_Tfh_vs_WT_Tfh-pval-0.05_up.bed
PKO_WT_dn_Tfh=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.05_selected/pval-0.05-dn/bed/all.df.numx.c5-Prdm1KO_Tfh_vs_WT_Tfh-pval-0.05_dn.bed

BKO_WT_up_Th1=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.05_selected/pval-0.05-up/bed/all.df.numx.c5-Bcl6KO_Th1_vs_WT_Th1-pval-0.05_up.bed
BKO_WT_dn_Th1=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.05_selected/pval-0.05-dn/bed/all.df.numx.c5-Bcl6KO_Th1_vs_WT_Th1-pval-0.05_dn.bed

### 2_mpbs_Runx
cd $wk_dir/2_mpbs_Runx

for i in Bcl6KO_Th1*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Runx.BKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Runx.BKOdn.txt}
done

for i in DKO_Th1*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Runx.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Runx.DKOdn.txt}
done

for i in Prdm1KO_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Runx.PKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Runx.PKOdn.txt}
done

for i in DKO_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Runx.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Runx.DKOdn.txt}
done

for i in WT_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Runx.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Runx.DKOdn.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Runx.PKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Runx.PKOdn.txt}
done

for i in WT_Th1*ordered.bed
do 
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Runx.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Runx.DKOdn.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Runx.BKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Runx.BKOdn.txt}
done

rm coBoundBy0.txt


### 3_mpbs_Klf
cd $wk_dir/3_mpbs_Klf

for i in Bcl6KO_Th1*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Klf.BKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Klf.BKOdn.txt}
done

for i in DKO_Th1*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Klf.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Klf.DKOdn.txt}
done

for i in Prdm1KO_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Klf.PKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Klf.PKOdn.txt}
done

for i in DKO_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Klf.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Klf.DKOdn.txt}
done

for i in WT_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Klf.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Klf.DKOdn.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Klf.PKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Klf.PKOdn.txt}
done

for i in WT_Th1*ordered.bed
do 
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Klf.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Klf.DKOdn.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Klf.BKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Klf.BKOdn.txt}
done

rm coBoundBy0.txt

### 4_mpbs_Gata
cd $wk_dir/4_mpbs_Gata

for i in Bcl6KO_Th1*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Gata.BKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Gata.BKOdn.txt}
done

for i in DKO_Th1*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Gata.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Gata.DKOdn.txt}
done

for i in Prdm1KO_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Gata.PKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Gata.PKOdn.txt}
done

for i in DKO_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Gata.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Gata.DKOdn.txt}
done

for i in WT_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Gata.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Gata.DKOdn.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Gata.PKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Gata.PKOdn.txt}
done

for i in WT_Th1*ordered.bed
do 
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Gata.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Gata.DKOdn.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Gata.BKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Gata.BKOdn.txt}
done

rm coBoundBy0.txt

### 5_mpbs_Maf
cd $wk_dir/5_mpbs_Maf

for i in Bcl6KO_Th1*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Maf.BKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Maf.BKOdn.txt}
done

for i in DKO_Th1*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Maf.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Maf.DKOdn.txt}
done

for i in Prdm1KO_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Maf.PKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Maf.PKOdn.txt}
done

for i in DKO_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Maf.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Maf.DKOdn.txt}
done

for i in WT_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Maf.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Maf.DKOdn.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Maf.PKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Maf.PKOdn.txt}
done

for i in WT_Th1*ordered.bed
do 
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Maf.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Maf.DKOdn.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Maf.BKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Maf.BKOdn.txt}
done

rm coBoundBy0.txt

### 6_mpbs_Bcl6
cd $wk_dir/6_mpbs_Bcl6

for i in Bcl6KO_Th1*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Bcl6.BKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Bcl6.BKOdn.txt}
done

for i in DKO_Th1*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Bcl6.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Bcl6.DKOdn.txt}
done

for i in Prdm1KO_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Bcl6.PKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Bcl6.PKOdn.txt}
done

for i in DKO_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Bcl6.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Bcl6.DKOdn.txt}
done

for i in WT_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Bcl6.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Bcl6.DKOdn.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Bcl6.PKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Bcl6.PKOdn.txt}
done

for i in WT_Th1*ordered.bed
do 
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Bcl6.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Bcl6.DKOdn.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Bcl6.BKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Bcl6.BKOdn.txt}
done

rm coBoundBy0.txt

### 7_mpbs_Prdm1
cd $wk_dir/7_mpbs_Prdm1

for i in Bcl6KO_Th1*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Prdm1.BKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Prdm1.BKOdn.txt}
done

for i in DKO_Th1*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Prdm1.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Prdm1.DKOdn.txt}
done

for i in Prdm1KO_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Prdm1.PKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Prdm1.PKOdn.txt}
done

for i in DKO_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Prdm1.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Prdm1.DKOdn.txt}
done

for i in WT_Tfh*ordered.bed
do
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Prdm1.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Prdm1.DKOdn.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_up_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Prdm1.PKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $PKO_WT_dn_Tfh
  mv coBoundBy1.txt ${i/.ordered.bed/_Prdm1.PKOdn.txt}
done

for i in WT_Th1*ordered.bed
do 
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Prdm1.DKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $DKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Prdm1.DKOdn.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_up_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Prdm1.BKOup.txt}
  mergePeaks -d 200 -cobound 1 $i $BKO_WT_dn_Th1
  mv coBoundBy1.txt ${i/.ordered.bed/_Prdm1.BKOdn.txt}
done

rm coBoundBy0.txt

