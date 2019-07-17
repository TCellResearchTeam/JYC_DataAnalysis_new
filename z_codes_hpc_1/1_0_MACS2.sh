#!/bin/bash
#PBS -l mem=10gb
#PBS -t 0-20

INDIR=/gpfs/home/hdiao/jycATAC/sorted_dupr_bam
cd $INDIR

### Load modules
module load macs/2.1.0

### Names
sp_names=(Bcl6KO_Th1_rep1 Bcl6KO_Th1_rep2 Bcl6KO_Th1_rep3 DKO_Tfh_rep1 DKO_Tfh_rep2 DKO_Tfh_rep3 DKO_Th1_rep1 DKO_Th1_rep2 DKO_Th1_rep3 Naive_rep1 Naive_rep2 Naive_rep3 Prdm1KO_Tfh_rep1 Prdm1KO_Tfh_rep2 Prdm1KO_Tfh_rep3 WT_Tfh_rep1 WT_Tfh_rep2 WT_Tfh_rep3 WT_Th1_rep1 WT_Th1_rep2 WT_Th1_rep3)
bam_name_srt_dupr=$INDIR/${sp_names[$PBS_ARRAYID]}.sorted.dupr.bam
out_name=$INDIR/${sp_names[$PBS_ARRAYID]}

### MACS2
macs2 callpeak -t $bam_name_srt_dupr -f BAM -n $out_name --format BAMPE -g mm -p 0.01 --nomodel --shift 100  --extsize 200 -B --SPMR --keep-dup all --call-summits
