#!/bin/bash

wk_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.1_selected/raw
cd $wk_dir

for i in *.csv
do
  awk -F "," '{if (NR==1) {print $0} else if ($3>0 && $6<0.1) {print $0}}' $i > ${i/.csv/-pval-0.1_up.csv}
  awk -F "," '{if (NR==1) {print $0} else if ($3<0 && $6<0.1) {print $0}}' $i > ${i/.csv/-pval-0.1_dn.csv}
done