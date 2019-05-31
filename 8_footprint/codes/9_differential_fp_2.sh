#!/bin/bash

bam_dir=/home/pipkin/Documents/jycATAC/source

##### Bcl6
wk_dir=/home/pipkin/Documents/jycATAC/footprint/2_diff_footprint/Bcl6
mpbs_dir=/home/pipkin/Documents/jycATAC/footprint/1_mpbs/6_mpbs_Bcl6
cd $wk_dir

rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep1_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_rep1_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep1.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_1 --output-prefix WT-Tfh_DKO-Tfh_1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep2_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_rep2_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep2.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_2 --output-prefix WT-Tfh_DKO-Tfh_2 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep3_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_rep3_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep3.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_3 --output-prefix WT-Tfh_DKO-Tfh_3
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep1_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Prdm1KO_Tfh_rep1_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep1.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_1 --output-prefix WT-Tfh_PKO-Tfh_1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep2_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Prdm1KO_Tfh_rep2_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep2.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_2 --output-prefix WT-Tfh_PKO-Tfh_2 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep3_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Prdm1KO_Tfh_rep3_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep3.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_3 --output-prefix WT-Tfh_PKO-Tfh_3
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep1_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Bcl6KO_Th1_rep1_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep1.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_1 --output-prefix WT-Th1_BKO-Th1_1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep2_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Bcl6KO_Th1_rep2_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep2.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_2 --output-prefix WT-Th1_BKO-Th1_2 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep3_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Bcl6KO_Th1_rep3_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep3.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_3 --output-prefix WT-Th1_BKO-Th1_3
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep1_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Th1_rep1_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep1.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_1 --output-prefix WT-Th1_DKO-Th1_1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep2_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Th1_rep2_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep2.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_2 --output-prefix WT-Th1_DKO-Th1_2 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep3_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Th1_rep3_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep3.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_3 --output-prefix WT-Th1_DKO-Th1_3

##### BCL6
wk_dir=/home/pipkin/Documents/jycATAC/footprint/2_diff_footprint/BCL6
mpbs_dir=/home/pipkin/Documents/jycATAC/footprint/1_mpbs/6_mpbs_BCL6
cd $wk_dir

rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep1_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_rep1_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep1.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_1 --output-prefix WT-Tfh_DKO-Tfh_1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep2_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_rep2_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep2.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_2 --output-prefix WT-Tfh_DKO-Tfh_2 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep3_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_rep3_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep3.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_3 --output-prefix WT-Tfh_DKO-Tfh_3
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep1_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Prdm1KO_Tfh_rep1_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep1.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_1 --output-prefix WT-Tfh_PKO-Tfh_1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep2_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Prdm1KO_Tfh_rep2_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep2.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_2 --output-prefix WT-Tfh_PKO-Tfh_2 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep3_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Prdm1KO_Tfh_rep3_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep3.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_3 --output-prefix WT-Tfh_PKO-Tfh_3
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep1_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Bcl6KO_Th1_rep1_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep1.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_1 --output-prefix WT-Th1_BKO-Th1_1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep2_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Bcl6KO_Th1_rep2_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep2.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_2 --output-prefix WT-Th1_BKO-Th1_2 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep3_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Bcl6KO_Th1_rep3_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep3.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_3 --output-prefix WT-Th1_BKO-Th1_3
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep1_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Th1_rep1_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep1.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_1 --output-prefix WT-Th1_DKO-Th1_1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep2_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Th1_rep2_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep2.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_2 --output-prefix WT-Th1_DKO-Th1_2 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep3_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Th1_rep3_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep3.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_3 --output-prefix WT-Th1_DKO-Th1_3


##### Prdm1
wk_dir=/home/pipkin/Documents/jycATAC/footprint/2_diff_footprint/Prdm1
mpbs_dir=/home/pipkin/Documents/jycATAC/footprint/1_mpbs/7_mpbs_Prdm1
cd $wk_dir

rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep1_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_rep1_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep1.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_1 --output-prefix WT-Tfh_DKO-Tfh_1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep2_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_rep2_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep2.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_2 --output-prefix WT-Tfh_DKO-Tfh_2 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep3_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_rep3_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep3.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_3 --output-prefix WT-Tfh_DKO-Tfh_3
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep1_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Prdm1KO_Tfh_rep1_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep1.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_1 --output-prefix WT-Tfh_PKO-Tfh_1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep2_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Prdm1KO_Tfh_rep2_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep2.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_2 --output-prefix WT-Tfh_PKO-Tfh_2 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep3_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Prdm1KO_Tfh_rep3_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep3.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_3 --output-prefix WT-Tfh_PKO-Tfh_3
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep1_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Bcl6KO_Th1_rep1_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep1.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_1 --output-prefix WT-Th1_BKO-Th1_1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep2_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Bcl6KO_Th1_rep2_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep2.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_2 --output-prefix WT-Th1_BKO-Th1_2 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep3_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Bcl6KO_Th1_rep3_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep3.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_3 --output-prefix WT-Th1_BKO-Th1_3
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep1_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Th1_rep1_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep1.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_1 --output-prefix WT-Th1_DKO-Th1_1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep2_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Th1_rep2_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep2.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_2 --output-prefix WT-Th1_DKO-Th1_2 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep3_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Th1_rep3_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep3.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_3 --output-prefix WT-Th1_DKO-Th1_3

##### PRDM1
wk_dir=/home/pipkin/Documents/jycATAC/footprint/2_diff_footprint/PRDM1
mpbs_dir=/home/pipkin/Documents/jycATAC/footprint/1_mpbs/7_mpbs_PRDM1
cd $wk_dir

rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep1_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_rep1_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep1.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_1 --output-prefix WT-Tfh_DKO-Tfh_1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep2_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_rep2_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep2.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_2 --output-prefix WT-Tfh_DKO-Tfh_2 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep3_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Tfh_rep3_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep3.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Tfh_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_DKO-Tfh_3 --output-prefix WT-Tfh_DKO-Tfh_3
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep1_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Prdm1KO_Tfh_rep1_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep1.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_1 --output-prefix WT-Tfh_PKO-Tfh_1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep2_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Prdm1KO_Tfh_rep2_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep2.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_2 --output-prefix WT-Tfh_PKO-Tfh_2 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Tfh_rep3_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Prdm1KO_Tfh_rep3_fp_mpbs.bed --reads-file1=$bam_dir/WT_Tfh_rep3.sorted.dupr.bam --reads-file2=$bam_dir/Prdm1KO_Tfh_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Tfh_PKO-Tfh_3 --output-prefix WT-Tfh_PKO-Tfh_3
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep1_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Bcl6KO_Th1_rep1_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep1.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_1 --output-prefix WT-Th1_BKO-Th1_1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep2_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Bcl6KO_Th1_rep2_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep2.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_2 --output-prefix WT-Th1_BKO-Th1_2 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep3_fp_mpbs.bed --mpbs-file2=$mpbs_dir/Bcl6KO_Th1_rep3_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep3.sorted.dupr.bam --reads-file2=$bam_dir/Bcl6KO_Th1_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_BKO-Th1_3 --output-prefix WT-Th1_BKO-Th1_3
wait
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep1_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Th1_rep1_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep1.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep1.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_1 --output-prefix WT-Th1_DKO-Th1_1 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep2_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Th1_rep2_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep2.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep2.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_2 --output-prefix WT-Th1_DKO-Th1_2 &
rgt-hint differential --organism=mm10 --output-profiles --nc=2 --mpbs-file1=$mpbs_dir/WT_Th1_rep3_fp_mpbs.bed --mpbs-file2=$mpbs_dir/DKO_Th1_rep3_fp_mpbs.bed --reads-file1=$bam_dir/WT_Th1_rep3.sorted.dupr.bam --reads-file2=$bam_dir/DKO_Th1_rep3.sorted.dupr.bam --output-location=$wk_dir/WT-Th1_DKO-Th1_3 --output-prefix WT-Th1_DKO-Th1_3