#!/bin/bash

for i in *.txt
do
  #awk '{if ($9 > 1.3) {print $1 "\t" $2 "\t" $3 "\t" $10}}' $i > ${i/.txt/.sig.bed} # q value < 0.05
  awk '{if ($7 > 2) {print $1 "\t" $2 "\t" $3 "\t" $10}}' $i > ${i/.txt/.sig.bed} # p value < 0.01
  awk '{if ($7 > 2) {print $0}}' $i > ${i/.txt/.sig.txt} # p value < 0.01
done