#!/bin/bash

source_dir=/home/pipkin/Documents/jycATAC/footprint/0_fp
cd $source_dir

Klf_dir=/home/pipkin/Document/jycATAC/footprint/3_mpbs_Klf
KLF_dir=/home/pipkin/Document/jycATAC/footprint/3_mpbs_KLF

### Klf
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files Bcl6KO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files Bcl6KO_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files Bcl6KO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files DKO_Tfh_rep1_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files DKO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files DKO_Tfh_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files DKO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files DKO_Th1_rep2_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files DKO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files Naive_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files Naive_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files Naive_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files Prdm1KO_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files Prdm1KO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files Prdm1KO_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files WT_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files WT_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files WT_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files WT_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files WT_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:Klf" --output-location=$Klf_dir --input-files WT_Th1_rep3_fp.bed
wait

### KLF
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files Bcl6KO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files Bcl6KO_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files Bcl6KO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files DKO_Tfh_rep1_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files DKO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files DKO_Tfh_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files DKO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files DKO_Th1_rep2_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files DKO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files Naive_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files Naive_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files Naive_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files Prdm1KO_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files Prdm1KO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files Prdm1KO_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files WT_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files WT_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files WT_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files WT_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files WT_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "name:KLF" --output-location=$KLF_dir --input-files WT_Th1_rep3_fp.bed


