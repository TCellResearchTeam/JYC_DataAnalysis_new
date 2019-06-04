#!/usr/bin/env python3
# -*- coding: utf-8 -*-
########## motifHeatMap ##########
# Author: Huitian (Yolanda) Diao
# Nov 7th , 2018
# Python 3.7

### Updated on May 24th, 2019
# Loosen motif selection cutoff to include more motifs (Maf, gata...)

########## Import ##########
import os # For changing directory
import subprocess # For calling bash 
import csv # For using csv writer
from astropy.io import ascii # For using ascii table to open csv
from astropy.table import Table, Column, join   # For using astropy table functions
import glob
import seaborn as sns # For plotting
import matplotlib.pyplot as plt # For plotting
import pandas as pd # For using pandas in seaborn plot
import numpy as np # For using numpy matrix
import fnmatch


#################### Self Defined functions ####################
code_dir="/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/x_Figures_plottingCodes/0_motifHeatMap_genegroup"
os.chdir(code_dir)
import fc_motifHeatMap as fc


#################### Main ####################

#################### Export all knownResults.txt out to the plotting folder ####################
'''
wk_dir = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/5_Motif_finding/2_byGroup_log2fc_mtfs/source"
os.chdir(wk_dir)
file_list = []
for root, dirnames, filenames in os.walk(wk_dir):
    for filename in fnmatch.filter(filenames, 'knownResults.txt'):
        file_list.append(os.path.join(root, filename))
print(file_list)

out_dir = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/5_Motif_finding/2_byGroup_log2fc_mtfs"
for i in file_list:
    outname = i.split("/")[-2] + ".csv"
    in_dir = i.replace("/knownResults.txt", "")
    fc.txt_to_csv(i, outname, in_dir,out_dir)
'''

#################### Compile ####################        

##########---------- Make motif heatmap tables
wkdir = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/x_Figures_plottingCodes/0_motifHeatMap_genegroup"
os.chdir(wkdir)

mtfs = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/x_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/all_sig_motifs_TFfamilyMatched.srt_addBcl6.csv"
in_dir = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/5_Motif_finding/2_byGroup_log2fc_mtfs/csv"

group_list = ["Group_I", "Group_II", "Group_III", "Group_IV", "TFH_Associated", "TH1_Associated"]
for group in group_list:
    up_list = []
    for file in glob.glob("%s/*.csv"%in_dir):
        if "%s__"%group in file:
            if ".up" in file:
                up_list.append(file)
            elif "WT_Tfh_vs_WT_Th1" in file:
                up_list.append(file)
    
    out_name = "%s_up.csv"%group
    outab = fc.compile_pctg(mtfs, up_list, out_name, False) 
    ascii.write(outab, out_name, format="csv", overwrite=True)
    
    dn_list = []
    for file in glob.glob("%s/*.csv"%in_dir):
        if "%s__"%group in file:
            if ".dn" in file:
                dn_list.append(file)
            elif "WT_Tfh_vs_WT_Th1" in file:
                dn_list.append(file)
    
    out_name = "%s_dn.csv"%group
    outab = fc.compile_pctg(mtfs, dn_list, out_name, False) 
    ascii.write(outab, out_name, format="csv", overwrite=True)


###----- Remove duplicates
wkdir = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/x_Figures_plottingCodes/0_motifHeatMap_genegroup/compiled_pctg"
os.chdir(wkdir)
def rmDupRow(inFile):
    outFile = inFile.replace(".csv", "_rmdup.csv")
    with open(inFile, "r") as fin:
        with open(outFile, "w") as fout:
            rfin = csv.reader(fin, delimiter=",")
            wfout = csv.writer(fout, delimiter=",")
            header = next(rfin)
            wfout.writerow(header)
            last_factor = ""
            for row in rfin:
                if ((row[0] != last_factor) and (row[0] != "Hoxa9(Homeobox)")):
                    wfout.writerow(row)
                last_factor = row[0]


for file in glob.glob("*.csv"):
    srtname = file.replace(".csv", ".srt.csv")
    intab = ascii.read(file)
    intab.sort(["superclass", "class", "family", "subfamily", "motif_name"])
    ascii.write(intab, srtname, format="csv", overwrite=True)
    rmDupRow(srtname)









