#!/bin/bash

### All different Bcl6 motifs
### *0.7

module load homer

wk_dir=/gpfs/home/hdiao/jycATAC/GEO_ATAC/codes/bcl6_chip
preparsed_dir=/gpfs/home/hdiao/resources
mm10_genome=/gpfs/group/databases/Mus_musculus/UCSC/mm10/Sequence/Bowtie2Index/genome.fa
bcl6_mtf_all=/gpfs/home/hdiao/homer/data/knownTFs/all/known.motifs

cd $wk_dir


annotatePeaks.pl  BCL6_TFHpeaklist_sorted_sc.bed $mm10_genome -m $bcl6_mtf_all > BCL6_TFHpeaklist_sorted_sc_bcl60.7ANNO

