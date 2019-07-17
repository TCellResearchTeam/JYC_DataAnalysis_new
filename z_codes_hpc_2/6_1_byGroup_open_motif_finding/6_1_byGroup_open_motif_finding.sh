#!/bin/bash
#PBS -l mem=6gb
#PBS -t 0-5

### Motif score calculation: matrix score **0.86
### Combined with Homer Known motifs

wk_dir=/gpfs/home/hdiao/jycATAC/6_GeneGroupMotifAnalysis/byGroup_open_bed
preparsed_dir=/gpfs/home/hdiao/resources
mm10_genome=/gpfs/group/databases/Mus_musculus/UCSC/mm10/Sequence/Bowtie2Index/genome.fa

cd $wk_dir

export PATH="/gpfs/home/hdiao/homer/bin:$PATH"

sp_names=(Group_I--ATAC_peaks Group_II--ATAC_peaks Group_III--ATAC_peaks Group_IV--ATAC_peaks TFH_Associated--ATAC_peaks TH1_Associated--ATAC_peaks)

bed_name=${sp_names[$PBS_ARRAYID]}--vsNAVopen.bed
out_name=${sp_names[$PBS_ARRAYID]}--vsNAVopen_cb_mtfs

findMotifsGenome.pl $bed_name $mm10_genome $out_name -size given -mask -preparsedDir $preparsed_dir
