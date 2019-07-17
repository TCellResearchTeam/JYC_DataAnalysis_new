#!/bin/bash
#PBS -l mem=6gb
#PBS -t 0-22

### Motif score calculation: matrix score **0.86
### Combined with Homer Known motifs

wk_dir=/gpfs/group/pipkin/jycATAC/DEseq2/pval-0.05-updn/bed
preparsed_dir=/gpfs/home/hdiao/resources
mm10_genome=/gpfs/group/databases/Mus_musculus/UCSC/mm10/Sequence/Bowtie2Index/genome.fa

cd $wk_dir

export PATH="/gpfs/home/hdiao/homer/bin:$PATH"

sp_names=(Bcl6KO_Th1_vs_Naive Bcl6KO_Th1_vs_WT_Tfh Bcl6KO_Th1_vs_WT_Th1 DKO_Tfh_vs_Naive DKO_Tfh_vs_Prdm1KO_Tfh DKO_Tfh_vs_WT_Tfh DKO_Tfh_vs_WT_Th1 DKO_Th1_vs_Bcl6KO_Th1 DKO_Th1_vs_Naive DKO_Th1_vs_WT_Tfh DKO_Th1_vs_WT_Th1 Prdm1KO_Tfh_vs_Naive Prdm1KO_Tfh_vs_WT_Tfh Prdm1KO_Tfh_vs_WT_Th1 STAT4_KO_Tfh_vs_Naive STAT4_KO_Tfh_vs_WT_Tfh STAT4_KO_Tfh_vs_WT_Th1 STAT4_WT_Tfh_vs_Naive STAT4_WT_Tfh_vs_WT_Tfh STAT4_WT_Tfh_vs_WT_Th1 WT_Tfh_vs_Naive WT_Tfh_vs_WT_Th1 WT_Th1_vs_Naive)
bed_name_up=all.df.numx.c5-${sp_names[$PBS_ARRAYID]}-pval-0.05_up.bed
bed_name_dn=all.df.numx.c5-${sp_names[$PBS_ARRAYID]}-pval-0.05_dn.bed
out_name_up=${sp_names[$PBS_ARRAYID]}-pval-0.05_up_cb_mtfs
out_name_dn=${sp_names[$PBS_ARRAYID]}-pval-0.05_dn_cb_mtfs

findMotifsGenome.pl $bed_name_up $mm10_genome $out_name_up -size given -mask -preparsedDir $preparsed_dir -mis 2
findMotifsGenome.pl $bed_name_dn $mm10_genome $out_name_dn -size given -mask -preparsedDir $preparsed_dir -mis 2
