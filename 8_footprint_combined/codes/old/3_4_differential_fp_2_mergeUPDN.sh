#!/bin/bash

wk_dir=/home/pipkin/Documents/jycATAC_footprint2/3_diff_footprint_wtFP_updn_pval_updn
bam_dir=/home/pipkin/Documents/jycATAC_footprint2/source
mpbs_dir=/home/pipkin/Documents/jycATAC_footprint2/2_mpbs_updn_pval_updn

cd $wk_dir

rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_DKOTfh --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_DKOTfh --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/DKO_Tfh.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh --output-prefix WT-Tfh_DKO-Tfh_DKO --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_PKO --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_PKO --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh --output-prefix WT-Tfh_PKO-Tfh_PKO --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_mpbs_BKO --mpbs-file2=$mpbs_dir/WT_Th1_mpbs_BKO --reads-file1=$bam_dir/WT_Th1.dupr.srt.bam --reads-file2=$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Th1_BKO-Th1 --output-prefix WT-Th1_BKO-Th1_BKO --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_mpbs_DKOTh1 --mpbs-file2=$mpbs_dir/WT_Th1_mpbs_DKOTh1 --reads-file1=$bam_dir/WT_Th1.dupr.srt.bam --reads-file2=$bam_dir/DKO_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Th1_DKO-Th1 --output-prefix WT-Th1_DKO-Th1_DKO --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/WT_Tfh_mpbs_TfhTh1 --mpbs-file2=$mpbs_dir/WT_Tfh_mpbs_TfhTh1 --reads-file1=$bam_dir/WT_Tfh.dupr.srt.bam --reads-file2=$bam_dir/WT_Th1.dupr.srt.bam --output-location=$wk_dir/WT_Tfh_TfhTh1 --output-prefix WT_Tfh_TfhTh1 --condition1=WT-Tfh --condition2=WT-Th1





