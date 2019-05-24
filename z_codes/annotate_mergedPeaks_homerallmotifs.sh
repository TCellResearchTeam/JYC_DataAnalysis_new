wk_dir=/Volumes/Huitian/Ref_Genome 
mm10_genome=/Volumes/Huitian/Ref_Genome/UCSC_mm10/WholeGenomeFasta/genome.fa

cd $wk_dir

bed_name=/Users/yolandatiao/Desktop/jycATAC/0_codes/jycATAC_merged_peaks.bed
homer_motif_all=/Users/yolandatiao/Homer/data/homer_knownTFs/all/all.motifs

annotatePeaks.pl $bed_name $mm10_genome -m $homer_motif_all > jycATAC_merged_peaks.homerALL.mtfANNO