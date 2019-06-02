#!/bin/bash

source_dir=/home/pipkin/Documents/jycATAC/footprint/0_fp
cd $source_dir

Prdm1_dir=/home/pipkin/Documents/jycATAC/footprint/7_mpbs_Prdm1
PRDM1_dir=/home/pipkin/Documents/jycATAC/footprint/7_mpbs_PRDM1

### Prdm1
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files Bcl6KO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files Bcl6KO_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files Bcl6KO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files DKO_Tfh_rep1_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files DKO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files DKO_Tfh_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files DKO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files DKO_Th1_rep2_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files DKO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files Naive_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files Naive_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files Naive_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files Prdm1KO_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files Prdm1KO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files Prdm1KO_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files WT_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files WT_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files WT_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files WT_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files WT_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Prdm1" --output-location=$Prdm1_dir --input-files WT_Th1_rep3_fp.bed
wait

### PRDM1
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files Bcl6KO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files Bcl6KO_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files Bcl6KO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files DKO_Tfh_rep1_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files DKO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files DKO_Tfh_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files DKO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files DKO_Th1_rep2_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files DKO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files Naive_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files Naive_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files Naive_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files PRDM1KO_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files PRDM1KO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files PRDM1KO_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files WT_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files WT_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files WT_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files WT_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files WT_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:PRDM1" --output-location=$PRDM1_dir --input-files WT_Th1_rep3_fp.bed
