#!/bin/bash
#PBS -l nodes=1:ppn=4
#PBS -l mem=50gb
#PBS -l walltime=36:00:00
#PBS -t 0-2

INDIR=/gpfs/home/hdiao/jycATAC/GEO_ATAC
cd $INDIR

##### Load modules
module load trimgalore
module load bowtie2
module load samtools
module load fastqc
module load sra-tools

##### Names
sp_names=(SRR6248874 SRR6248875 SRR6248876)
#---- srr name
srr_name=${sp_names[$PBS_ARRAYID]}
fastq-dump --split-files $srr_name

##### Wait till finish downloading
#fq_size=0
#fq_size2=$(stat --printf=%s $fastq_end2)
#while (( fq_size != $fq_size2 ))
#do
#	sleep 5
#	size=$size2
#	size2=$(stat --printf=%s $fastq_end2)
#done

##### Fastqc for untrimmed files
fastq_end1=$INDIR/${sp_names[$PBS_ARRAYID]}_1.redo.fastq
fastq_end2=$INDIR/${sp_names[$PBS_ARRAYID]}_2.redo.fastq
fastqc $fastq_end1
fastqc $fastq_end2

##### Trimming
trim_cmd="trim_galore --paired --length 24 --stringency 3 $fastq_end1 $fastq_end2"
$trim_cmd
#---- If trimming finish, delete fastq files
trim_fastq_end1=$INDIR/${sp_names[$PBS_ARRAYID]}_1.redo_val_1.fq
trim_fastq_end2=$INDIR/${sp_names[$PBS_ARRAYID]}_2.redo_val_2.fq
out_size=$(stat --printf=%s $trim_fastq_end2)
if (( $out_size > 1000 ))
then
	rm $fastq_end1
	rm $fastq_end2
fi

##### Fastqc
fastqc $trim_fastq_end1
fastqc $trim_fastq_end2

##### Alignment
sam_name=$INDIR/${sp_names[$PBS_ARRAYID]}.redo.sam
#bowtie2_index_human="/gpfs/group/databases/Homo_sapiens/Ensembl/GRCh38/Bowtie2Index/genome"
bowtie2_index_mm10="/gpfs/group/databases/Mus_musculus/UCSC/mm10/Sequence/Bowtie2Index/genome"
bowtie2_cmd_1="bowtie2 -p 4 -x $bowtie2_index_mm10 -X 2000 --fr"
bowtie2_cmd="$bowtie2_cmd_1 -1 $trim_fastq_end1 -2 $trim_fastq_end2 -S $sam_name"
$bowtie2_cmd
#----- If alignment complete, delete trimmed fastq files
out_size=$(stat --printf=%s $sam_name)
if (( $out_size > 1000 ))
then
	rm $trim_fastq_end1
	rm $trim_fastq_end2
fi

##### Convert/sort/filter
bam_name=$INDIR/${sp_names[$PBS_ARRAYID]}.redo.bam
bam_name_srt=$INDIR/${sp_names[$PBS_ARRAYID]}.redo_srt.bam
bam_name_srt_dupr=$INDIR/${sp_names[$PBS_ARRAYID]}.redo_srt_dupr.bam

samtools view -bS $sam_name > $bam_name
#----- If convert complete, delete intermediate files
out_size=$(stat --printf=%s $bam_name)
if ((out_size > 1000 ))
then
	rm $sam_name
fi

samtools sort $bam_name -o $bam_name_srt
#----- If convert complete, delete intermediate files
out_size=$(stat --printf=%s $bam_name_srt)
if ((out_size > 1000 ))
then
	rm $bam_name
fi

samtools rmdup -S $bam_name_srt $bam_name_srt_dupr
#----- If filter complete, delete intermediate files
out_size=$(stat --printf=%s $bam_name_srt_dupr)
if ((out_size > 1000 ))
then
	rm $bam_name_srt
fi
