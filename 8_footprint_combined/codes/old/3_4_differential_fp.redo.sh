#!/bin/bash

wk_dir=/home/pipkin/Documents/jycATAC_footprint2/3_diff_footprint_wtFP_updn_log2fc
bam_dir=/home/pipkin/Documents/jycATAC_footprint2/source
mpbs_dir=/home/pipkin/Documents/jycATAC_footprint2/2_mpbs_updn_log2fc
unslt_mpbs_dir=/home/pipkin/Documents/jycATAC_footprint2/2_mpbs_unslt

cd $wk_dir

rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_TfhTh1up_merged.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_TfhTh1up_merged.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/WT_Th1.dupr.srt.bam --output-location=$wk_dir/WT_Tfh_mpbs_TfhTh1up --output-prefix WT_Tfh_mpbs_TfhTh1up --condition1=WT-Tfh --condition2=WT-Th1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_TfhTh1dn_merged.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_TfhTh1dn_merged.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/WT_Th1.dupr.srt.bam --output-location=$wk_dir/WT_Tfh_mpbs_TfhTh1dn --output-prefix WT_Tfh_mpbs_TfhTh1dn --condition1=WT-Tfh --condition2=WT-Th1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$unslt_mpbs_dir/merged_WT_Tfh_mpbs.bed --mpbs-file2=$unslt_mpbs_dir/merged_WT_Tfh_mpbs.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/WT_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_WT-Th1 --output-prefix WT-Tfh_WT-Th1 --condition1=WT-Tfh --condition2=WT-Th1





