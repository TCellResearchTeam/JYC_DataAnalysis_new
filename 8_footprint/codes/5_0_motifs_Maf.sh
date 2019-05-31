#!/bin/bash

source_dir=/home/pipkin/Documents/jycATAC/footprint/0_fp
cd $source_dir

Maf_dir=/home/pipkin/Document/jycATAC/footprint/5_mpbs_Maf
MAF_dir=/home/pipkin/Document/jycATAC/footprint/5_mpbs_MAF

### Maf
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files Bcl6KO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files Bcl6KO_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files Bcl6KO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files DKO_Tfh_rep1_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files DKO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files DKO_Tfh_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files DKO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files DKO_Th1_rep2_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files DKO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files Naive_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files Naive_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files Naive_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files Prdm1KO_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files Prdm1KO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files Prdm1KO_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files WT_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files WT_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files WT_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files WT_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files WT_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Maf" --output-location=$Maf_dir --input-files WT_Th1_rep3_fp.bed
wait

### MAF
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files Bcl6KO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files Bcl6KO_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files Bcl6KO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files DKO_Tfh_rep1_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files DKO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files DKO_Tfh_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files DKO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files DKO_Th1_rep2_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files DKO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files Naive_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files Naive_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files Naive_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files Prdm1KO_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files Prdm1KO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files Prdm1KO_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files WT_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files WT_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files WT_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files WT_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files WT_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:MAF" --output-location=$MAF_dir --input-files WT_Th1_rep3_fp.bed

