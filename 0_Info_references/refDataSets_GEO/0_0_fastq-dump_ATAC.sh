
#PBS -l nodes=1:ppn=8
#PBS -l mem=16gb

module load sra-tools

cd /gpfs/home/hdiao/jycATAC

# GSE97085_ATAC
fastq-dump --split-files SRR5381021 &
fastq-dump --split-files SRR5381022 &
fastq-dump --split-files SRR5381023 &
fastq-dump --split-files SRR5381024 &

# GSE105808_ATAC
fastq-dump --split-files SRR6203718 &
fastq-dump --split-files SRR6203719 &
fastq-dump --split-files SRR6203720 &
fastq-dump --split-files SRR6203721
wait

# GSE106464_ATAC 
fastq-dump --split-files SRR6248862 &
fastq-dump --split-files SRR6248863 &
fastq-dump --split-files SRR6248864 &
fastq-dump --split-files SRR6248865 &
fastq-dump --split-files SRR6248866 &
fastq-dump --split-files SRR6248867 &
fastq-dump --split-files SRR6248868 &
fastq-dump --split-files SRR6248869
wait
fastq-dump --split-files SRR6248870 &
fastq-dump --split-files SRR6248871 &
fastq-dump --split-files SRR6248872 &
fastq-dump --split-files SRR6248873 &
fastq-dump --split-files SRR6248874 &
fastq-dump --split-files SRR6248875 &
fastq-dump --split-files SRR6248876 &
fastq-dump --split-files SRR6248877
wait
fastq-dump --split-files SRR6248878 &
fastq-dump --split-files SRR6248879 &
fastq-dump --split-files SRR6248880
