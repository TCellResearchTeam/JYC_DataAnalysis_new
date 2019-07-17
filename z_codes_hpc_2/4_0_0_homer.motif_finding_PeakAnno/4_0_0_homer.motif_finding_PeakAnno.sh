#!/bin/bash
#PBS -l mem=10gb
#PBS -l walltime=36:00:00
#PBS -q sata

module load homer

wk_dir=/gpfs/home/hdiao/jycATAC/GEO_ATAC/codes
preparsed_dir=/gpfs/home/hdiao/resources
mm10_genome=/gpfs/group/databases/Mus_musculus/UCSC/mm10/Sequence/WholeGenomeFasta/genome.fa
scratch=/scratch_sata_output/hdiao

cd $scratch

jyc_motif_all=/gpfs/home/hdiao/homer/data/knownTFs/all/known.motifs

annotatePeaks.pl  $wk_dir/jycATAC_merged_peaksaa $mm10_genome -m $jyc_motif_all >  jycATAC_merged_peaksaa.jycmtfANNO
cp jycATAC_merged_peaksaa.jycmtfANNO $wk_dir
rm jycATAC_merged_peaksaa.jycmtfANNO

annotatePeaks.pl  $wk_dir/jycATAC_merged_peaksab $mm10_genome -m $jyc_motif_all >  jycATAC_merged_peaksab.jycmtfANNO
cp jycATAC_merged_peaksab.jycmtfANNO $wk_dir
rm jycATAC_merged_peaksab.jycmtfANNO

annotatePeaks.pl  $wk_dir/jycATAC_merged_peaksac $mm10_genome -m $jyc_motif_all >  jycATAC_merged_peaksac.jycmtfANNO
cp jycATAC_merged_peaksac.jycmtfANNO $wk_dir
rm jycATAC_merged_peaksac.jycmtfANNO

annotatePeaks.pl  $wk_dir/jycATad_merged_peaksad $mm10_genome -m $jyc_motif_all >  jycATad_merged_peaksad.jycmtfANNO
cp jycATad_merged_peaksad.jycmtfANNO $wk_dir
rm jycATad_merged_peaksad.jycmtfANNO

annotatePeaks.pl  $wk_dir/jycATae_merged_peaksae $mm10_genome -m $jyc_motif_all >  jycATae_merged_peaksae.jycmtfANNO
cp jycATae_merged_peaksae.jycmtfANNO $wk_dir
rm jycATae_merged_peaksae.jycmtfANNO

annotatePeaks.pl  $wk_dir/jycATaf_merged_peaksaf $mm10_genome -m $jyc_motif_all >  jycATaf_merged_peaksaf.jycmtfANNO
cp jycATaf_merged_peaksaf.jycmtfANNO $wk_dir
rm jycATaf_merged_peaksaf.jycmtfANNO

annotatePeaks.pl  $wk_dir/jycATag_merged_peaksag $mm10_genome -m $jyc_motif_all >  jycATag_merged_peaksag.jycmtfANNO
cp jycATag_merged_peaksag.jycmtfANNO $wk_dir
rm jycATag_merged_peaksag.jycmtfANNO

annotatePeaks.pl  $wk_dir/jycATai_merged_peaksai $mm10_genome -m $jyc_motif_all >  jycATai_merged_peaksai.jycmtfANNO
cp jycATai_merged_peaksai.jycmtfANNO $wk_dir
rm jycATai_merged_peaksai.jycmtfANNO

annotatePeaks.pl  $wk_dir/jycATaj_merged_peaksaj $mm10_genome -m $jyc_motif_all >  jycATaj_merged_peaksaj.jycmtfANNO
cp jycATaj_merged_peaksaj.jycmtfANNO $wk_dir
rm jycATaj_merged_peaksaj.jycmtfANNO
