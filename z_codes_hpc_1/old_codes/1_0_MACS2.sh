# Reference: 
# MACS2: https://github.com/taoliu/MACS/issues/145
# ENCODE: https://github.com/kundajelab/atac_dnase_pipelines/blob/master/modules/callpeak_macs2_atac.bds

module load macs/2.1.0

cd /gpfs/home/hdiao/jycATAC/bam
for in_file in *.bam
do
macs2 callpeak -t $in_file -f BAM -n ${in_file/.sorted.bam/} --format BAMPE -g mm -p 0.01 --nomodel --shift 100  --extsize 200 -B --SPMR --keep-dup all --call-summits
done