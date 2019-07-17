#!/bin/bash
#PBS -l mem=32gb
#PBS -l walltime=36:00:00
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

annotatePeaks.pl  $wk_dir/jycATAC_merged_peaksag $mm10_genome -m $jyc_motif_all >  jycATAC_merged_peaksag.jycmtfANNO
cp jycATAC_merged_peaksag.jycmtfANNO $wk_dir
rm jycATAC_merged_peaksag.jycmtfANNO

annotatePeaks.pl  $wk_dir/jycATAC_merged_peaksai $mm10_genome -m $jyc_motif_all >  jycATAC_merged_peaksai.jycmtfANNO
cp jycATAC_merged_peaksai.jycmtfANNO $wk_dir
rm jycATAC_merged_peaksai.jycmtfANNO

annotatePeaks.pl  $wk_dir/jycATAC_merged_peaksad $mm10_genome -m $jyc_motif_all >  jycATAC_merged_peaksad.jycmtfANNO
cp jycATAC_merged_peaksad.jycmtfANNO $wk_dir
rm jycATAC_merged_peaksad.jycmtfANNO

annotatePeaks.pl  $wk_dir/jycATAC_merged_peaksae $mm10_genome -m $jyc_motif_all >  jycATAC_merged_peaksae.jycmtfANNO
cp jycATAC_merged_peaksae.jycmtfANNO $wk_dir
rm jycATAC_merged_peaksae.jycmtfANNO

annotatePeaks.pl  $wk_dir/jycATAC_merged_peaksah $mm10_genome -m $jyc_motif_all >  jycATAC_merged_peaksah.jycmtfANNO
cp jycATAC_merged_peaksah.jycmtfANNO $wk_dir
rm jycATAC_merged_peaksah.jycmtfANNO

