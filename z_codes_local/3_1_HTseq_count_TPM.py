#!/usr/bin/env python2
# -*- coding: utf-8 -*-
########## HTseq-count TPM ##########
# Author: Huitian (Yolanda) Diao
# Nov 1, 2018
# Dependencies:
#    1. HTseq-count output (sort -t$'\t' -k1,1)
#    2. Gff count output (sort -t$'\t' -k1,1)

########## Import ##########
import os
import csv
import glob

########## Main ##########
def TPMcalc(infile, gffcount):
    outfile = infile.replace(".count", ".rpk")
    with open(infile, "r") as fin1:
        with open(gffcount, "r") as fin2:
            with open(outfile, "w") as fout:
                rfin1 = csv.reader(fin1, delimiter="\t")
                rfin2 = csv.reader(fin2, delimiter="\t")
                wfout = csv.writer(fout, delimiter="\t")
                rowcount = 0
                rpkTotal = 0.0
                for row1 in rfin1:
                    if "Merged-" in row1[0]:
                        rowcount += 1
                        row2 = next(rfin2)
                        if row1[0] == row2[0]:
                            if ("chrM" not in row1[0]) and ("chrUn" not in row1[0]):
                                peakname = row1[0]
                                newnum = float(row1[1])/float(row2[1])*1000
                                rpkTotal += newnum
                                wfout.writerow([peakname, newnum])
                        else:
                            print "Error! Row %s Peaks don't match!!! Count file %s v.s. Gff %s" %(rowcount, row1[0], row2[0])
    msf = rpkTotal/1000000
    outfile2 = infile.replace(".count", ".tpm")
    with open(outfile, "r") as fin:
        with open(outfile2, "w") as fout:
            rfin = csv.reader(fin, delimiter="\t")
            wfout = csv.writer(fout, delimiter="\t")
            for row in rfin:
                rowtpm = float(row[1])/msf
                wfout.writerow([row[0],"%.3f" %rowtpm ])
    

os.chdir("/gpfs/group/pipkin/jycATAC/HTseqCount") 
gff_count_file="/gpfs/home/hdiao/jycATAC/GEO_ATAC/codes/jycATAC_merged_peaks.sizes.srt"

#TPMcalc("Bcl6KO_Th1_rep1_Tn5.srt.count", gff_count_file)
for filepath in glob.glob("*.count"):
    TPMcalc(filepath, gff_count_file)
                        