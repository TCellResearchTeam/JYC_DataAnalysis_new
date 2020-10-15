#!/bin/bash

wk_dir=/media/pipkin/Yolanda/JYC_DataAnalysis_new/8_footprint_combined/3_diff_footprint_allregions
bam_dir=/home/pipkin/Documents/jycATAC_footprint2/source
mpbs_dir=/media/pipkin/Yolanda/JYC_DataAnalysis_new/8_footprint_combined/2_mpbs_3/0_TFs/2_mpbs_Yy1

cd $wk_dir


rgt-hint differential --organism=mm10 --output-profiles --nc=2 \
  --mpbs-files $mpbs_dir/WT_Tfh_mpbs.bed,$mpbs_dir/WT_Th1_mpbs.bed \
  --reads-files $bam_dir/WT_Tfh.dupr.srt.bam,$bam_dir/WT_Th1.dupr.srt.bam \
  --output-location=$wk_dir/WT-Tfh_WT-Th1 --output-prefix WT-Tfh_WT-Th1 --conditions WT-Tfh,WT-Th1