#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Mon May 29 13:24:15 2017

@author: yolandatiao
"""

#####------------------ Import START ------------------#####
import os # For changing directory
import subprocess # For calling bash 
import csv # For using csv writer
from astropy.io import ascii # For using ascii table to open csv
from astropy.table import Table, Column, join   # For using astropy table functions
import Tkinter,tkFileDialog
import glob
#####------------------ Import END ------------------#####



#####------------------ Config START ------------------#####
code_dir="/Volumes/Huitian/Exp122_169_GSE88987/codes"
#####------------------ Config END ------------------#####

#####------------------ Self Defined functions START ------------------#####
os.chdir(code_dir)
import fc_basic_astropy_subprocess as fc

def intlist(listx):
    outlist=[]
    for i in listx:
        outlist.append(int(i))
    return outlist
#####------------------ Self Defined functions END ------------------#####

#####------------------ Main function START ------------------#####
def slt_open(inputfile,cf):
    inputfile_nf=fc.filenamenoformat(fc.Getfilename(inputfile))
    outputfilename="%s_c%s.csv"%(inputfile_nf, cf)
    with open(outputfilename,"w") as fout:
        wfout=csv.writer(fout, delimiter=",")
        with open(inputfile, "r") as fin:
            rfin=csv.reader(fin, delimiter=",")
            header=next(rfin)
            wfout.writerow(header)
            for row in rfin:
                rown=intlist(row[1:])
                if min(rown) >= cf:
                    wfout.writerow(row)

wkdir="/Volumes/Huitian/Exp122_169_GSE88987/data/9_Motif_finding_10/source"
cutoff=15
os.chdir(wkdir)

filelist=[]
for fname in glob.glob("*.csv"):
    filelist.append(fname)
    
for i in filelist:
    slt_open(i, cutoff)
#####------------------ Main function END ------------------#####