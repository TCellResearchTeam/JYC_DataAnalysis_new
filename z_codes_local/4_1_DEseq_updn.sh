#!/bin/bash

wk_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/DEseq2Output
cd $wk_dir

for i in *.csv
do
  awk -F "," '{if (NR==1) {print $0} else if ($3>0) {print $0}}' $i > ${i/.csv/.up.csv}
  awk -F "," '{if (NR==1) {print $0} else if ($3<0) {print $0}}' $i > ${i/.csv/.dn.csv}
done