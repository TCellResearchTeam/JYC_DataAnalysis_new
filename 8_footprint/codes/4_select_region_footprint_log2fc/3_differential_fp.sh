#!/bin/bash

wk_dir=/home/pipkin/Documents/jycATAC/footprint/3_diff_footprint_wtFP_updn_log2fc
bam_dir=/home/pipkin/Documents/jycATAC/source
mpbs_dir=/home/pipkin/Documents/jycATAC/footprint/1_mpbs_updn_log2fc

cd $wk_dir

rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/WT_Tfh_rep1_DKOdn_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Tfh_rep1_DKOdn_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep1.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_1dn --output-prefix WT-Tfh_DKO-Tfh_1_DKOdn --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/WT_Tfh_rep2_DKOdn_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Tfh_rep2_DKOdn_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep2.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_2dn --output-prefix WT-Tfh_DKO-Tfh_2_DKOdn --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/WT_Tfh_rep3_DKOdn_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Tfh_rep3_DKOdn_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep3.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_3dn --output-prefix WT-Tfh_DKO-Tfh_3_DKOdn --condition1=WT --condition2=KO 
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/WT_Tfh_rep1_DKOup_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Tfh_rep1_DKOup_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep1.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_1up --output-prefix WT-Tfh_DKO-Tfh_1_DKOup --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/WT_Tfh_rep2_DKOup_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Tfh_rep2_DKOup_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep2.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_2up --output-prefix WT-Tfh_DKO-Tfh_2_DKOup --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=3 --mpbs-file1=$mpbs_dir/WT_Tfh_rep3_DKOup_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Tfh_rep3_DKOup_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep3.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_3up --output-prefix WT-Tfh_DKO-Tfh_3_DKOup --condition1=WT --condition2=KO 
wait



rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep1_PKOdn_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Tfh_rep1_PKOdn_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep1.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_1dn --output-prefix WT-Tfh_PKO-Tfh_1_PKOdn --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep2_PKOdn_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Tfh_rep2_PKOdn_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep2.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_2dn --output-prefix WT-Tfh_PKO-Tfh_2_PKOdn --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep3_PKOdn_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Tfh_rep3_PKOdn_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep3.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_3dn --output-prefix WT-Tfh_PKO-Tfh_3_PKOdn --condition1=WT --condition2=KO 
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep1_PKOup_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Tfh_rep1_PKOup_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep1.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_1up --output-prefix WT-Tfh_PKO-Tfh_1_PKOup --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep2_PKOup_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Tfh_rep2_PKOup_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep2.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_2up --output-prefix WT-Tfh_PKO-Tfh_2_PKOup --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep3_PKOup_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Tfh_rep3_PKOup_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep3.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_3up --output-prefix WT-Tfh_PKO-Tfh_3_PKOup --condition1=WT --condition2=KO 
wait



rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep1_BKOdn_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Th1_rep1_BKOdn_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep1.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_1dn --output-prefix WT-Th1_BKO-Th1_1_BKOdn --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep2_BKOdn_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Th1_rep2_BKOdn_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep2.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_2dn --output-prefix WT-Th1_BKO-Th1_2_BKOdn --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep3_BKOdn_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Th1_rep3_BKOdn_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep3.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_3dn --output-prefix WT-Th1_BKO-Th1_3_BKOdn --condition1=WT --condition2=KO 
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep1_BKOup_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Th1_rep1_BKOup_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep1.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_1up --output-prefix WT-Th1_BKO-Th1_1_BKOup --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep2_BKOup_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Th1_rep2_BKOup_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep2.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_2up --output-prefix WT-Th1_BKO-Th1_2_BKOup --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep3_BKOup_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Th1_rep3_BKOup_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep3.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_3up --output-prefix WT-Th1_BKO-Th1_3_BKOup --condition1=WT --condition2=KO 
wait



rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep1_DKOdn_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Th1_rep1_DKOdn_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep1.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_1dn --output-prefix WT-Th1_DKO-Th1_1_DKOdn --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep2_DKOdn_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Th1_rep2_DKOdn_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep2.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_2dn --output-prefix WT-Th1_DKO-Th1_2_DKOdn --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep3_DKOdn_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Th1_rep3_DKOdn_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep3.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_3dn --output-prefix WT-Th1_DKO-Th1_3_DKOdn --condition1=WT --condition2=KO 
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep1_DKOup_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Th1_rep1_DKOup_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep1.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_1up --output-prefix WT-Th1_DKO-Th1_1_DKOup --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep2_DKOup_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Th1_rep2_DKOup_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep2.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_2up --output-prefix WT-Th1_DKO-Th1_2_DKOup --condition1=WT --condition2=KO &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep3_DKOup_mpbs.bed --mpbs-file2=$mpbs_dir/WT_Th1_rep3_DKOup_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep3.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_3up --output-prefix WT-Th1_DKO-Th1_3_DKOup --condition1=WT --condition2=KO 








