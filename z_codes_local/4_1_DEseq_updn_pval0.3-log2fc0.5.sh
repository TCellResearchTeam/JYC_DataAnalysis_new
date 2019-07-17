#!/bin/bash

wk_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.3-log2fc-0.5_selected/raw
cd $wk_dir

for i in *.csv
do
  awk -F "," '{if (NR==1) {print $0} else if ($3>0.5 && $6<0.3) {print $0}}' $i > ${i/.csv/-pval0.3-log2fc0.5_up.csv}
  awk -F "," '{if (NR==1) {print $0} else if ($3<-0.5 && $6<0.3) {print $0}}' $i > ${i/.csv/-pval0.3-log2fc0.5_dn.csv}
done