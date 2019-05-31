#!/bin/bash

source_dir=/home/pipkin/Documents/jycATAC/source
wk_dir=/home/pipkin/Documents/jycATAC/footprint/0_fp
cd $source_dir

rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=Bcl6KO_Th1_rep1_fp  Bcl6KO_Th1_rep1.sorted.dupr.bam Bcl6KO_Th1_rep1_peaks.bed &
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=Bcl6KO_Th1_rep2_fp Bcl6KO_Th1_rep2.sorted.dupr.bam Bcl6KO_Th1_rep2_peaks.bed &
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=Bcl6KO_Th1_rep3_fp Bcl6KO_Th1_rep3.sorted.dupr.bam Bcl6KO_Th1_rep3_peaks.bed &
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=DKO_Tfh_rep1_fp DKO_Tfh_rep1.sorted.dupr.bam DKO_Tfh_rep1_peaks.bed
wait
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=DKO_Tfh_rep2_fp DKO_Tfh_rep2.sorted.dupr.bam DKO_Tfh_rep2_peaks.bed &
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=DKO_Tfh_rep3_fp DKO_Tfh_rep3.sorted.dupr.bam DKO_Tfh_rep3_peaks.bed &
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=DKO_Th1_rep1_fp DKO_Th1_rep1.sorted.dupr.bam DKO_Th1_rep1_peaks.bed &
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=DKO_Th1_rep2_fp DKO_Th1_rep2.sorted.dupr.bam DKO_Th1_rep2_peaks.bed
wait
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=DKO_Th1_rep3_fp DKO_Th1_rep3.sorted.dupr.bam DKO_Th1_rep3_peaks.bed &
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=Naive_rep1_fp Naive_rep1.sorted.dupr.bam Naive_rep1_peaks.bed &
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=Naive_rep2_fp Naive_rep2.sorted.dupr.bam Naive_rep2_peaks.bed &
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=Naive_rep3_fp Naive_rep3.sorted.dupr.bam Naive_rep3_peaks.bed
wait
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=Prdm1KO_Tfh_rep1_fp Prdm1KO_Tfh_rep1.sorted.dupr.bam Prdm1KO_Tfh_rep1_peaks.bed &
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=Prdm1KO_Tfh_rep2_fp Prdm1KO_Tfh_rep2.sorted.dupr.bam Prdm1KO_Tfh_rep2_peaks.bed &
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=Prdm1KO_Tfh_rep3_fp Prdm1KO_Tfh_rep3.sorted.dupr.bam Prdm1KO_Tfh_rep3_peaks.bed
wait
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=WT_Tfh_rep1_fp WT_Tfh_rep1.sorted.dupr.bam WT_Tfh_rep1_peaks.bed &
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=WT_Tfh_rep2_fp WT_Tfh_rep2.sorted.dupr.bam WT_Tfh_rep2_peaks.bed &
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=WT_Tfh_rep3_fp WT_Tfh_rep3.sorted.dupr.bam WT_Tfh_rep3_peaks.bed
wait
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=WT_Th1_rep1_fp WT_Th1_rep1.sorted.dupr.bam WT_Th1_rep1_peaks.bed &
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=WT_Th1_rep2_fp WT_Th1_rep2.sorted.dupr.bam WT_Th1_rep2_peaks.bed &
rgt-hint footprinting --atac-seq --organism=mm10 --paired-end --output-location=$wk_dir --output-prefix=WT_Th1_rep3_fp WT_Th1_rep3.sorted.dupr.bam WT_Th1_rep3_peaks.bed 
