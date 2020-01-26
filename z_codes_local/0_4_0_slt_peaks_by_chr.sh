#!/bin/bash

### Select peaks that contain genes of interest to save processing time
awk '{if (($1=="chr5") || ($1=="chr9") || ($1=="chr11") || \
($1=="chr2") || ($1=="chr3") || ($1=="chr1") || \
($1=="chr16") || ($1=="chr17") || ($1=="chr4") || ($1=="chr8") ) \
{print $0} }' /Volumes/Yolanda/JYC_DataAnalysis/z_codes_local/jycATAC_merged_peaks.bed \
> /Volumes/Yolanda/JYC_DataAnalysis/z_codes_local/jycATAC_merged_peaks_chr-slt.bed