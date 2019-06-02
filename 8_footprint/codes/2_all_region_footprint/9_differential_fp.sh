#!/bin/bash

bam_dir=/home/pipkin/Documents/jycATAC/source

##### Runx
wk_dir=/home/pipkin/Documents/jycATAC/footprint/2_diff_footprint/Runx
mpbs_dir=/home/pipkin/Documents/jycATAC/footprint/1_mpbs/2_mpbs_Runx
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

##### RUNX
wk_dir=/home/pipkin/Documents/jycATAC/footprint/2_diff_footprint/RUNX
mpbs_dir=/home/pipkin/Documents/jycATAC/footprint/1_mpbs/2_mpbs_RUNX
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

##### Klf
wk_dir=/home/pipkin/Documents/jycATAC/footprint/2_diff_footprint/Klf
mpbs_dir=/home/pipkin/Documents/jycATAC/footprint/1_mpbs/3_mpbs_Klf
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



##### KLF
wk_dir=/home/pipkin/Documents/jycATAC/footprint/2_diff_footprint/KLF
mpbs_dir=/home/pipkin/Documents/jycATAC/footprint/1_mpbs/3_mpbs_KLF
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


##### Gata
wk_dir=/home/pipkin/Documents/jycATAC/footprint/2_diff_footprint/Gata
mpbs_dir=/home/pipkin/Documents/jycATAC/footprint/1_mpbs/4_mpbs_Gata
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

##### GATA
wk_dir=/home/pipkin/Documents/jycATAC/footprint/2_diff_footprint/GATA
mpbs_dir=/home/pipkin/Documents/jycATAC/footprint/1_mpbs/4_mpbs_GATA
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

##### Maf
wk_dir=/home/pipkin/Documents/jycATAC/footprint/2_diff_footprint/Maf
mpbs_dir=/home/pipkin/Documents/jycATAC/footprint/1_mpbs/5_mpbs_Maf
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



##### MAF
wk_dir=/home/pipkin/Documents/jycATAC/footprint/2_diff_footprint/MAF
mpbs_dir=/home/pipkin/Documents/jycATAC/footprint/1_mpbs/5_mpbs_MAF
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




	