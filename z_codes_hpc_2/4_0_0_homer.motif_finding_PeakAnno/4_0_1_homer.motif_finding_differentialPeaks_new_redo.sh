#!/bin/bash
#PBS -l mem=32gb
#PBS -l walltime=24:00:00
#PBS -q sata

module load homer

wk_dir=/gpfs/home/hdiao/jycATAC/GEO_ATAC/codes
preparsed_dir=/gpfs/home/hdiao/resources
mm10_genome=/gpfs/group/databases/Mus_musculus/UCSC/mm10/Sequence/WholeGenomeFasta/genome.fa
scratch=/scratch_sata_output/hdiao

cd $scratch
rm -rf $scratch/*

jyc_motif_all=/gpfs/home/hdiao/jycATAC/GEO_ATAC/codes/Jinyong_mouse_0.86_homerknown.mtf
annotatePeaks.pl  $wk_dir/jycATAC_merged_peaksah $mm10_genome -m $jyc_motif_all >  $wk_dir/jycATAC_merged_peaksah.jycmtfANNO
rm -rf $scratch/*
