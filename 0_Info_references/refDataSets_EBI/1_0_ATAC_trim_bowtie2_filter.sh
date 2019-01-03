#!/bin/bash
#PBS -l nodes=1:ppn=16
#PBS -l mem=30gb
#PBS -t 0-11

INDIR=/gpfs/home/hdiao/jycATAC/Teichmann/ATAC
cd $INDIR

### Load modules
module load trimgalore
module load bowtie2
module load samtools
module load fastqc

### Names
sp_names=(Mouse_Naive_1 Mouse_Naive_2 Mouse_Th2_24h_1 Mouse_Th2_24h_2 Mouse_Th2_2h_1 Mouse_Th2_2h_2 Mouse_Th2_48h_1 Mouse_Th2_48h_2 Mouse_Th2_4h_1 Mouse_Th2_4h_2 Mouse_Th2_72h_1 Mouse_Th2_72h_2)

### Trimming
fastq_end1=$INDIR/${sp_names[$PBS_ARRAYID]}_r1.fastq
fastq_end2=$INDIR/${sp_names[$PBS_ARRAYID]}_r2.fastq
trim_cmd="trim_galore --paired --length 24 --stringency 3 $fastq_end1 $fastq_end2"
$trim_cmd

### Fastqc
trim_fastq_end1=$INDIR/${sp_names[$PBS_ARRAYID]}_r1_val_1.fq
trim_fastq_end2=$INDIR/${sp_names[$PBS_ARRAYID]}_r2_val_2.fq
fastqc $fastq_end1
fastqc $fastq_end2
fastqc $trim_fastq_end1
fastqc $trim_fastq_end2

### Alignment
sam_name=$INDIR/${sp_names[$PBS_ARRAYID]}.sam
#bowtie2_index_human="/gpfs/group/databases/Homo_sapiens/Ensembl/GRCh38/Bowtie2Index/genome"
bowtie2_index_mm10="/gpfs/group/databases/Mus_musculus/UCSC/mm10/Sequence/Bowtie2Index/genome"
bowtie2_cmd_1="bowtie2 -p 16 -x $bowtie2_index_mm10 -X 2000 --fr"
bowtie2_cmd="$bowtie2_cmd_1 -1 $trim_fastq_end1 -2 $trim_fastq_end2 -S $sam_name"
$bowtie2_cmd

### Convert/sort/filter
sam_name=$INDIR/${sp_names[$PBS_ARRAYID]}.sam
bam_name=$INDIR/${sp_names[$PBS_ARRAYID]}.bam
bam_name_srt=$INDIR/${sp_names[$PBS_ARRAYID]}_srt.bam
bam_name_srt_dupr=$INDIR/${sp_names[$PBS_ARRAYID]}_srt_dupr.bam

samtools view -bS $sam_name > $bam_name
samtools sort $bam_name -o $bam_name_srt
samtools rmdup -S $bam_name_srt $bam_name_srt_dupr