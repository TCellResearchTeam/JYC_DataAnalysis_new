#!/bin/bash

gene_list=(Cd200 Cxcr5 Gata3 Icos Il21 Pdcd1 Selplg Tbx21 Tcf7)

for i in ${gene_list[@]}
do
  mergePeaks -d 150 *${i}*.bed > merged_${i}.txt
done