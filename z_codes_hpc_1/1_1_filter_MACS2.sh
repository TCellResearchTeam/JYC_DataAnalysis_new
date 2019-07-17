#!/bin/bash
#PBS -l mem=5gb
#PBS -t 0-20

INDIR=/gpfs/group/pipkin/jycATAC/sorted_dupr_bam
cd $INDIR

### Load modules
module load macs/2.1.0
module load samtools

### Names
sp_names=(Bcl6KO_Th1_rep1 Bcl6KO_Th1_rep2 Bcl6KO_Th1_rep3 DKO_Tfh_rep1 DKO_Tfh_rep2 DKO_Tfh_rep3 DKO_Th1_rep1 DKO_Th1_rep2 DKO_Th1_rep3 Naive_rep1 Naive_rep2 Naive_rep3 Prdm1KO_Tfh_rep1 Prdm1KO_Tfh_rep2 Prdm1KO_Tfh_rep3 WT_Tfh_rep1 WT_Tfh_rep2 WT_Tfh_rep3 WT_Th1_rep1 WT_Th1_rep2 WT_Th1_rep3)
bam_name_srt_dupr=$INDIR/${sp_names[$PBS_ARRAYID]}.sorted.dupr.bam 
bam_name_srt_dupr_flt=$INDIR/${sp_names[$PBS_ARRAYID]}.sorted.dupr.flt.bam 
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
