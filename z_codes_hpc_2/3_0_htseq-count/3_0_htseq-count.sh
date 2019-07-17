#!/bin/bash
#PBS -l mem=15gb
#PBS -t 0-26

INDIR=/gpfs/home/hdiao/jycATAC/GEO_ATAC/srt_dupr_bam
WKDIR=/gpfs/group/pipkin/jycATAC/HTseqCount
cd $WKDIR

### Load modules
module load samtools

### Names
sp_names=(CD4_WT_untreat-1 Flicr_KO_Treg-1 Flicr_KO_Treg-2 Flicr_WT_Treg-1 Flicr_WT_Treg-2 Maf_KO_Th17_EAE-1 Maf_KO_Th17_EAE-2 Maf_KO_Th17_EAE-3 Maf_KO_Th1_Mal-1 Maf_KO_Th1_Mal-2 Maf_KO_Th1_Mal-3 Maf_KO_Th2_HDM-1 Maf_KO_Th2_HDM-2 Maf_KO_Th2_HDM-3 Maf_WT_Th17_EAE-1 Maf_WT_Th17_EAE-2 Maf_WT_Th17_EAE-3 Maf_WT_Th1_Mal-1 Maf_WT_Th1_Mal-2 Maf_WT_Th1_Mal-3 Maf_WT_Th2_HDM-1 Maf_WT_Th2_HDM-2 Maf_WT_Th2_HDM-3 STAT4_KO_Tfh-1 STAT4_KO_Tfh-2 STAT4_WT_Tfh-1 STAT4_WT_Tfh-2)
bam_name_srt_dupr=$INDIR/${sp_names[$PBS_ARRAYID]}_srt_dupr.bam
gff_name=/gpfs/home/hdiao/jycATAC/GEO_ATAC/codes/jycATAC_merged_peaks.gff
out_name=$WKDIR/${sp_names[$PBS_ARRAYID]}_Tn5.count
htseq_count=/gpfs/home/hdiao/miniconda2/bin/htseq-count

samtools view $bam_name_srt_dupr | awk '{ if ($9>0) {print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" 9 "M" "\t" $7 "\t" $8 "\t" $9 "\t" $10 "\t" $11 "\t" $12} }' | $htseq_count -i peak_name --type=Peak --stranded=no - $gff_name > $out_name
