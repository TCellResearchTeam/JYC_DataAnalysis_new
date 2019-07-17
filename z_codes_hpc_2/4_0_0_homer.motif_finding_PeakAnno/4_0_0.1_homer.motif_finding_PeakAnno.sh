#!/bin/bash
#PBS -l mem=10gb
#PBS -l walltime=12:00:00
#PBS -q sata

module load homer

wk_dir=/gpfs/home/hdiao/jycATAC/GEO_ATAC/codes
preparsed_dir=/gpfs/home/hdiao/resources
mm10_genome=/gpfs/group/databases/Mus_musculus/UCSC/mm10/Sequence/WholeGenomeFasta/genome.fa
scratch=/scratch_sata_output/hdiao

cd $scratch

jyc_motif_all=/gpfs/home/hdiao/homer/data/knownTFs/all/known.motifs


annotatePeaks.pl  $wk_dir/jycATAC_merged_peaksaf $mm10_genome -m $jyc_motif_all >  jycATAC_merged_peaksaf.jycmtfANNO
cp jycATAC_merged_peaksaf.jycmtfANNO $wk_dir
rm jycATAC_merged_peaksaf.jycmtfANNO

annotatePeaks.pl  $wk_dir/jycATAC_merged_peaksaj $mm10_genome -m $jyc_motif_all >  jycATAC_merged_peaksaj.jycmtfANNO
cp jycATAC_merged_peaksaj.jycmtfANNO $wk_dir
rm jycATAC_merged_peaksaj.jycmtfANNO
