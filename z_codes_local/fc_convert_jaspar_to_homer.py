#!/usr/bin/env python3
# -*- coding: utf-8 -*-
########## Convert JASPAR to Homer ##########
# Author: Huitian (Yolanda) Diao
# Nov 19th , 2018
# Python 3.7

########## Import ##########
import os
import csv
import heapq
import math
import glob
import os.path
import pandas as pd

########## Self-defined function ##########
def jasparRowNums(rowx):
    #rowx = "A  [191  35   5  30   0   0 446 142 941 642 615 101 189 369 ]"
    newRow = rowx.split("[")[1].replace("]","")
    newList = newRow.split(" ")
    newList = [x for x in newList if x]
    #print(newList)
    return(newList)

def numToProb(listx):
    #listx = ['191', '171', '245', '349']
    listx = [float(x) for x in listx]
    listxsum = sum(listx)
    outlist = []
    for x in listx:
        outlist.append(float(x)/float(listxsum))
    #print(outlist)
    return(outlist)
    
def jasparToMeme(infile):
    #os.chdir("/Volumes/Huitian/jycATAC/0_codes/Jaspar")
    #infile = "/Volumes/Huitian/jycATAC/0_codes/Jaspar/Bcl6+MA0463-1.jaspar"
    outnamebase = infile.split("/")[-1].replace(".jaspar", "")
    outfile = outnamebase + ".meme"
    with open(infile, "r") as fin:
        rfin = csv.reader(fin, delimiter=",")
        listA = next(rfin)[0]
        listB = next(rfin)[0]
        listC = next(rfin)[0]
        listD = next(rfin)[0]
    listA = jasparRowNums(listA)
    listB = jasparRowNums(listB)
    listC = jasparRowNums(listC)
    listD = jasparRowNums(listD)
    inDic = {"A": listA, "C": listB, "G": listC, "T": listD}
    inDf = pd.DataFrame(inDic)
    inDf.T
    inDflist = inDf.values.tolist()
    print(inDflist)
    with open(outfile, "w") as fout:
        wfout = csv.writer(fout, delimiter=" ")
        header1 = ["MOTIF", outnamebase]
        wfout.writerow(header1)
        header2 = ["letter-probability", "matrix:", "alength=", "4", 
                   "w=", len(listA), "nsites=",1, "E=",0]
        wfout.writerow(header2)
        for x in range(0, len(listA)):
            print(inDflist[x])
            numx = inDflist[x]
            pctgx = numToProb(numx)
            wfout.writerow(pctgx)

def getMoreThanHalf(listx):
    #listx = [0.050, 0.172, 0.307,0.471]
    rankx = heapq.nlargest(4, listx)
    prob = rankx[0]
    idxList = [listx.index(rankx[0])]
    nu = 0
    while prob <= 0.5:
        nu += 1
        prob += rankx[nu]
        newIdxList = [i for i,d in enumerate(listx) if d==rankx[nu]]
        print(newIdxList)
        idxList += newIdxList
    return([list(set(idxList)), prob])

# ALPHABET= ACGT
def findChar(listx):
    listx.sort()
    ntcodes = ["A", "C", "G", "T", 
               "R", "Y", "S", "W", "K", "M",
               "B", "D", "H", "V", "N"]
    ntlists = [[0], [1], [2], [3],
               [0,2], [1,3], [1,2], [0,3], [2,3], [0,1],
               [1,2,3], [0,2,3], [0,1,3], [0,1,2], [0,1,2,3]]
    return(ntcodes[ntlists.index(listx)])
  
    
def memeTohomer(memeMtf):
    #os.chdir("/Users/yolandatiao/Desktop/jycATAC/0_codes")
    #memeMtf = "/Users/yolandatiao/Desktop/jycATAC/0_codes/test.meme.2"
    outName = memeMtf.replace(".meme", ".homer")
    print(memeMtf)
    with open(outName, "w") as fout:
        wfout = csv.writer(fout, delimiter = "\t")
        motif_name = ""
        consensus = ""
        score = 0
        #--- Calculate Header
        with open(memeMtf, "r") as fin:
            rfin = csv.reader(fin, delimiter = " ")
            header = next(rfin)
            motif_name = header[1].split("_")[0]
            next(rfin)
            for row in rfin:
                row = [x for x in row if x]
                row = [float(x) for x in row]
                rowstats = getMoreThanHalf(row)
                print(rowstats)
                rowprobscore = math.log(rowstats[1]/(len(rowstats[0])*0.25))
                #rowprobscore = math.log(max(row)/0.25)
                score += rowprobscore
                consensus += findChar(rowstats[0])
        wfout.writerow([">%s"%consensus, motif_name, score**0.7])
        #print(score)
        #print(score**0.7)
        with open(memeMtf, "r") as fin:
            rfin = csv.reader(fin, delimiter = " ")
            next(rfin)
            next(rfin)
            for row in rfin:
                row = [x for x in row if x]
                row = [float(x) for x in row]
                row = ["%.3f" % x  for x in row]
                wfout.writerow(row)
            
########## Main ##########
os.chdir("/Volumes/Huitian/jycATAC/0_codes/Jaspar_bcl6/Meme")
for filepath in glob.glob("*.jaspar"):
    jasparToMeme(filepath)  
        
for filepath in glob.glob("*.meme"):
    memeTohomer(filepath)        
        
        