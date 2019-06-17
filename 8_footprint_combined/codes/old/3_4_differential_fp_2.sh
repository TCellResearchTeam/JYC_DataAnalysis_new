#!/bin/bash

wk_dir=/home/pipkin/Documents/jycATAC_footprint2/3_diff_footprint_wtFP_updn_pval
bam_dir=/home/pipkin/Documents/jycATAC_footprint2/source
mpbs_dir=/home/pipkin/Documents/jycATAC_footprint2/2_mpbs_updn_pval

cd $wk_dir

rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_DKOTfhdn_merged.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_DKOTfhdn_merged.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/DKO_Tfh.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_dn --output-prefix WT-Tfh_DKO-Tfh_DKOdn --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_DKOTfhup_merged.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_DKOTfhup_merged.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/DKO_Tfh.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_up --output-prefix WT-Tfh_DKO-Tfh_DKOup --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_PKOdn_merged.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_PKOdn_merged.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_dn --output-prefix WT-Tfh_PKO-Tfh_PKOdn --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_PKOup_merged.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_PKOup_merged.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_up --output-prefix WT-Tfh_PKO-Tfh_PKOup --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_mpbs_BKOdn_merged.bed --mpbs-file2=$mpbs_dir/WT_Th1_mpbs_BKOdn_merged.bed --reads-file1=$bam_dir/WT_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_dn --output-prefix WT-Th1_BKO-Th1_BKOdn --condition1=WT --condition2=KO
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_mpbs_BKOup_merged.bed --mpbs-file2=$mpbs_dir/WT_Th1_mpbs_BKOup_merged.bed --reads-file1=$bam_dir/WT_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_up --output-prefix WT-Th1_BKO-Th1_BKOup --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_mpbs_DKOTh1dn_merged.bed --mpbs-file2=$mpbs_dir/WT_Th1_mpbs_DKOTh1dn_merged.bed --reads-file1=$bam_dir/WT_Th1.dupr.srt.bam --reads-file2=$bam_dir/DKO_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_dn --output-prefix WT-Th1_DKO-Th1_DKOdn --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_mpbs_DKOTh1up_merged.bed --mpbs-file2=$mpbs_dir/WT_Th1_mpbs_DKOTh1up_merged.bed --reads-file1=$bam_dir/WT_Th1.dupr.srt.bam --reads-file2=$bam_dir/DKO_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_up --output-prefix WT-Th1_DKO-Th1_DKOup --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_TfhTh1up_merged.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_TfhTh1up_merged.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/WT_Th1.dupr.srt.bam --output-location=$wk_dir/WT_Tfh_mpbs_TfhTh1up --output-prefix WT_Tfh_mpbs_TfhTh1up --condition1=WT-Tfh --condition2=WT-Th1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_TfhTh1dn_merged.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_TfhTh1dn_merged.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/WT_Th1.dupr.srt.bam --output-location=$wk_dir/WT_Tfh_mpbs_TfhTh1dn --output-prefix WT_Tfh_mpbs_TfhTh1dn --condition1=WT-Tfh --condition2=WT-Th1





