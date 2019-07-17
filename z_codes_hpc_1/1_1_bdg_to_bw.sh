#!/bin/bash
#PBS -l mem=5gb
#PBS -t 0-20

##### Modified the bdg files to match chromosome sizes files. #####

INDIR=/gpfs/home/hdiao/jycATAC/MACS2/pileup_bdg
cd $INDIR

### Load modules
module load ucsc_tools

### Names
sp_names=(Bcl6KO_Th1_rep1 Bcl6KO_Th1_rep2 Bcl6KO_Th1_rep3 DKO_Tfh_rep1 DKO_Tfh_rep2 DKO_Tfh_rep3 DKO_Th1_rep1 DKO_Th1_rep2 DKO_Th1_rep3 Naive_rep1 Naive_rep2 Naive_rep3 Prdm1KO_Tfh_rep1 Prdm1KO_Tfh_rep2 Prdm1KO_Tfh_rep3 WT_Tfh_rep1 WT_Tfh_rep2 WT_Tfh_rep3 WT_Th1_rep1 WT_Th1_rep2 WT_Th1_rep3)
bdg_name=$INDIR/${sp_names[$PBS_ARRAYID]}_treat_pileup.bdg
bdg_srt_name=$INDIR/${sp_names[$PBS_ARRAYID]}_treat_pileup_srt.bdg
bw_name=$INDIR/${sp_names[$PBS_ARRAYID]}.bw
chrom_size="/gpfs/home/hdiao/jycATAC/codes/mm10.chrom.sizes"

### Sort bdg file
LC_COLLATE=C sort -k1,1 -k2,2n $bdg_name > $bdg_srt_name

### Convert
bedGraphToBigWig $bdg_srt_name $chrom_size $bw_name