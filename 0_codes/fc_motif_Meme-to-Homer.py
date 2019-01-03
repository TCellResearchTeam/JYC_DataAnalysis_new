########## Convert Meme motifs to homer motifs ##########
# Author: Huitian (Yolanda) Diao
# Nov 2nd , 2018
# Python 3.7

########## Import ##########
import os
import csv
from astropy.io import ascii # For using ascii table to open csv
from astropy.table import Table, Column    # For using astropy table functions
import numpy as np # For using numpy matrix
import heapq
import math
import glob
import os.path

########## 0. Read compiled meme motifs file and seperate into individual motifs
'''
def memeSep(infile, outdir):
    os.chdir(outdir)
    with open(infile, "r") as fin:
        rfin = csv.reader(fin, delimiter="\t")
        write_file = False
        for row in rfin:
            if row != []:
                if "MOTIF" in row[0]:
                    write_file = True
                    motif_name = row[0].replace("MOTIF ", "").split("+")[0]
                    out_name = motif_name + ".meme"
                    fout = open(out_name, "w")
                    wfout = csv.writer(fout, delimiter="\t")
                    wfout.writerow(row)
                elif row[0] != "":
                    if write_file:
                        wfout.writerow(row)
                else:
                    if write_file:
                        fout.close()

wk_dir="/Users/yolandatiao/Desktop/jycATAC/codes/Jingyong_mouse_meme"
in_file="/Users/yolandatiao/Desktop/jycATAC/codes/Jinyong_mouse.meme"

memeSep(in_file, wk_dir)
'''

########## 1. Convert meme motif matrix to homer motif matrix
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
        wfout.writerow([">%s"%consensus, motif_name, score**0.86])
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



#os.chdir("/Volumes/Huitian/jycATAC/0_codes/Jingyong_mouse_meme")
#for filepath in glob.glob("*.meme"):
#    memeTohomer(filepath)             
                
                
########## 2. Compile
#for i in *.homer; do cat $i >> Jinyong_mouse.homer.motif; done
            
########## 3. Compare homer known motifs and jyc motifs
#--- Homer known motifs list
'''
wkdir = "/Volumes/Huitian/jycATAC/0_codes/Combined_motifs"
os.chdir(wkdir)
known_motifs_file = "known.motifs"
out_file = "known_motifs_list.csv"
mtf_list = []
with open(known_motifs_file, "r") as fin:
    with open(out_file, "w") as fout:
        rfin = csv.reader(fin, delimiter="\t")
        wfout = csv.writer(fout, delimiter=",")
        for row in rfin:
            if ">" in row[0]:
                mtf = row[1]
                wfout.writerow([mtf])
                mtf_list.append(mtf.split("(")[0].split("/")[0])
   
#--- Delete the motifs that are repeating
wkdir = "/Volumes/Huitian/jycATAC/0_codes/Combined_motifs/Jinyong_mouse_0.86_homerknown"
os.chdir(wkdir)
jyc_mtfs = []
for file in glob.glob("*.motif"):
    jyc_mtfs.append(file)

mtf_list_upper = [x.upper() for x in mtf_list]

repeat_mtfs = []
for mtf in jyc_mtfs:
    if mtf.replace(".motif","").upper() in mtf_list_upper:
        repeat_mtfs.append(mtf)

len(repeat_mtfs)

repeat_folder = "/Volumes/Huitian/jycATAC/0_codes/Combined_motifs/jyc_repeat_motifs/"
for mtf in repeat_mtfs:
    os.rename(mtf, repeat_folder+mtf) 
'''
     

#--- Split all known motifs 
'''
def homerSep(infile, outdir):
    os.chdir(outdir)
    with open(infile, "r") as fin:
        rfin = csv.reader(fin, delimiter="\t")
        write_file = False
        for row in rfin:
            if row != []:
                if ">" in row[0]:
                    write_file = True
                    motif_name =row[1].replace("/", "--").replace("?","").replace("(","_").replace(")","").replace(" ","").replace(":","-")
                    out_name = motif_name + ".motif"
                    if os.path.isfile(outdir + "/" + out_name):
                        print(out_name)
                        out_name = out_name.replace(".motif", "_2.motif")
                    fout = open(out_name, "w")
                    wfout = csv.writer(fout, delimiter="\t")
                    wfout.writerow(row)
                elif row[0] != "":
                    if write_file:
                        wfout.writerow(row)
                else:
                    if write_file:
                        fout.close()

wk_dir="/Volumes/Huitian/jycATAC/0_codes/Combined_motifs/known_motifs"
in_file="/Volumes/Huitian/jycATAC/0_codes/Combined_motifs/known.motifs"

homerSep(in_file, wk_dir)
'''
    
    
#--- Compile
#for i in *.motif; do cat $i >> Jinyong_mouse_0.86_homerknown.mtf; done 
    
    
    
    