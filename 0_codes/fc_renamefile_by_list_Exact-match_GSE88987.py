#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Fri Aug  4 20:17:40 2017

@author: yolandatiao
"""
#################################################### Import START ####################################################
import os # For changing directory
import glob
from astropy.io import ascii    # For using ascii table to open csv
####################################################  Import END  ####################################################



#################################################### Config START ####################################################
code_dir="/Users/yolandatiao/Desktop/jycATAC/0_codes"
wkdir="/Volumes/Huitian/GSE88987_RNAseq/GSE88987_RNAseq/fastq"

os.chdir(wkdir)
####################################################  Config END  ####################################################



############################################ Self Defined functions START ############################################
def matchinlist(strx,listx):
    found=0
    mch=None
    for i in listx:
        if i in strx:
            found+=1
            mch=i
    if found==1:
        return mch
    elif found==0:
        print "%s Not found!!!" %strx
        return False
    else:
        print "%s Multiple match!!!"%strx
        return False
     
############################################# Self Defined functions END #############################################



##################################################### Main START #####################################################
def renameBYlist(inlist,outlist,filedir):
    print "Complete rename files with matching pattern? (y/n)"
    choice=raw_input()
    if choice=="y":
        #filedir="/Volumes/Huitian/mock"
        #inlist=["foo1","foo2"]
        #outlist=["bar1","bar2"]
        os.chdir(filedir)
        flist=[]
        for file in os.listdir(filedir):
            flist.append(file)
        print flist
        for i in flist:
            if  i in inlist:
                inewname=outlist[inlist.index(i)]
                os.rename(i, inewname)

def renameBYlistreplacement(inlist,outlist,filedir):
    #filedir="/Volumes/Huitian/mock"
    #inlist=["foo1","foo2"]
    #outlist=["bar1","bar2"]
    os.chdir(filedir)
    flist=[]
    for file in os.listdir(filedir):
        flist.append(file)
    print flist
    for i in flist:
        imch=matchinlist(i, inlist)
        if  imch != False:
            inewname=i.replace(imch,outlist[inlist.index(imch)])
            os.rename(i, inewname)
            


metab=ascii.read("/Volumes/Huitian/GSE88987_RNAseq/codes/meta.csv")
print metab.colnames
inputList=list(metab["Run"])
outputList=list(metab["Name"])

print inputList
print outputList
    
renameBYlist(inputList,outputList,wkdir)

        
    
###################################################### Main END ######################################################
