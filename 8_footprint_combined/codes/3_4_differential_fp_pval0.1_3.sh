#!/bin/bash

wk_dir=/media/pipkin/Yolanda/JYC_DataAnalysis_new/8_footprint_combined/3_diff_footprint/3_pval0.1_slt_merged_3
bam_dir=/home/pipkin/Documents/jycATAC_footprint2/source
mpbs_dir=/media/pipkin/Yolanda/JYC_DataAnalysis_new/8_footprint_combined/2_mpbs_3/2_pval0.1_slt_merged

cd $wk_dir

rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/WT_Tfh_mpbs_DKOTfhdn_merged.bed,$mpbs_dir/WT_Tfh_mpbs_DKOTfhdn_merged.bed --reads-files $bam_dir/WT_Tfh.dupr.srt.bam,$bam_dir/DKO_Tfh.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_dn --output-prefix WT-Tfh_DKO-Tfh_DKOdn --conditions WT,KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/WT_Tfh_mpbs_DKOTfhup_merged.bed,$mpbs_dir/WT_Tfh_mpbs_DKOTfhup_merged.bed --reads-files $bam_dir/WT_Tfh.dupr.srt.bam,$bam_dir/DKO_Tfh.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_up --output-prefix WT-Tfh_DKO-Tfh_DKOup --conditions WT,KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/WT_Tfh_mpbs_PKOdn_merged.bed,$mpbs_dir/WT_Tfh_mpbs_PKOdn_merged.bed --reads-files $bam_dir/WT_Tfh.dupr.srt.bam,$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_dn --output-prefix WT-Tfh_PKO-Tfh_PKOdn --conditions WT,KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/WT_Tfh_mpbs_PKOup_merged.bed,$mpbs_dir/WT_Tfh_mpbs_PKOup_merged.bed --reads-files $bam_dir/WT_Tfh.dupr.srt.bam,$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_up --output-prefix WT-Tfh_PKO-Tfh_PKOup --conditions WT,KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/WT_Th1_mpbs_BKOdn_merged.bed,$mpbs_dir/WT_Th1_mpbs_BKOdn_merged.bed --reads-files $bam_dir/WT_Th1.dupr.srt.bam,$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_dn --output-prefix WT-Th1_BKO-Th1_BKOdn --conditions WT,KO
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/WT_Th1_mpbs_BKOup_merged.bed,$mpbs_dir/WT_Th1_mpbs_BKOup_merged.bed --reads-files $bam_dir/WT_Th1.dupr.srt.bam,$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_up --output-prefix WT-Th1_BKO-Th1_BKOup --conditions WT,KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/WT_Th1_mpbs_DKOTh1dn_merged.bed,$mpbs_dir/WT_Th1_mpbs_DKOTh1dn_merged.bed --reads-files $bam_dir/WT_Th1.dupr.srt.bam,$bam_dir/DKO_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_dn --output-prefix WT-Th1_DKO-Th1_DKOdn --conditions WT,KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/WT_Th1_mpbs_DKOTh1up_merged.bed,$mpbs_dir/WT_Th1_mpbs_DKOTh1up_merged.bed --reads-files $bam_dir/WT_Th1.dupr.srt.bam,$bam_dir/DKO_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_up --output-prefix WT-Th1_DKO-Th1_DKOup --conditions WT,KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/WT_Tfh_mpbs_TfhTh1up_merged.bed,$mpbs_dir/WT_Tfh_mpbs_TfhTh1up_merged.bed --reads-files $bam_dir/WT_Tfh.dupr.srt.bam,$bam_dir/WT_Th1.dupr.srt.bam --output-location=$wk_dir/WT_Tfh_mpbs_TfhTh1up --output-prefix WT_Tfh_mpbs_TfhTh1up --conditions WT-Tfh,WT-Th1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/WT_Tfh_mpbs_TfhTh1dn_merged.bed,$mpbs_dir/WT_Tfh_mpbs_TfhTh1dn_merged.bed --reads-files $bam_dir/WT_Tfh.dupr.srt.bam,$bam_dir/WT_Th1.dupr.srt.bam --output-location=$wk_dir/WT_Tfh_mpbs_TfhTh1dn --output-prefix WT_Tfh_mpbs_TfhTh1dn --conditions WT-Tfh,WT-Th1
wait

rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/WT_Tfh_mpbs_DKOTfh_mergedupdn.bed,$mpbs_dir/WT_Tfh_mpbs_DKOTfh_mergedupdn.bed --reads-files $bam_dir/WT_Tfh.dupr.srt.bam,$bam_dir/DKO_Tfh.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_pval --output-prefix WT-Tfh_DKO-Tfh_DKO_pval --conditions WT,KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/WT_Tfh_mpbs_PKO_mergedupdn.bed,$mpbs_dir/WT_Tfh_mpbs_PKO_mergedupdn.bed --reads-files $bam_dir/WT_Tfh.dupr.srt.bam,$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_pval --output-prefix WT-Tfh_PKO-Tfh_PKO_pval --conditions WT,KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/WT_Th1_mpbs_BKO_mergedupdn.bed,$mpbs_dir/WT_Th1_mpbs_BKO_mergedupdn.bed --reads-files $bam_dir/WT_Th1.dupr.srt.bam,$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_pval --output-prefix WT-Th1_BKO-Th1_BKO_pval --conditions WT,KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/WT_Th1_mpbs_DKOTh1_mergedupdn.bed,$mpbs_dir/WT_Th1_mpbs_DKOTh1_mergedupdn.bed --reads-files $bam_dir/WT_Th1.dupr.srt.bam,$bam_dir/DKO_Th1.dupr.srt.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_pval --output-prefix WT-Th1_DKO-Th1_DKO_pval --conditions WT,KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-files $mpbs_dir/WT_Tfh_mpbs_TfhTh1_mergedupdn.bed,$mpbs_dir/WT_Tfh_mpbs_TfhTh1_mergedupdn.bed --reads-files $bam_dir/WT_Tfh.dupr.srt.bam,$bam_dir/WT_Th1.dupr.srt.bam --output-location=$wk_dir/WT_Tfh_TfhTh1_pval --output-prefix WT_Tfh_TfhTh1_pval --conditions WT-Tfh,WT-Th1
wait

rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/DKO_Tfh_mpbs_DKO-PKO_dn_merged.bed,$mpbs_dir/DKO_Tfh_mpbs_DKO-PKO_dn_merged.bed --reads-files $bam_dir/DKO_Tfh.dupr.srt.bam,$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_PKO-Tfh_dn --output-prefix DKO-Tfh_PKO-Tfh_dn --conditions DKO,Prdm1KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/DKO_Tfh_mpbs_DKO-PKO_up_merged.bed,$mpbs_dir/DKO_Tfh_mpbs_DKO-PKO_up_merged.bed --reads-files $bam_dir/DKO_Tfh.dupr.srt.bam,$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_PKO-Tfh_up --output-prefix DKO-Tfh_PKO-Tfh_up --conditions DKO,Prdm1KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/DKO_Th1_mpbs_DKO-BKO_dn_merged.bed,$mpbs_dir/DKO_Th1_mpbs_DKO-BKO_dn_merged.bed --reads-files $bam_dir/DKO_Th1.dupr.srt.bam,$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_BKO-Th1_dn --output-prefix DKO-Th1_BKO-Th1_dn --conditions DKO,Bcl6KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/DKO_Th1_mpbs_DKO-BKO_up_merged.bed,$mpbs_dir/DKO_Th1_mpbs_DKO-BKO_up_merged.bed --reads-files $bam_dir/DKO_Th1.dupr.srt.bam,$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_BKO-Th1_up --output-prefix DKO-Th1_BKO-Th1_up --conditions DKO,Bcl6KO &

rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-files $mpbs_dir/DKO_Tfh_mpbs_DKO-PKO_mergedupdn.bed,$mpbs_dir/DKO_Tfh_mpbs_DKO-PKO_mergedupdn.bed --reads-files $bam_dir/DKO_Tfh.dupr.srt.bam,$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_PKO-Tfh_pval --output-prefix DKO-Tfh_PKO-Tfh_pval --conditions DKO,Prdm1KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-files $mpbs_dir/DKO_Th1_mpbs_DKO-BKO_mergedupdn.bed,$mpbs_dir/DKO_Th1_mpbs_DKO-BKO_mergedupdn.bed --reads-files $bam_dir/DKO_Th1.dupr.srt.bam,$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_BKO-Th1_pval --output-prefix DKO-Th1_BKO-Th1_pval --conditions DKO,Bcl6KO

rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/DKO_Tfh_mpbs_DKO-PKOdn_merged.bed,$mpbs_dir/DKO_Tfh_mpbs_DKO-PKOdn_merged.bed --reads-files $bam_dir/DKO_Tfh.dupr.srt.bam,$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_PKO-Tfh_dn --output-prefix DKO-Tfh_PKO-Tfh_dn --conditions DKO,Prdm1KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/DKO_Tfh_mpbs_DKO-PKOup_merged.bed,$mpbs_dir/DKO_Tfh_mpbs_DKO-PKOup_merged.bed --reads-files $bam_dir/DKO_Tfh.dupr.srt.bam,$bam_dir/Prdm1KO_Tfh.dupr.srt.bam --output-location=$wk_dir/DKO-Tfh_PKO-Tfh_up --output-prefix DKO-Tfh_PKO-Tfh_up --conditions DKO,Prdm1KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/DKO_Th1_mpbs_DKO-BKOdn_merged.bed,$mpbs_dir/DKO_Th1_mpbs_DKO-BKOdn_merged.bed --reads-files $bam_dir/DKO_Th1.dupr.srt.bam,$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_BKO-Th1_dn --output-prefix DKO-Th1_BKO-Th1_dn --conditions DKO,Bcl6KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-files $mpbs_dir/DKO_Th1_mpbs_DKO-BKOup_merged.bed,$mpbs_dir/DKO_Th1_mpbs_DKO-BKOup_merged.bed --reads-files $bam_dir/DKO_Th1.dupr.srt.bam,$bam_dir/Bcl6KO_Th1.dupr.srt.bam --output-location=$wk_dir/DKO-Th1_BKO-Th1_up --output-prefix DKO-Th1_BKO-Th1_up --conditions DKO,Bcl6KO &














