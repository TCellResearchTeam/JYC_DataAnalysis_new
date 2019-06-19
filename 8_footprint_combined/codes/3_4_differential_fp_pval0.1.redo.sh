#!/bin/bash

wk_dir=/home/pipkin/Documents/jycATAC_footprint2/3_pval0.1_slt_merged
bam_dir=/home/pipkin/Documents/jycATAC_footprint2/source
mpbs_dir=/home/pipkin/Documents/jycATAC_footprint2/2_pval0.1_slt_merged

cd $wk_dir


rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/DKO_Tfh_mpbs_DKO-PKOdn_merged.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_mpbs_DKO-PKOdn_merged.bed --reads-file1=$bam_dir/DKO_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_PKO-Tfh_dn --output-prefix DKO-Tfh_PKO-Tfh_dn --condition1=DKO --condition2=Prdm1KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/DKO_Tfh_mpbs_DKO-PKOup_merged.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_mpbs_DKO-PKOup_merged.bed --reads-file1=$bam_dir/DKO_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_PKO-Tfh_up --output-prefix DKO-Tfh_PKO-Tfh_up --condition1=DKO --condition2=Prdm1KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/DKO_Th1_mpbs_DKO-BKOdn_merged.bed --mpbs-file2=$mpbs_dir/DKO_Th1_mpbs_DKO-BKOdn_merged.bed --reads-file1=$bam_dir/DKO_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_BKO-Th1_dn --output-prefix DKO-Th1_BKO-Th1_dn --condition1=DKO --condition2=Bcl6KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/DKO_Th1_mpbs_DKO-BKOup_merged.bed --mpbs-file2=$mpbs_dir/DKO_Th1_mpbs_DKO-BKOup_merged.bed --reads-file1=$bam_dir/DKO_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_BKO-Th1_up --output-prefix DKO-Th1_BKO-Th1_up --condition1=DKO --condition2=Bcl6KO &















