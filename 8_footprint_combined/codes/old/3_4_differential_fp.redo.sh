#!/bin/bash

wk_dir=/home/pipkin/Documents/jycATAC_footprint2/3_pval_slt_redo
bam_dir=/home/pipkin/Documents/jycATAC_footprint2/source
mpbs_dir=/home/pipkin/Documents/jycATAC_footprint2/2_pval_slt_merged_redo

cd $wk_dir

rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/DKO_Tfh_mpbs_DKO-PKO_dn_merged.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_mpbs_DKO-PKO_dn_merged.bed --reads-file1=$bam_dir/DKO_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_PKO-Tfh_dn --output-prefix DKO-Tfh_PKO-Tfh_dn --condition1=DKO --condition2=Prdm1KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/DKO_Tfh_mpbs_DKO-PKO_up_merged.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_mpbs_DKO-PKO_up_merged.bed --reads-file1=$bam_dir/DKO_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_PKO-Tfh_up --output-prefix DKO-Tfh_PKO-Tfh_up --condition1=DKO --condition2=Prdm1KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/DKO_Th1_mpbs_DKO-BKO_dn_merged.bed --mpbs-file2=$mpbs_dir/DKO_Th1_mpbs_DKO-BKO_dn_merged.bed --reads-file1=$bam_dir/DKO_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_BKO-Th1_dn --output-prefix DKO-Th1_BKO-Th1_dn --condition1=DKO --condition2=Bcl6KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/DKO_Th1_mpbs_DKO-BKO_up_merged.bed --mpbs-file2=$mpbs_dir/DKO_Th1_mpbs_DKO-BKO_up_merged.bed --reads-file1=$bam_dir/DKO_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_BKO-Th1_up --output-prefix DKO-Th1_BKO-Th1_up --condition1=DKO --condition2=Bcl6KO &

rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/DKO_Tfh_mpbs_DKO-PKO_merged_updn.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_mpbs_DKO-PKO_merged_updn.bed --reads-file1=$bam_dir/DKO_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_PKO-Tfh_pval --output-prefix DKO-Tfh_PKO-Tfh_pval --condition1=DKO --condition2=Prdm1KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/DKO_Th1_mpbs_DKO-BKO_merged_updn.bed --mpbs-file2=$mpbs_dir/DKO_Th1_mpbs_DKO-BKO_merged_updn.bed --reads-file1=$bam_dir/DKO_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_BKO-Th1_pval --output-prefix DKO-Th1_BKO-Th1_pval --condition1=DKO --condition2=Bcl6KO








