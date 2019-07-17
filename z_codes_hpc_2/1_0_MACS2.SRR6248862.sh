#!/bin/bash
#PBS -l mem=25gb

INDIR=/gpfs/home/hdiao/jycATAC/GEO_ATAC/srt_dupr_bam
cd $INDIR

### Load modules
module load macs/2.1.0
module load ucsc_tools

### Names
bam_name_srt_dupr=SRR6248863_srt_dupr.bam
out_name=SRR6248863

### MACS2
macs2 callpeak -t $bam_name_srt_dupr -f BAM -n $out_name --format BAMPE -g mm -p 0.01 --nomodel --shift 100  --extsize 200 -B --SPMR --keep-dup all --call-summits

### Convert
bdg_name=SRR6248863_treat_pileup.bdg
bdg_srt_name=SRR6248863_treat_pileup_srt.bdg
bw_name=SRR6248863.bw
chrom_size="/gpfs/home/hdiao/jycATAC/codes/mm10.chrom.sizes"

### Sort bdg file
LC_COLLATE=C sort -k1,1 -k2,2n $bdg_name > $bdg_srt_name

### Convert
bedGraphToBigWig $bdg_srt_name $chrom_size $bw_name
