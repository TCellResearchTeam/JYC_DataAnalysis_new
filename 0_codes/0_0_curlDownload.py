#!/usr/bin/env python2
# -*- coding: utf-8 -*-

########## Curl download ftp ##########
# Author: Huitian (Yolanda) Diao
# Oct 18th, 2018
# Reference: 
# Prerequisite: Text file (".txt") including ftp links to the files to download. One file each row.
# To write bash file for ftp download


########## Import ##########
import os
import csv


########## Define function ##########
def curlFtp(infile):
    outfile = infile.replace(".txt", "_curl.txt")
    with open(infile, "r") as fin:
        with open(outfile, "w") as fout:
            rfin = csv.reader(fin, delimiter = ",")
            wfout = csv.writer(fout, delimiter = ",")
            for row in rfin:
                rowFN = row[0].split("/")[-1]
                newRow = ["curl %s -o %s"%(row[0], rowFN)]
                wfout.writerow(newRow)

########## Main ##########
os.chdir("/Users/yolandatiao/Desktop/jycATAC")
curlFtp("E-MTAB-6292.sdrf_ftp.txt")
curlFtp("E-MTAB-6300.sdrf_ftp.txt")