#!/bin/bash

source_dir=/home/pipkin/Documents/jycATAC/footprint/0_fp

cd $source_dir

mtf_list=/home/pipkin/Documents/jycATAC/codes/use_motifs_genes.txt

rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files Bcl6KO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files Bcl6KO_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files Bcl6KO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files DKO_Tfh_rep1_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files DKO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files DKO_Tfh_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files DKO_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files DKO_Th1_rep2_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files DKO_Th1_rep3_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files Naive_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files Naive_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files Naive_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files Prdm1KO_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files Prdm1KO_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files Prdm1KO_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files WT_Tfh_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files WT_Tfh_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files WT_Tfh_rep3_fp.bed
wait
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files WT_Th1_rep1_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files WT_Th1_rep2_fp.bed &
rgt-motifanalysis matching --organism=mm10 --filter "gene_names_file:$mtf_list" --input-files WT_Th1_rep3_fp.bed