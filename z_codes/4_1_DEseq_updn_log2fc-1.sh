#!/bin/bash

wk_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/log2fc_1_selected/raw
cd $wk_dir

for i in *.csv
do
  awk -F "," '{if (NR==1) {print $0} else if ($3>1) {print $0}}' $i > ${i/.csv/-log2fc-1_up.csv}
  awk -F "," '{if (NR==1) {print $0} else if ($3<-1) {print $0}}' $i > ${i/.csv/-log2fc-1_dn.csv}
done