#!/usr/bin/env python2
# -*- coding: utf-8 -*-
########## Write Script for ArrayExpress fastq file combination ##########
# Author: Huitian (Yolanda) Diao
# Oct 19th, 2018
# Dependencies:
#    1. ftp links for files to download
#    2. Ref table

# Reference: Tab-delimited format table
# https://www.ebi.ac.uk/arrayexpress/experiments/E-MTAB-6292/samples/?s_page=1&s_pagesize=250&s_sortby=col_4&s_sortorder=descending


########## Import ##########
import os
import csv
from astropy.io import ascii    # For using ascii table to open csv
from astropy.table import Table, Column    # For using astropy table functions
import numpy as np



########## Define function ##########
def fastqComb(infile, nameList, ftpSourceList):
    #os.chdir("/Users/yolandatiao/Desktop/jycATAC")
    #infile = "E-MTAB-6300.sdrf_ftp.txt"
    #nameList = ftpNameList
    #ftpSourceList = ftpList
    
    outfile = infile.replace(".txt", "_fastqComb.sh")
    ftpUnzipFileList = [i.split("/")[-1].replace(".gz","") for i in ftpSourceList]
    foundList = []
    with open(infile, "r") as fin:
        with open(outfile, "w") as fout:
            rfin = csv.reader(fin, delimiter = ",")
            wfout = csv.writer(fout, delimiter = ",")
            for row in rfin:
                rFile = row[0]
                rIdx = ftpSourceList.index(rFile)
                rName = nameList[rIdx]
                if rName not in foundList:
                    foundList.append(rName)
                    allIdx = [i for i, x in enumerate(nameList) if x == rName]
                    allFile = list(np.array(ftpUnzipFileList)[allIdx])
                    allFile_1 = [allFile[i] for i, x in enumerate(allFile) if "_1" in x]
                    allFile_2 = [allFile[i] for i, x in enumerate(allFile) if "_2" in x]
                    newRow1 = "cat %s > %s_r1.fastq"%(" ".join(allFile_1), rName)
                    newRow2 = "cat %s > %s_r2.fastq"%(" ".join(allFile_2), rName)
                    wfout.writerow(["# File Number %s" %str(len(foundList))])
                    wfout.writerow([newRow1])
                    wfout.writerow([newRow2])
            


########## Main ##########
wkDir = "/Users/yolandatiao/Desktop/jycATAC"
os.chdir(wkDir)

inFile = "E-MTAB-6300.sdrf_ftp.txt"
refFile = "E-MTAB-6300.sdrf.csv"
refTab = ascii.read(refFile, delimiter = ',')
#refTab.columns[0]
ftpList = list(refTab.columns[35])[1:]
ftpNameList = list(refTab.columns[0])[1:]

fastqComb(inFile, ftpNameList, ftpList)


inFile = "E-MTAB-6292.sdrf_ftp.txt"
refFile = "E-MTAB-6292.sdrf.csv"
refTab = ascii.read(refFile, delimiter = ',')
#refTab.columns[0]
ftpList = list(refTab.columns[31])[1:]
ftpNameList = list(refTab.columns[0])[1:]

fastqComb(inFile, ftpNameList, ftpList)



