#!/bin/bash

source_dir=/home/pipkin/Documents/jycATAC/footprint/0_fp
cd $source_dir

Gata_dir=/home/pipkin/Document/jycATAC/footprint/4_mpbs_Gata
GATA_dir=/home/pipkin/Document/jycATAC/footprint/4_mpbs_GATA

### Gata
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files Bcl6KO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files Bcl6KO_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files Bcl6KO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files DKO_Tfh_rep1_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files DKO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files DKO_Tfh_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files DKO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files DKO_Th1_rep2_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files DKO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files Naive_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files Naive_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files Naive_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files Prdm1KO_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files Prdm1KO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files Prdm1KO_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files WT_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files WT_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files WT_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files WT_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files WT_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Gata" --output-location=$Gata_dir --input-files WT_Th1_rep3_fp.bed
wait

### GATA
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files Bcl6KO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files Bcl6KO_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files Bcl6KO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files DKO_Tfh_rep1_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files DKO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files DKO_Tfh_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files DKO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files DKO_Th1_rep2_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files DKO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files Naive_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files Naive_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files Naive_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files Prdm1KO_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files Prdm1KO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files Prdm1KO_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files WT_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files WT_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files WT_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files WT_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files WT_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:GATA" --output-location=$GATA_dir --input-files WT_Th1_rep3_fp.bed



