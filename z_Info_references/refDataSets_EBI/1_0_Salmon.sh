#!/bin/bash
#PBS -l nodes=1:ppn=16
#PBS -l walltime=48:00:00

cd /gpfs/home/hdiao/jycATAC/Teichmann/RNA

module load salmon


# Use Ensembl mm10

salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1  Mouse_Naive_1_r1.fastq -2 Mouse_Naive_1_r2.fastq  -o Mouse_Naive_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1  Mouse_Naive_2_r1.fastq -2 Mouse_Naive_2_r2.fastq  -o Mouse_Naive_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Naive_3_r1.fastq -2 Mouse_Naive_3_r2.fastq  -o Mouse_Naive_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_05h_1_r1.fastq -2 Mouse_Th0_05h_1_r2.fastq  -o Mouse_Th0_05h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_05h_2_r1.fastq -2 Mouse_Th0_05h_2_r2.fastq  -o Mouse_Th0_05h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_05h_3_r1.fastq -2 Mouse_Th0_05h_3_r2.fastq  -o Mouse_Th0_05h_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_12h_1_r1.fastq -2 Mouse_Th0_12h_1_r2.fastq  -o Mouse_Th0_12h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_12h_2_r1.fastq -2 Mouse_Th0_12h_2_r2.fastq  -o Mouse_Th0_12h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_12h_3_r1.fastq -2 Mouse_Th0_12h_3_r2.fastq  -o Mouse_Th0_12h_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_1h_1_r1.fastq -2 Mouse_Th0_1h_1_r2.fastq  -o Mouse_Th0_1h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_1h_2_r1.fastq -2 Mouse_Th0_1h_2_r2.fastq  -o Mouse_Th0_1h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_1h_3_r1.fastq -2 Mouse_Th0_1h_3_r2.fastq  -o Mouse_Th0_1h_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_24h_1_r1.fastq -2 Mouse_Th0_24h_1_r2.fastq  -o Mouse_Th0_24h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_24h_2_r1.fastq -2 Mouse_Th0_24h_2_r2.fastq  -o Mouse_Th0_24h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_24h_3_r1.fastq -2 Mouse_Th0_24h_3_r2.fastq  -o Mouse_Th0_24h_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_2h_1_r1.fastq -2 Mouse_Th0_2h_1_r2.fastq  -o Mouse_Th0_2h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_2h_2_r1.fastq -2 Mouse_Th0_2h_2_r2.fastq  -o Mouse_Th0_2h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_2h_3_r1.fastq -2 Mouse_Th0_2h_3_r2.fastq  -o Mouse_Th0_2h_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_48h_1_r1.fastq -2 Mouse_Th0_48h_1_r2.fastq  -o Mouse_Th0_48h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_48h_2_r1.fastq -2 Mouse_Th0_48h_2_r2.fastq  -o Mouse_Th0_48h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_48h_3_r1.fastq -2 Mouse_Th0_48h_3_r2.fastq  -o Mouse_Th0_48h_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_4h_1_r1.fastq -2 Mouse_Th0_4h_1_r2.fastq  -o Mouse_Th0_4h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_4h_2_r1.fastq -2 Mouse_Th0_4h_2_r2.fastq  -o Mouse_Th0_4h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_4h_3_r1.fastq -2 Mouse_Th0_4h_3_r2.fastq  -o Mouse_Th0_4h_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_6h_1_r1.fastq -2 Mouse_Th0_6h_1_r2.fastq  -o Mouse_Th0_6h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_6h_2_r1.fastq -2 Mouse_Th0_6h_2_r2.fastq  -o Mouse_Th0_6h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_6h_3_r1.fastq -2 Mouse_Th0_6h_3_r2.fastq  -o Mouse_Th0_6h_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_72h_1_r1.fastq -2 Mouse_Th0_72h_1_r2.fastq  -o Mouse_Th0_72h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_72h_2_r1.fastq -2 Mouse_Th0_72h_2_r2.fastq  -o Mouse_Th0_72h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th0_72h_3_r1.fastq -2 Mouse_Th0_72h_3_r2.fastq  -o Mouse_Th0_72h_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_05h_1_r1.fastq -2 Mouse_Th2_05h_1_r2.fastq  -o Mouse_Th2_05h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_05h_2_r1.fastq -2 Mouse_Th2_05h_2_r2.fastq  -o Mouse_Th2_05h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_05h_3_r1.fastq -2 Mouse_Th2_05h_3_r2.fastq  -o Mouse_Th2_05h_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_12h_1_r1.fastq -2 Mouse_Th2_12h_1_r2.fastq  -o Mouse_Th2_12h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_12h_2_r1.fastq -2 Mouse_Th2_12h_2_r2.fastq  -o Mouse_Th2_12h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_12h_3_r1.fastq -2 Mouse_Th2_12h_3_r2.fastq  -o Mouse_Th2_12h_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_1h_1_r1.fastq -2 Mouse_Th2_1h_1_r2.fastq  -o Mouse_Th2_1h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_1h_2_r1.fastq -2 Mouse_Th2_1h_2_r2.fastq  -o Mouse_Th2_1h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_1h_3_r1.fastq -2 Mouse_Th2_1h_3_r2.fastq  -o Mouse_Th2_1h_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_24h_1_r1.fastq -2 Mouse_Th2_24h_1_r2.fastq  -o Mouse_Th2_24h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_24h_2_r1.fastq -2 Mouse_Th2_24h_2_r2.fastq  -o Mouse_Th2_24h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_24h_3_r1.fastq -2 Mouse_Th2_24h_3_r2.fastq  -o Mouse_Th2_24h_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_2h_1_r1.fastq -2 Mouse_Th2_2h_1_r2.fastq  -o Mouse_Th2_2h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_2h_2_r1.fastq -2 Mouse_Th2_2h_2_r2.fastq  -o Mouse_Th2_2h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_2h_3_r1.fastq -2 Mouse_Th2_2h_3_r2.fastq  -o Mouse_Th2_2h_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_48h_1_r1.fastq -2 Mouse_Th2_48h_1_r2.fastq  -o Mouse_Th2_48h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_48h_2_r1.fastq -2 Mouse_Th2_48h_2_r2.fastq  -o Mouse_Th2_48h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_48h_3_r1.fastq -2 Mouse_Th2_48h_3_r2.fastq  -o Mouse_Th2_48h_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_4h_1_r1.fastq -2 Mouse_Th2_4h_1_r2.fastq  -o Mouse_Th2_4h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_4h_2_r1.fastq -2 Mouse_Th2_4h_2_r2.fastq  -o Mouse_Th2_4h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_4h_3_r1.fastq -2 Mouse_Th2_4h_3_r2.fastq  -o Mouse_Th2_4h_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_6h_1_r1.fastq -2 Mouse_Th2_6h_1_r2.fastq  -o Mouse_Th2_6h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_6h_2_r1.fastq -2 Mouse_Th2_6h_2_r2.fastq  -o Mouse_Th2_6h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_6h_3_r1.fastq -2 Mouse_Th2_6h_3_r2.fastq  -o Mouse_Th2_6h_3
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_72h_1_r1.fastq -2 Mouse_Th2_72h_1_r2.fastq  -o Mouse_Th2_72h_1
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_72h_2_r1.fastq -2 Mouse_Th2_72h_2_r2.fastq  -o Mouse_Th2_72h_2
salmon quant -i /gpfs/home/hdiao/resources/Transcript/Ensembl_5_17_mm10_qusai_salmon_index  -l A -p 16 -1 Mouse_Th2_72h_3_r1.fastq -2 Mouse_Th2_72h_3_r2.fastq  -o Mouse_Th2_72h_3

