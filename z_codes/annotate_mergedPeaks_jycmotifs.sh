wk_dir=/Volumes/Huitian/Ref_Genome 
mm10_genome=/Volumes/Huitian/Ref_Genome/UCSC_mm10/WholeGenomeFasta/genome.fa

cd $wk_dir

bed_name=/Users/yolandatiao/Desktop/jycATAC/0_codes/jycATAC_merged_peaks.bed
jyc_motif=/Users/yolandatiao/Desktop/jycATAC/0_codes/Jinyong_mouse.homer.motif.2

annotatePeaks.pl $bed_name $mm10_genome -m $jyc_motif > jycATAC_merged_peaks.jycMEME.mtfANNO