#!/bin/bash
#PBS -l mem=25gb
#PBS -t 0-26

##### Modified the bdg files to match chromosome sizes files. #####

INDIR=/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/pileup_bdg
cd $INDIR

### Load modules
module load ucsc_tools

### Names
sp_names=(SRR5381021 SRR5381022 SRR5381023 SRR5381024 SRR6203718 SRR6203719 SRR6203720 SRR6203721 SRR6248862 SRR6248864 SRR6248865 SRR6248866 SRR6248867 SRR6248868 SRR6248869 SRR6248870 SRR6248871 SRR6248872 SRR6248873 SRR6248874 SRR6248875 SRR6248876 SRR6248877 SRR6248878 SRR6248879 SRR6248880 SRR6248863)
bdg_name=$INDIR/${sp_names[$PBS_ARRAYID]}_treat_pileup.bdg
bdg_srt_name=$INDIR/${sp_names[$PBS_ARRAYID]}_treat_pileup_srt.bdg
bw_name=$INDIR/${sp_names[$PBS_ARRAYID]}.bw
chrom_size="/gpfs/home/hdiao/jycATAC/codes/mm10.chrom.sizes"

### Sort bdg file
LC_COLLATE=C sort -k1,1 -k2,2n $bdg_name > $bdg_srt_name

### Convert
bedGraphToBigWig $bdg_srt_name $chrom_size $bw_name
