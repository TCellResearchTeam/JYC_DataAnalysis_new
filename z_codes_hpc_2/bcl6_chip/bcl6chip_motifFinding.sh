#!/bin/bash
#PBS -l mem=6gb
#PBS -t 0-4

### Motif score calculation: matrix score **0.86
### Combined with Homer Known motifs

wk_dir=/gpfs/home/hdiao/jycATAC/GEO_ATAC/codes/bcl6_chip
preparsed_dir=/gpfs/home/hdiao/resources
mm10_genome=/gpfs/group/databases/Mus_musculus/UCSC/mm10/Sequence/Bowtie2Index/genome.fa

cd $wk_dir

export PATH="/gpfs/home/hdiao/homer/bin:$PATH"

sp_names=(BCL6_TFHpeaklist_sorted_sc BCL6_TFHpeaklist_sorted_sc_no BCL6_TFHpeaklist_sorted_sc_yes BCL6_TFHpeaklist_sorted_sc_yes_minus BCL6_TFHpeaklist_sorted_sc_yes_plus)
bed_name=${sp_names[$PBS_ARRAYID]}.bed
out_name=${sp_names[$PBS_ARRAYID]}_cb_mtfs

findMotifsGenome.pl $bed_name $mm10_genome $out_name -size given -mask -preparsedDir $preparsed_dir -mis 2
