########## Slice Bed ##########
# Author: Huitian (Yolanda) Diao
# Nov 1, 2018

########## Import ##########
import os
import csv
import glob
import sys

def slicebed(refbed, slicefile):
    #slicefile = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/log2fc_1_selected/log2fc_1_selected/all.df.numx.c5-Bcl6KO_Th1_vs_WT_Th1-log2fc-1_dn.csv"
    #refbed="/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/log2fc_selected/test.bed"
    peaknames = []
    with open(slicefile, "r") as fin:
        rfin = csv.reader(fin, delimiter=",")
        next(rfin)
        for row in rfin:
            peaknames.append(row[0])
    outfile = slicefile.replace(".csv", ".bed")
    with open(refbed, "r") as fin:
        with open(outfile, "w") as fout:
            rfin = csv.reader(fin, delimiter="\t")
            wfout = csv.writer(fout, delimiter="\t")
            for row in rfin:
                if row[3] in peaknames:
                    peaknames.remove(row[3])
                    wfout.writerow(row)

#slicebed(sys.argv[1], sys.argv[2])


bed_ref="/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/z_codes/jycATAC_merged_peaks.bed"

wk_dir="/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.3-log2fc-0.5_selected"
os.chdir(wk_dir)
for filex in glob.glob("*.csv"):
    slicebed(bed_ref,filex)
