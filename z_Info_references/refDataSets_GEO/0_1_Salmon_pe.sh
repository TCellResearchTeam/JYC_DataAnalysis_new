#!/bin/bash
#PBS -l nodes=1:ppn=16
#PBS -l mem=20gb

cd /gpfs/home/hdiao/jycATAC/GEO_RNA

module load salmon

salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1  SRR6203712_1.fastq -2 SRR6203712_2.fastq -o SRR6203712
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1  SRR6203713_1.fastq -2 SRR6203713_2.fastq -o SRR6203713
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1  SRR6203714_1.fastq -2 SRR6203714_2.fastq -o SRR6203714
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1  SRR6203715_1.fastq -2 SRR6203715_2.fastq -o SRR6203715
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1  SRR6203716_1.fastq -2 SRR6203716_2.fastq -o SRR6203716
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1  SRR6203717_1.fastq -2 SRR6203717_2.fastq -o SRR6203717

quant_file="/gpfs/home/hdiao/jycATAC/GEO_RNA/SRR6203712/quant.sf"
quant_file_size=$(stat --printf=%s $quant_file)
if (( $quant_file_size > 100 ))
then
	rm SRR6203712_1.fastq
	rm SRR6203712_2.fastq
fi

quant_file="/gpfs/home/hdiao/jycATAC/GEO_RNA/SRR6203713/quant.sf"
quant_file_size=$(stat --printf=%s $quant_file)
if (( $quant_file_size > 100 ))
then
	rm SRR6203713_1.fastq
	rm SRR6203713_2.fastq
fi

quant_file="/gpfs/home/hdiao/jycATAC/GEO_RNA/SRR6203714/quant.sf"
quant_file_size=$(stat --printf=%s $quant_file)
if (( $quant_file_size > 100 ))
then
	rm SRR6203714_1.fastq
	rm SRR6203714_2.fastq
fi

quant_file="/gpfs/home/hdiao/jycATAC/GEO_RNA/SRR6203715/quant.sf"
quant_file_size=$(stat --printf=%s $quant_file)
if (( $quant_file_size > 100 ))
then
	rm SRR6203715_1.fastq
	rm SRR6203715_2.fastq
fi

quant_file="/gpfs/home/hdiao/jycATAC/GEO_RNA/SRR6203716/quant.sf"
quant_file_size=$(stat --printf=%s $quant_file)
if (( $quant_file_size > 100 ))
then
	rm SRR6203716_1.fastq
	rm SRR6203716_2.fastq
fi

quant_file="/gpfs/home/hdiao/jycATAC/GEO_RNA/SRR6203717/quant.sf"
quant_file_size=$(stat --printf=%s $quant_file)
if (( $quant_file_size > 100 ))
then
	rm SRR6203717_1.fastq
	rm SRR6203717_2.fastq
fi



