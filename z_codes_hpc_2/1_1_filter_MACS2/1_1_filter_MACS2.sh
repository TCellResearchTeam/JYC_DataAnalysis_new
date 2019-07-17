#!/bin/bash
#PBS -l mem=15gb
#PBS -t 0-26

INDIR=/gpfs/home/hdiao/jycATAC/GEO_ATAC/srt_dupr_bam
cd $INDIR

### Load modules
module load macs/2.1.0
module load samtools

### Names
sp_names=(CD4_WT_untreat-1 Flicr_KO_Treg-1 Flicr_KO_Treg-2 Flicr_WT_Treg-1 Flicr_WT_Treg-2 Maf_KO_Th17_EAE-1 Maf_KO_Th17_EAE-2 Maf_KO_Th17_EAE-3 Maf_KO_Th1_Mal-1 Maf_KO_Th1_Mal-2 Maf_KO_Th1_Mal-3 Maf_KO_Th2_HDM-1 Maf_KO_Th2_HDM-2 Maf_KO_Th2_HDM-3 Maf_WT_Th17_EAE-1 Maf_WT_Th17_EAE-2 Maf_WT_Th17_EAE-3 Maf_WT_Th1_Mal-1 Maf_WT_Th1_Mal-2 Maf_WT_Th1_Mal-3 Maf_WT_Th2_HDM-1 Maf_WT_Th2_HDM-2 Maf_WT_Th2_HDM-3 STAT4_KO_Tfh-1 STAT4_KO_Tfh-2 STAT4_WT_Tfh-1 STAT4_WT_Tfh-2)
bam_name_srt_dupr=$INDIR/${sp_names[$PBS_ARRAYID]}_srt_dupr.bam
bam_name_srt_dupr_flt=$INDIR/${sp_names[$PBS_ARRAYID]}_srt_dupr_flt.bam
out_name_flt=$INDIR/${sp_names[$PBS_ARRAYID]}_flt


samtools view -h -b -F 4 $bam_name_srt_dupr | awk \
'{\
	if ($3 ~/chrUn/ || $3 ~/random/) \
		{next} \
	else if ($3!="chrM" && $3!="chrY" && sqrt($9*$9)<150) \
		{print $0} \
}'\
> $bam_name_srt_dupr_flt


### MACS2
macs2 callpeak -t $bam_name_srt_dupr_flt -f BAM -n $out_name_flt --format BAMPE -g mm -p 0.01 --nomodel --shift 100  --extsize 200 -B --SPMR --keep-dup all --call-summits
