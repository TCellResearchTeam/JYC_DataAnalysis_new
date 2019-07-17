#!/bin/bash
#PBS -l mem=5gb
#PBS -t 0-20

INDIR=/gpfs/group/pipkin/jycATAC/HTseqCount
cd $INDIR

### Load modules
module load samtools


### Names
file_dir=/gpfs/group/pipkin/jycATAC/sorted_dupr_bam
sp_names=(Bcl6KO_Th1_rep1 Bcl6KO_Th1_rep2 Bcl6KO_Th1_rep3 DKO_Tfh_rep1 DKO_Tfh_rep2 DKO_Tfh_rep3 DKO_Th1_rep1 DKO_Th1_rep2 DKO_Th1_rep3 Naive_rep1 Naive_rep2 Naive_rep3 Prdm1KO_Tfh_rep1 Prdm1KO_Tfh_rep2 Prdm1KO_Tfh_rep3 WT_Tfh_rep1 WT_Tfh_rep2 WT_Tfh_rep3 WT_Th1_rep1 WT_Th1_rep2 WT_Th1_rep3)
bam_name_srt_dupr=$file_dir/${sp_names[$PBS_ARRAYID]}.sorted.dupr.bam 
gff_name=/gpfs/home/hdiao/jycATAC/GEO_ATAC/codes/jycATAC_merged_peaks.gff
out_name=$file_dir/${sp_names[$PBS_ARRAYID]}_Tn5.count
htseq_count=/gpfs/home/hdiao/miniconda2/bin/htseq-count

samtools view $bam_name_srt_dupr | awk '{ if ($9>0) {print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" 9 "M" "\t" $7 "\t" $8 "\t" $9 "\t" $10 "\t" $11 "\t" $12} }' | $htseq_count -i peak_name --type=Peak --stranded=no - $gff_name > $out_name
