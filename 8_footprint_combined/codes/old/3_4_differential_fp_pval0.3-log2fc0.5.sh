#!/bin/bash

wk_dir=/home/pipkin/Documents/jycATAC_footprint2/3_pval0.3_log2fc0.5_merged
bam_dir=/home/pipkin/Documents/jycATAC_footprint2/source
mpbs_dir=/home/pipkin/Documents/jycATAC_footprint2/2_pval0.3_log2fc0.5_merged

cd $wk_dir

rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_DKOTfhdn_merged.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_DKOTfhdn_merged.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/DKO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_WT-Tfh_dn --output-prefix DKO-Tfh_WT-Tfh_DKOdn --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_DKOTfhup_merged.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_DKOTfhup_merged.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/DKO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_WT-Tfh_up --output-prefix DKO-Tfh_WT-Tfh_DKOup --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_PKOdn_merged.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_PKOdn_merged.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/PKO-Tfh_WT-Tfh_dn --output-prefix PKO-Tfh_WT-Tfh_PKOdn --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_PKOup_merged.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_PKOup_merged.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/PKO-Tfh_WT-Tfh_up --output-prefix PKO-Tfh_WT-Tfh_PKOup --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_mpbs_BKOdn_merged.bed --mpbs-file2=$mpbs_dir/WT_Th1_mpbs_BKOdn_merged.bed --reads-file1=$bam_dir/WT_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/BKO-Th1_WT-Th1_dn --output-prefix BKO-Th1_WT-Th1_BKOdn --condition1=WT --condition2=KO
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_mpbs_BKOup_merged.bed --mpbs-file2=$mpbs_dir/WT_Th1_mpbs_BKOup_merged.bed --reads-file1=$bam_dir/WT_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/BKO-Th1_WT-Th1_up --output-prefix BKO-Th1_WT-Th1_BKOup --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_mpbs_DKOTh1dn_merged.bed --mpbs-file2=$mpbs_dir/WT_Th1_mpbs_DKOTh1dn_merged.bed --reads-file1=$bam_dir/WT_Th1.dupr.srt.bam --reads-file2=$bam_dir/DKO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_WT-Th1_dn --output-prefix DKO-Th1_WT-Th1_DKOdn --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_mpbs_DKOTh1up_merged.bed --mpbs-file2=$mpbs_dir/WT_Th1_mpbs_DKOTh1up_merged.bed --reads-file1=$bam_dir/WT_Th1.dupr.srt.bam --reads-file2=$bam_dir/DKO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_WT-Th1_up --output-prefix DKO-Th1_WT-Th1_DKOup --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_TfhTh1up_merged.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_TfhTh1up_merged.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/WT_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_WT-Th1up --output-prefix WT-Tfh_WT-Th1up --condition1=WT-Tfh --condition2=WT-Th1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_TfhTh1dn_merged.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_TfhTh1dn_merged.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/WT_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_WT-Th1dn --output-prefix WT-Tfh_WT-Th1dn --condition1=WT-Tfh --condition2=WT-Th1
wait

rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_DKOTfh_mergedupdn.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_DKOTfh_mergedupdn.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/DKO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_WT-Tfh_pval --output-prefix DKO-Tfh_WT-Tfh_DKO_pval --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_PKO_mergedupdn.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_PKO_mergedupdn.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/PKO-Tfh_WT-Tfh_pval --output-prefix PKO-Tfh_WT-Tfh_PKO_pval --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_mpbs_BKO_mergedupdn.bed --mpbs-file2=$mpbs_dir/WT_Th1_mpbs_BKO_mergedupdn.bed --reads-file1=$bam_dir/WT_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/BKO-Th1_WT-Th1_pval --output-prefix BKO-Th1_WT-Th1_BKO_pval --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_mpbs_DKOTh1_mergedupdn.bed --mpbs-file2=$mpbs_dir/WT_Th1_mpbs_DKOTh1_mergedupdn.bed --reads-file1=$bam_dir/WT_Th1.dupr.srt.bam --reads-file2=$bam_dir/DKO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_WT-Th1_pval --output-prefix DKO-Th1_WT-Th1_DKO_pval --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_TfhTh1_mergedupdn.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_TfhTh1_mergedupdn.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/WT_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_WT-Th1_pval --output-prefix WT-Tfh_WT-Th1_pval --condition1=WT-Tfh --condition2=WT-Th1
wait

rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/DKO_Tfh_mpbs_DKO-PKOdn_merged.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_mpbs_DKO-PKOdn_merged.bed --reads-file1=$bam_dir/DKO_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_PKO-Tfh_dn --output-prefix DKO-Tfh_PKO-Tfh_dn --condition1=DKO --condition2=Prdm1KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/DKO_Tfh_mpbs_DKO-PKOup_merged.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_mpbs_DKO-PKOup_merged.bed --reads-file1=$bam_dir/DKO_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_PKO-Tfh_up --output-prefix DKO-Tfh_PKO-Tfh_up --condition1=DKO --condition2=Prdm1KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/DKO_Th1_mpbs_DKO-BKOdn_merged.bed --mpbs-file2=$mpbs_dir/DKO_Th1_mpbs_DKO-BKOdn_merged.bed --reads-file1=$bam_dir/DKO_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_BKO-Th1_dn --output-prefix DKO-Th1_BKO-Th1_dn --condition1=DKO --condition2=Bcl6KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/DKO_Th1_mpbs_DKO-BKOup_merged.bed --mpbs-file2=$mpbs_dir/DKO_Th1_mpbs_DKO-BKOup_merged.bed --reads-file1=$bam_dir/DKO_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_BKO-Th1_up --output-prefix DKO-Th1_BKO-Th1_up --condition1=DKO --condition2=Bcl6KO &

rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/DKO_Tfh_mpbs_DKO-PKO_mergedupdn.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_mpbs_DKO-PKO_mergedupdn.bed --reads-file1=$bam_dir/DKO_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_PKO-Tfh_pval --output-prefix DKO-Tfh_PKO-Tfh_pval --condition1=DKO --condition2=Prdm1KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/DKO_Th1_mpbs_DKO-BKO_mergedupdn.bed --mpbs-file2=$mpbs_dir/DKO_Th1_mpbs_DKO-BKO_mergedupdn.bed --reads-file1=$bam_dir/DKO_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_BKO-Th1_pval --output-prefix DKO-Th1_BKO-Th1_pval --condition1=DKO --condition2=Bcl6KO















