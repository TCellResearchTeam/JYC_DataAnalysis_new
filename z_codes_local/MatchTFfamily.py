#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun May 26 20:57:10 2019

@author: yolandatiao
"""

########## Match TF family ##########
# Author: Huitian (Yolanda) Diao
# May 26th
# Python 3.7

### Updated on May 24th, 2019
# Loosen motif selection cutoff to include more motifs (Maf, gata...)

########## Import ##########
import os # For changing directory
import csv # For using csv writer
from astropy.io import ascii # For using ascii table to open csv
from astropy.table import Table, Column, join   # For using astropy table functions
import matplotlib.pyplot as plt # For plotting
import pandas as pd # For using pandas in seaborn plot
import numpy as np # For using numpy matrix

########## Self-defined functions ##########
def strInList(strx, listx):
    outlist = []
    for index, i in enumerate(listx):
        if strx in i:
            outlist.append(index)
    return(outlist)

def ann_ref_TF(inFile):
    refFile = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/z_Info_references/MouseTFclassification_noISO_gn.csv"
    outFile = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/z_Info_references/MouseTFclassification_noISO_gn_anno.csv"
    
    with open(refFile, "r") as fin:
        with open(outFile, "w") as fout:
            rfin = csv.reader(fin, delimiter=",")
            wfout = csv.writer(fout, delimiter=",")
            header = next(rfin)
            wfout.writerow(header + ["altname"])
            for row in rfin:
                
    






def anno_family(refFile, inFile):
    inFile = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/x_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/all_sig_motifs.csv"
    outName = inFile.replace(".csv", "_TFfamilyMatched.csv")
    refFile = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/z_Info_references/MouseTFclassification_noISO_gn.csv"
    


    

##########---------- Match motifs to families and find consensus motifs
wkdir = "/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/x_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs"
os.chdir(wkdir)







