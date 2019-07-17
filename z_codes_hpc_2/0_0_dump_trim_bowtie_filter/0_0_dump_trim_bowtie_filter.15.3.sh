#!/bin/bash
#PBS -l mem=50gb
#PBS -l walltime=18:00:00

INDIR=/gpfs/home/hdiao/jycATAC/GEO_ATAC
cd $INDIR

##### Load modules
module load trimgalore
module load bowtie2
module load samtools
module load fastqc
module load sra-tools

##### Names
#---- srr name
#srr_name="SRR6248869"
#fastq-dump --split-files $srr_name

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
#fastq_end1=$INDIR/SRR6248869_1.fastq
#fastq_end2=$INDIR/SRR6248869_2.fastq
#fastqc $fastq_end1
#fastqc $fastq_end2

##### Trimming
#trim_cmd="trim_galore --paired --length 24 --stringency 3 $fastq_end1 $fastq_end2"
#$trim_cmd
#---- If trimming finish, delete fastq files
#trim_fastq_end1=$INDIR/SRR6248869_1_val_1.fq
#trim_fastq_end2=$INDIR/SRR6248869_2_val_2.fq
#out_size=$(stat --printf=%s $trim_fastq_end2)
#if (( $out_size > 1000 ))
#then
#	rm $fastq_end1
#	rm $fastq_end2
#fi

##### Fastqc
#fastqc $trim_fastq_end1
#fastqc $trim_fastq_end2

##### Alignment
#sam_name=SRR6248869.sam
#bowtie2_index_human="/gpfs/group/databases/Homo_sapiens/Ensembl/GRCh38/Bowtie2Index/genome"
#bowtie2_index_mm10="/gpfs/group/databases/Mus_musculus/UCSC/mm10/Sequence/Bowtie2Index/genome"
#bowtie2_cmd_1="bowtie2 -p 16 -x $bowtie2_index_mm10 -X 2000 --fr"
#bowtie2_cmd="$bowtie2_cmd_1 -1 $trim_fastq_end1 -2 $trim_fastq_end2 -S $sam_name"
#$bowtie2_cmd
#----- If alignment complete, delete trimmed fastq files
#out_size=0
#out_size=$(stat --printf=%s $sam_name)
#if (( $out_size > 1000 ))
#then
#	rm $trim_fastq_end1
#	rm $trim_fastq_end2
#fi

##### Convert/sort/filter
bam_name=SRR6248869.bam
bam_name_srt=SRR6248869_srt.bam
bam_name_srt_dupr=SRR6248869_srt_dupr.bam

#samtools view -bS $sam_name > $bam_name
#----- If convert complete, delete sam file
#out_size=0
#out_size=$(stat --printf=%s $bam_name)
#if ((out_size > 1000 ))
#then
#	rm $sam_name
#fi

samtools sort $bam_name -o $bam_name_srt
#----- If sort complete, delete bam file
out_size=0
out_size=$(stat --printf=%s $bam_name_srt)
if ((out_size > 1000 ))
then
	rm $bam_name
fi

samtools rmdup -S $bam_name_srt $bam_name_srt_dupr
#----- If filter complete, delete intermediate files
out_size=0
out_size=$(stat --printf=%s $bam_name_srt_dupr)
if ((out_size > 1000 ))
then
	rm $bam_name_srt
fi
