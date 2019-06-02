#!/usr/bin/env python2
# -*- coding: utf-8 -*-
########## Slice Bed ##########
# Author: Huitian (Yolanda) Diao
# Nov 1, 2018

########## Import ##########
import os
import csv
import glob
from astropy.io import ascii    # For using ascii table to open csv

def slicebed(refbed, slicefile):
    #slicefile = "/Users/yolandatiao/Desktop/jycATAC/tfh/DEseq2/Prdm1KOvsWT_pval-0.05.csv"
    slicetab = ascii.read(slicefile)
    peaknames = list(slicetab['col1'][1:])
    outfile = slicefile.replace(".csv", ".bed")
    with open(refbed, "r") as fin:
        with open(outfile, "w") as fout:
            rfin = csv.reader(fin, delimiter="\t")
            wfout = csv.writer(fout, delimiter="\t")
            for row in rfin:
                if row[3] in peaknames:
                    peaknames.remove(row[3])
                    wfout.writerow(row)


'''
#wkdir="/Users/yolandatiao/Desktop/jycATAC/DEseq2/pval-0.05"
#wkdir="/Users/yolandatiao/Desktop/jycATAC/DEseq2/pval-0.05-2"
wkdir="/Users/yolandatiao/Desktop/jycATAC/DEseq2/pval-0.05-up"
os.chdir(wkdir)
ref_bed="/Users/yolandatiao/Desktop/jycATAC/codes/jycATAC_merged_peaks.bed"


for in_file in glob.glob("*.csv"):
    print("Start processing %s" %in_file)
    slicebed(ref_bed, in_file)
    print("Finished processing %s \n" %in_file)

wkdir="/Users/yolandatiao/Desktop/jycATAC/DEseq2/pval-0.05-dn"
os.chdir(wkdir)
ref_bed="/Users/yolandatiao/Desktop/jycATAC/codes/jycATAC_merged_peaks.bed"


for in_file in glob.glob("*.csv"):
    print("Start processing %s" %in_file)
    slicebed(ref_bed, in_file)
    print("Finished processing %s \n" %in_file)
'''

wkdir = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/log2fc_selected"
os.chdir(wkdir)

ref_bed = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/0_PreProcess_largeFiles/2_Merged_peaks/jycATAC_merged_peaks.bed"

for file in glob.glob("*.csv"):
    slicebed(ref_bed, file)







