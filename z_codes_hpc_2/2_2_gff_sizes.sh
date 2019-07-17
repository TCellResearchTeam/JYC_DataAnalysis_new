awk -F "\t" '{gsub("peak_name=", ""); print $9 "\t" $5-$4}' jycATAC_merged_peaks.gff > jycATAC_merged_peaks.sizes
sort -k1n jycATAC_merged_peaks.sizes > jycATAC_merged_peaks.sizes.srt
