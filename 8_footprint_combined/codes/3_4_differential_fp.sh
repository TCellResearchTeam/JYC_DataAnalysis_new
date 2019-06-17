#!/bin/bash

wk_dir=/home/pipkin/Documents/jycATAC_footprint2/3_pval_slt
bam_dir=/home/pipkin/Documents/jycATAC_footprint2/source
mpbs_dir=/home/pipkin/Documents/jycATAC_footprint2/2_pval_slt_merged

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
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_TfhTh1up_merged.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_TfhTh1up_merged.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/WT_Th1.dupr.srt.bam --output-location=$wk_dir/WT_Tfh_mpbs_TfhTh1up --output-prefix WT_Tfh_mpbs_TfhTh1up --condition1=WT-Tfh --condition2=WT-Th1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_TfhTh1dn_merged.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_TfhTh1dn_merged.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/WT_Th1.dupr.srt.bam --output-location=$wk_dir/WT_Tfh_mpbs_TfhTh1dn --output-prefix WT_Tfh_mpbs_TfhTh1dn --condition1=WT-Tfh --condition2=WT-Th1
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/DKO_Tfh_mpbs_PKOdn_merged.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_mpbs_PKOdn_merged.bed --reads-file1=$bam_dir/DKO_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_PKO-Tfh_dn --output-prefix DKO-Tfh_PKO-Tfh_dn --condition1=DKO --condition2=Prdm1KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/DKO_Tfh_mpbs_PKOup_merged.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_mpbs_PKOup_merged.bed --reads-file1=$bam_dir/DKO_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_PKO-Tfh_up --output-prefix DKO-Tfh_PKO-Tfh_up --condition1=DKO --condition2=Prdm1KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/DKO_Th1_mpbs_BKOdn_merged.bed --mpbs-file2=$mpbs_dir/DKO_Th1_mpbs_BKOdn_merged.bed --reads-file1=$bam_dir/DKO_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_BKO-Th1_dn --output-prefix DKO-Th1_BKO-Th1_dn --condition1=DKO --condition2=Bcl6KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/DKO_Th1_mpbs_BKOup_merged.bed --mpbs-file2=$mpbs_dir/DKO_Th1_mpbs_BKOup_merged.bed --reads-file1=$bam_dir/DKO_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_BKO-Th1_up --output-prefix DKO-Th1_BKO-Th1_up --condition1=DKO --condition2=Bcl6KO
wait

rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_DKOTfh_merged_updn.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_DKOTfh_merged_updn.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/DKO_Tfh.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_pval --output-prefix WT-Tfh_DKO-Tfh_DKO_pval --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_PKO_merged_updn.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_PKO_merged_updn.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_pval --output-prefix WT-Tfh_PKO-Tfh_PKO_pval --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_mpbs_BKO_merged_updn.bed --mpbs-file2=$mpbs_dir/WT_Th1_mpbs_BKO_merged_updn.bed --reads-file1=$bam_dir/WT_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_pval --output-prefix WT-Th1_BKO-Th1_BKO_pval --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_mpbs_DKOTh1_merged_updn.bed --mpbs-file2=$mpbs_dir/WT_Th1_mpbs_DKOTh1_merged_updn.bed --reads-file1=$bam_dir/WT_Th1.dupr.srt.bam --reads-file2=$bam_dir/DKO_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_pval --output-prefix WT-Th1_DKO-Th1_DKO_pval --condition1=WT --condition2=KO

rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_TfhTh1_merged_updn.bed --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_TfhTh1_merged_updn.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/WT_Th1.dupr.srt.bam --output-location=$wk_dir/WT_Tfh_TfhTh1_pval --output-prefix WT_Tfh_TfhTh1_pval --condition1=WT-Tfh --condition2=WT-Th1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/DKO_Tfh_mpbs_PKO_merged_updn.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_mpbs_PKO_merged_updn.bed --reads-file1=$bam_dir/DKO_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_PKO-Tfh_pval --output-prefix DKO-Tfh_PKO-Tfh_pval --condition1=DKO --condition2=Prdm1KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/DKO_Th1_mpbs_BKO_merged_updn.bed --mpbs-file2=$mpbs_dir/DKO_Th1_mpbs_BKO_merged_updn.bed --reads-file1=$bam_dir/DKO_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_BKO-Th1_pval --output-prefix DKO-Th1_BKO-Th1_pval --condition1=DKO --condition2=Bcl6KO
wait

rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/merged_WT_Tfh_mpbs.bed --mpbs-file2=$mpbs_dir/merged_WT_Tfh_mpbs.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/WT_Th1.dupr.srt.bam --output-location=$wk_dir/WT_Tfh_TfhTh1 --output-prefix WT_Tfh_TfhTh1 --condition1=WT-Tfh --condition2=WT-Th1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/merged_WT_Tfh_mpbs.bed --mpbs-file2=$mpbs_dir/merged_WT_Tfh_mpbs.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/DKO_Tfh.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh --output-prefix WT-Tfh_DKO-Tfh --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/merged_WT_Tfh_mpbs.bed --mpbs-file2=$mpbs_dir/merged_WT_Tfh_mpbs.bed --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh --output-prefix WT-Tfh_PKO-Tfh --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/merged_WT_Th1_mpbs.bed --mpbs-file2=$mpbs_dir/merged_WT_Th1_mpbs.bed --reads-file1=$bam_dir/WT_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Th1_BKO-Th1 --output-prefix WT-Th1_BKO-Th1 --condition1=WT --condition2=KO
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/merged_WT_Th1_mpbs.bed --mpbs-file2=$mpbs_dir/merged_WT_Th1_mpbs.bed --reads-file1=$bam_dir/WT_Th1.dupr.srt.bam --reads-file2=$bam_dir/DKO_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Th1_DKO-Th1 --output-prefix WT-Th1_DKO-Th1 --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/merged_DKO_Tfh_mpbs.bed --mpbs-file2=$mpbs_dir/merged_DKO_Tfh_mpbs.bed --reads-file1=$bam_dir/DKO_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_PKO-Tfh --output-prefix DKO-Tfh_PKO-Tfh --condition1=DKO --condition2=Prdm1KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/merged_DKO_Th1_mpbs.bed --mpbs-file2=$mpbs_dir/merged_DKO_Th1_mpbs.bed --reads-file1=$bam_dir/DKO_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_BKO-Th1 --output-prefix DKO-Th1_BKO-Th1 --condition1=WT --condition2=KO














