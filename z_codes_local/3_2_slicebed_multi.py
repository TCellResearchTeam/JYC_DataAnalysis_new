#!/usr/bin/env python2
# -*- coding: utf-8 -*-
########## Slice Bed ##########
# Author: Huitian (Yolanda) Diao
# Nov 1, 2018

########## Import ##########
import os
import csv
import glob
from astropy.io import ascii # For using ascii table to open csv
from astropy.table import Table, Column, join   # For using astropy table functions

def slicebed(refbed, slicefile):
    #slicefile = "/Users/yolandatiao/Desktop/jycATAC/tfh/DEseq2/Prdm1KOvsWT_pval-0.05.csv"
    slicetab = ascii.read(slicefile)
    peaknames = list(slicetab['col1'][1:])
    outfile = slicefile.split("/")[-1].replace(".csv", ".bed")
    outfile = refbed.split("/")[-1].replace(".bed", "") + outfile
    with open(refbed, "r") as fin:
        with open(outfile, "w") as fout:
            rfin = csv.reader(fin, delimiter="\t")
            wfout = csv.writer(fout, delimiter="\t")
            for row in rfin:
                if row[3] in peaknames:
                    peaknames.remove(row[3])
                    wfout.writerow(row)

def elementList(strx, listx):
    foundx = False
    for i in listx:
        if i in strx:
            foundx = True
    return foundx

########## Main ##########

'''
#--- Compile transcription factors
tflistdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsNaive_updn"
os.chdir(tflistdir)
tf_list = []
for in_file in glob.glob("*_c25.csv"):
    tf_list.append(in_file)
slt_tfs = []
for tffile in tf_list:
    tftab = ascii.read(tffile)
    slt_tfs += list(tftab["motif_name"])
slt_tfs = list(set(slt_tfs))
slt_tfs_abbr = list(set([x.split("(")[0] for x in slt_tfs]))

#--- Get csv files
upcsvdir = "/Volumes/Huitian/jycATAC/4_DEseq2/pval-0.05-up"
os.chdir(upcsvdir)
upfile_list = []
for in_file in glob.glob("*.csv"):
    upfile_list.append(in_file)
    
dncsvdir = "/Volumes/Huitian/jycATAC/4_DEseq2/pval-0.05-dn"
os.chdir(dncsvdir)
dnfile_list = []
for in_file in glob.glob("*.csv"):
    dnfile_list.append(in_file)

#--- Get bed files
beddir = "/Volumes/Huitian/jycATAC/5_Motif_finding/MTFbed"
os.chdir(beddir)
bed_list = []
for in_file in glob.glob("*.bed"):
    if elementList(in_file, slt_tfs_abbr):
        bed_list.append(in_file)
'''

#--- Run slicebed
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/1_TFcontrolledRegionPathway/up"

for bedfile in bed_list:
    os.chdir(wkdir)
    newbeddir = bedfile.replace(".bed", "")
    os.mkdir(newbeddir)
    os.chdir(newbeddir)
    for csvfile in upfile_list:
        path_bedfile = beddir + "/" + bedfile
        path_csvfile = upcsvdir + "/" + csvfile
        slicebed(path_bedfile, path_csvfile)
'''

'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/1_TFcontrolledRegionPathway/dn"

for bedfile in bed_list:
    os.chdir(wkdir)
    newbeddir = bedfile.replace(".bed", "")
    os.mkdir(newbeddir)
    os.chdir(newbeddir)
    for csvfile in dnfile_list:
        path_bedfile = beddir + "/" + bedfile
        path_csvfile = dncsvdir + "/" + csvfile
        slicebed(path_bedfile, path_csvfile)
'''


###----- Slice bed files with gene group association
upcsvdir = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.05_selected/pval-0.05-up"
os.chdir(upcsvdir)
upfile_list = []
for in_file in glob.glob("*up.csv"):
    if ("Naive" not in in_file) and ("STAT4" not in in_file):
        upfile_list.append(in_file)
    
dncsvdir = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/4_DEseq2/pval-0.05_selected/pval-0.05-dn"
os.chdir(dncsvdir)
dnfile_list = []
for in_file in glob.glob("*dn.csv"):
    if ("Naive" not in in_file) and ("STAT4" not in in_file):
        dnfile_list.append(in_file)

#--- Get bed files
beddir = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/6_GeneGroupMotifAnalysis/byGroup/bed"
os.chdir(beddir)
bed_list = []
for in_file in glob.glob("*.bed"):
    bed_list.append(in_file)
bed_list

#--- Slice
wk_dir = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/6_GeneGroupMotifAnalysis/byGroup_DEseqComparisons"
os.chdir(wk_dir)

for bedfile in bed_list:
    for csvfile in upfile_list:
        os.chdir(wk_dir)
        path_bedfile = beddir + "/" + bedfile
        path_csvfile = upcsvdir + "/" + csvfile
        slicebed(path_bedfile, path_csvfile)
        
for bedfile in bed_list:
    for csvfile in dnfile_list:
        os.chdir(wk_dir)
        path_bedfile = beddir + "/" + bedfile
        path_csvfile = dncsvdir + "/" + csvfile
        slicebed(path_bedfile, path_csvfile)  













