#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Nov  6 18:53:41 2018

@author: yolandatiao
"""


########## fc_pdfprocess ##########
# Author: Huitian (Yolanda) Diao
# Nov 5, 2018
# For processing pdf files...


########## Import ##########
from PyPDF2 import PdfFileWriter, PdfFileReader
import os
import glob



########## Main ##########
def selectPages(infile,selectList):   
    outname = infile.replace(".pdf", "_slt.pdf")
    inpdf = PdfFileReader(infile, 'rb')
    output = PdfFileWriter()
    for i in selectList:
        p = inpdf.getPage(i)
        output.addPage(p)
    with open(outname, 'wb') as fout:
        output.write(fout)
        

wkdir = "/Users/yolandatiao/Desktop/jycATAC/4_DEseq2_bed/genomicFeatures/UpsetVennPie"
os.chdir(wkdir)

filelist = []
for filex in glob.glob("*.pdf"):
    filelist.append(filex)

for filex in filelist:
    selectPages(filex, [1])