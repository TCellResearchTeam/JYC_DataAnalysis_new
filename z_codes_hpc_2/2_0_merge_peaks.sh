#!/bin/bash
#PBS -l mem=50gb

cd /gpfs/home/hdiao/jycATAC/GEO_ATAC/codes

module load homer

mergePeaks -d 200 \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/CD4_WT_untreat-1_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Flicr_KO_Treg-1_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Flicr_KO_Treg-2_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Flicr_WT_Treg-1_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Flicr_WT_Treg-2_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_KO_Th17_EAE-1_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_KO_Th17_EAE-2_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_KO_Th17_EAE-3_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_KO_Th1_Mal-1_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_KO_Th1_Mal-2_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_KO_Th1_Mal-3_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_KO_Th2_HDM-1_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_KO_Th2_HDM-2_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_KO_Th2_HDM-3_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_WT_Th17_EAE-1_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_WT_Th17_EAE-2_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_WT_Th17_EAE-3_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_WT_Th1_Mal-1_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_WT_Th1_Mal-2_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_WT_Th1_Mal-3_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_WT_Th2_HDM-1_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_WT_Th2_HDM-2_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/Maf_WT_Th2_HDM-3_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/STAT4_KO_Tfh-1_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/STAT4_KO_Tfh-2_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/STAT4_WT_Tfh-1_peaks.narrowPeak \
/gpfs/home/hdiao/jycATAC/GEO_ATAC/MACS2/Peak/STAT4_WT_Tfh-2_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/Bcl6KO_Th1_rep1_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/Bcl6KO_Th1_rep2_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/Bcl6KO_Th1_rep3_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/DKO_Tfh_rep1_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/DKO_Tfh_rep2_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/DKO_Tfh_rep3_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/DKO_Th1_rep1_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/DKO_Th1_rep2_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/DKO_Th1_rep3_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/Naive_rep1_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/Naive_rep2_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/Naive_rep3_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/Prdm1KO_Tfh_rep1_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/Prdm1KO_Tfh_rep2_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/Prdm1KO_Tfh_rep3_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/WT_Tfh_rep1_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/WT_Tfh_rep2_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/WT_Tfh_rep3_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/WT_Th1_rep1_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/WT_Th1_rep2_peaks.narrowPeak \
/gpfs/group/pipkin/jycATAC/MACS2/narrowPeak/WT_Th1_rep3_peaks.narrowPeak \
> jycATAC_merged_peaks.txt
