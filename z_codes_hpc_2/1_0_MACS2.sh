#!/bin/bash
#PBS -l mem=25gb
#PBS -t 0-26

INDIR=/gpfs/home/hdiao/jycATAC/GEO_ATAC/srt_dupr_bam
cd $INDIR

### Load modules
module load macs/2.1.0

### Names
sp_names=(SRR5381021 SRR5381022 SRR5381023 SRR5381024 SRR6203718 SRR6203719 SRR6203720 SRR6203721 SRR6248862 SRR6248864 SRR6248865 SRR6248866 SRR6248867 SRR6248868 SRR6248869 SRR6248870 SRR6248871 SRR6248872 SRR6248873 SRR6248874 SRR6248875 SRR6248876 SRR6248877 SRR6248878 SRR6248879 SRR6248880 SRR6248863)
bam_name_srt_dupr=$INDIR/${sp_names[$PBS_ARRAYID]}_srt_dupr.bam
out_name=$INDIR/${sp_names[$PBS_ARRAYID]}

### MACS2
macs2 callpeak -t $bam_name_srt_dupr -f BAM -n $out_name --format BAMPE -g mm -p 0.01 --nomodel --shift 100  --extsize 200 -B --SPMR --keep-dup all --call-summits
