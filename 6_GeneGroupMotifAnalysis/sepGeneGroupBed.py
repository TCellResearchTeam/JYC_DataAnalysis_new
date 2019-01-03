# -*- coding: utf-8 -*-
"""
Created on Tue Nov 20 19:52:28 2018

@author: Yolanda
"""

########## Seperate all_peak bed file by gene groups ##########
# Author: Huitian (Yolanda) Diao
# Nov 20, 2018

########## Dependencies ##########
# 1. ChIPSeeker: Annotate all peak bed file
# 2. Homer: Created all peak bed file by merging
# 3. MACS2: Called peaks
# etc..

########## Import ##########
import os
import csv
import glob
from astropy.io import ascii    # For using ascii table to open csv

########## Self defined functions ##########
def sepGeneGroup(infile, geneDict, outBaseName):
    #infile = "/Volumes/Huitian/jycATAC/2_Merged_peaks/test.csv"
    #os.chdir("/Volumes/Huitian/jycATAC/JYC_DataAnalysis/6_GeneGroupMotifAnalysis")
    #geneDict = {"G1":["Secisbp2", "Slco4c1", "Isx"], "G2": ["Nsmce3", "Tyms-ps", "Eva1a"]}
    #outBaseName = "ATAC_peaks.bed"
    geneDictKeys = list(geneDict.keys())
    for key in geneDictKeys:
        outName = key + "--" + outBaseName
        keygenelist = geneDict[key]
        keygenelist = [x.upper() for x in keygenelist]
        with open(outName, "w") as fout:
            with open(infile, "r") as fin:
                wfout = csv.writer(fout, delimiter="\t")
                rfin = csv.reader(fin, delimiter=",")
                next(rfin)
                for row in rfin:
                    rGene = row[19]
                    if rGene.upper() in keygenelist:
                        outrow = [row[0], row[1], row[2], row[5]]
                        wfout.writerow(outrow)

def selectBed(infile, sltList, outBaseName):
    infilename = infile.split("/")[-1].replace(".bed", "")
    outfilename = infilename + "--" + outBaseName + ".bed"
    with open(infile, "r") as fin:
        with open(outfilename, "w") as fout:
            rfin = csv.reader(fin, delimiter="\t")
            wfout = csv.writer(fout, delimiter="\t")
            for row in rfin:
                if row[3] in sltList:
                    wfout.writerow(row)
            
                

#################### Main ####################
#--- Select peaks associated with each group of gene
'''
wkdir = "/Volumes/Huitian/jycATAC/JYC_DataAnalysis/6_GeneGroupMotifAnalysis"
os.chdir(wkdir)

geneSetList = "/Volumes/Huitian/jycATAC/JYC_DataAnalysis/0_Info_references/geneSetList.csv"
geneSetTab = ascii.read(geneSetList)
geneSetTab.colnames

dict_genes = {}
for i in geneSetTab.colnames:
    keyname = i.split(" (")[0].replace(" ","_")
    geneList = list(geneSetTab[i])
    geneList = list(set([x for x in geneList if x != "masked"]))
    dict_genes[keyname] = geneList

all_anno = "/Volumes/Huitian/jycATAC/2_Merged_peaks/jycATAC_merged_peaks.bed.anno.csv"
out_base = "ATAC_peaks.bed"
sepGeneGroup(all_anno, dict_genes, out_base)
'''
#--- Subset peaks that are more accessible in Tfh/Th1 v.s. Naive

DEseqDiffDir = "/Volumes/Huitian/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.05_selected/pval-0.05-up"

Tfh = "all.df.numx.c5-WT_Tfh_vs_Naive-pval-0.05_up.csv"
Prdm1KOTfh = "all.df.numx.c5-Prdm1KO_Tfh_vs_Naive-pval-0.05_up.csv"
DKOTfh = "all.df.numx.c5-DKO_Tfh_vs_Naive-pval-0.05_up.csv"

Th1 = "all.df.numx.c5-WT_Th1_vs_Naive-pval-0.05_up.csv"
Bcl6Th1 = "all.df.numx.c5-Bcl6KO_Th1_vs_Naive-pval-0.05_up.csv"
DKOTh1 = "all.df.numx.c5-DKO_Th1_vs_Naive-pval-0.05_up.csv"

files = [Tfh, Prdm1KOTfh, DKOTfh, Th1, Bcl6Th1, DKOTh1]
files = ["%s/%s"%(DEseqDiffDir, x) for x in files]

peakList = []
for filex in files:
    tabx = ascii.read(filex)
    peakList += list(tabx["col1"][1:])

peakList = list(set(peakList))

wkdir = "/Volumes/Huitian/jycATAC/JYC_DataAnalysis/6_GeneGroupMotifAnalysis/byGroup_bed"
os.chdir(wkdir)

filelist = []
for filex in glob.glob("*.bed"):
    filelist.append(filex)
print(filelist)

for filex in filelist:
    selectBed(filex, peakList, "vsNAVopen")














       