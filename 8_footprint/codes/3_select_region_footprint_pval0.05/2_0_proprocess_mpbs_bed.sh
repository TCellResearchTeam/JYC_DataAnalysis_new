#!/bin/bash

cd /Volumes/Yolanda/jycATAC/JYC_DataAnalysis/8_footprint/1_mpbs

for i in $(find . -name *.bed -type f)
do
  awk '{print $1 "\t" $2 "\t" $3 "\t" "NR"NR"--"$4 "\t" $5 "\t" $6}' $i > ${i/.bed/.ordered.bed}
done