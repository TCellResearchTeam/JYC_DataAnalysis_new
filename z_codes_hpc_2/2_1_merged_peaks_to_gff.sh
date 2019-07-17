#!/bin/bash

cd /gpfs/home/hdiao/jycATAC/GEO_ATAC/codes

# $2: chr
# $1: peak name
# $3: start
# $4: end

awk \
'{
	if (NR>1)
		{print $2 "\t" "jycATAC_merged_peaks" "\t" "Peak" "\t" $3 "\t" $4 "\t" $6 "\t" $5 "\t" "." "\t" "peak_name=" $1}
}' \
jycATAC_merged_peaks.txt > jycATAC_merged_peaks.gff
