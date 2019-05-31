#!/usr/bin/env python3
# -*- coding: utf-8 -*-
########## motifHeatMap ##########
# Author: Huitian (Yolanda) Diao
# Nov 7th , 2018
# Python 3.7

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
code_dir="/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap"
os.chdir(code_dir)
import fc_motifHeatMap as fc


#################### Main ####################

#################### Export all knownResults.txt out to the plotting folder ####################
'''
wk_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn-Homer-out"
os.chdir(wk_dir)
file_list = []
for root, dirnames, filenames in os.walk(wk_dir):
    for filename in fnmatch.filter(filenames, 'knownResults.txt'):
        file_list.append(os.path.join(root, filename))
print(file_list)

out_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn-Homer-out/pval-0.05_updn-Homer-out_csv"
for i in file_list:
    outname = i.split("/")[-2] + ".csv"
    in_dir = i.replace("/knownResults.txt", "")
    fc.txt_to_csv(i, outname, in_dir,out_dir)
'''


#################### 20181109 ATAC-seq analysis -- 1 ####################
##########---------- Create motif lists
#--- Make list for _vs_Naive upregulated
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsNaive_updn"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn-Homer-out/pval-0.05_updn-Homer-out_csv"
wt_tfh_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "WT_Tfh_vs_Naive")
prdm1_tfh_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "Prdm1KO_Tfh_vs_Naive")
wt_th1_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "WT_Th1_vs_Naive")
bcl6ko_th1_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "Bcl6KO_Th1_vs_Naive")
dko_th1_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "DKO_Th1_vs_Naive")
dko_tfh_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "DKO_Tfh_vs_Naive")
up_list = [wt_tfh_up, prdm1_tfh_up, wt_th1_up, bcl6ko_th1_up, dko_th1_up, dko_tfh_up]

cutoff = 10
outname = "vsNaive_pval-0.05_up-sig_c%s.csv" %str(cutoff)
fc.comb_sig_list(up_list, outname, cutoff)

cutoff = 25
outname = "vsNaive_pval-0.05_up-sig_c%s.csv" %str(cutoff)
fc.comb_sig_list(up_list, outname, cutoff)
'''

#--- Make list for _vs_Naive downregulated
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsNaive_updn"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn-Homer-out/pval-0.05_updn-Homer-out_csv"
wt_tfh_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "WT_Tfh_vs_Naive")
prdm1_tfh_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "Prdm1KO_Tfh_vs_Naive")
wt_th1_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "WT_Th1_vs_Naive")
bcl6ko_th1_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "Bcl6KO_Th1_vs_Naive")
dko_th1_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "DKO_Th1_vs_Naive")
dko_tfh_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "DKO_Tfh_vs_Naive")
dn_list = [wt_tfh_dn, prdm1_tfh_dn, wt_th1_dn, bcl6ko_th1_dn, dko_th1_dn, dko_tfh_dn]

cutoff = 10
outname = "vsNaive_pval-0.05_dn-sig_c%s.csv" %str(cutoff)
fc.comb_sig_list(dn_list, outname, cutoff)

cutoff = 25
outname = "vsNaive_pval-0.05_dn-sig_c%s.csv" %str(cutoff)
fc.comb_sig_list(dn_list, outname, cutoff)
'''


#--- Make list for _vs_WT Tfh upregulated
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsNaive_updn"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn-Homer-out/pval-0.05_updn-Homer-out_csv"
wt_tfh_vs_wt_th1 = "%s/%s-pval-0.05_up.csv" % (in_dir, "WT_Tfh_vs_WT_Th1")
dko_th1_vs_wt_th1 = "%s/%s-pval-0.05_up.csv" % (in_dir, "DKO_Th1_vs_WT_Th1")
dko_th1_vs_bcl6ko_th1 = "%s/%s-pval-0.05_up.csv" % (in_dir, "DKO_Th1_vs_Bcl6KO_Th1")
dko_tfh_vs_wt_tfh = "%s/%s-pval-0.05_up.csv" % (in_dir, "DKO_Tfh_vs_WT_Tfh")
dko_tfh_vs_prdm1ko_tfh = "%s/%s-pval-0.05_up.csv" % (in_dir, "DKO_Tfh_vs_Prdm1KO_Tfh")
up_list = [wt_tfh_vs_wt_th1, dko_th1_vs_wt_th1, dko_th1_vs_bcl6ko_th1, dko_tfh_vs_wt_tfh, dko_tfh_vs_prdm1ko_tfh]

cutoff = 10
outname = "vsWT-Tfh_pval-0.05_up-sig_c%s.csv" %str(cutoff)
fc.comb_sig_list(up_list, outname, cutoff)

cutoff = 25
outname = "vsWT-Tfh_pval-0.05_up-sig_c%s.csv" %str(cutoff)
fc.comb_sig_list(up_list, outname, cutoff)


#--- Make list for _vs_WT Tfh downregulated

wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsNaive_updn"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn-Homer-out/pval-0.05_updn-Homer-out_csv"
wt_tfh_vs_wt_th1 = "%s/%s-pval-0.05_dn.csv" % (in_dir, "WT_Tfh_vs_WT_Th1")
dko_th1_vs_wt_th1 = "%s/%s-pval-0.05_dn.csv" % (in_dir, "DKO_Th1_vs_WT_Th1")
dko_th1_vs_bcl6ko_th1 = "%s/%s-pval-0.05_dn.csv" % (in_dir, "DKO_Th1_vs_Bcl6KO_Th1")
dko_tfh_vs_wt_tfh = "%s/%s-pval-0.05_dn.csv" % (in_dir, "DKO_Tfh_vs_WT_Tfh")
dko_tfh_vs_prdm1ko_tfh = "%s/%s-pval-0.05_dn.csv" % (in_dir, "DKO_Tfh_vs_Prdm1KO_Tfh")
dn_list = [wt_tfh_vs_wt_th1, dko_th1_vs_wt_th1, dko_th1_vs_bcl6ko_th1, dko_tfh_vs_wt_tfh, dko_tfh_vs_prdm1ko_tfh]

cutoff = 10
outname = "vsWT-Tfh_pval-0.05_dn-sig_c%s.csv" %str(cutoff)
fc.comb_sig_list(dn_list, outname, cutoff)

cutoff = 25
outname = "vsWT-Tfh_pval-0.05_dn-sig_c%s.csv" %str(cutoff)
fc.comb_sig_list(dn_list, outname, cutoff)
'''





##########---------- Make motif heatmap tables
'''
#--- Make table for _vs_Naive upregulated
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsNaive_updn"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn-Homer-out/pval-0.05_updn-Homer-out_csv"
wt_tfh_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "WT_Tfh_vs_Naive")
prdm1_tfh_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "Prdm1KO_Tfh_vs_Naive")
wt_th1_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "WT_Th1_vs_Naive")
bcl6ko_th1_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "Bcl6KO_Th1_vs_Naive")
dko_th1_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "DKO_Th1_vs_Naive")
dko_tfh_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "DKO_Tfh_vs_Naive")
up_list = [wt_tfh_up, prdm1_tfh_up, wt_th1_up, bcl6ko_th1_up, dko_th1_up, dko_tfh_up]

fc.compile_pctg("vsNaive_pval-0.05_up-sig_c10.csv", up_list)
fc.compile_pctg("vsNaive_pval-0.05_up-sig_c25.csv", up_list)

#--- Make table for _vs_Naive downregulated
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsNaive_updn"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn-Homer-out/pval-0.05_updn-Homer-out_csv"
wt_tfh_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "WT_Tfh_vs_Naive")
prdm1_tfh_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "Prdm1KO_Tfh_vs_Naive")
wt_th1_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "WT_Th1_vs_Naive")
bcl6ko_th1_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "Bcl6KO_Th1_vs_Naive")
dko_th1_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "DKO_Th1_vs_Naive")
dko_tfh_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "DKO_Tfh_vs_Naive")
dn_list = [wt_tfh_dn, prdm1_tfh_dn, wt_th1_dn, bcl6ko_th1_dn, dko_th1_dn, dko_tfh_dn]

fc.compile_pctg("vsNaive_pval-0.05_dn-sig_c10.csv", dn_list)
fc.compile_pctg("vsNaive_pval-0.05_dn-sig_c25.csv", dn_list)
'''


#--- Make table for _vs_WT Tfh upregulated
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsNaive_updn"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn-Homer-out/pval-0.05_updn-Homer-out_csv"
wt_tfh_vs_wt_th1 = "%s/%s-pval-0.05_up.csv" % (in_dir, "WT_Tfh_vs_WT_Th1")
dko_th1_vs_wt_th1 = "%s/%s-pval-0.05_up.csv" % (in_dir, "DKO_Th1_vs_WT_Th1")
dko_th1_vs_bcl6ko_th1 = "%s/%s-pval-0.05_up.csv" % (in_dir, "DKO_Th1_vs_Bcl6KO_Th1")
dko_tfh_vs_wt_tfh = "%s/%s-pval-0.05_up.csv" % (in_dir, "DKO_Tfh_vs_WT_Tfh")
dko_tfh_vs_prdm1ko_tfh = "%s/%s-pval-0.05_up.csv" % (in_dir, "DKO_Tfh_vs_Prdm1KO_Tfh")
up_list = [wt_tfh_vs_wt_th1, dko_th1_vs_wt_th1, dko_th1_vs_bcl6ko_th1, dko_tfh_vs_wt_tfh, dko_tfh_vs_prdm1ko_tfh]
fc.compile_pctg("vsWT-Tfh_pval-0.05_up-sig_c10.csv", up_list)
fc.compile_pctg("vsWT-Tfh_pval-0.05_up-sig_c25.csv", up_list)
'''


#--- Make table for _vs_WT Tfh downregulated
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsNaive_updn"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn-Homer-out/pval-0.05_updn-Homer-out_csv"
wt_tfh_vs_wt_th1 = "%s/%s-pval-0.05_dn.csv" % (in_dir, "WT_Tfh_vs_WT_Th1")
dko_th1_vs_wt_th1 = "%s/%s-pval-0.05_dn.csv" % (in_dir, "DKO_Th1_vs_WT_Th1")
dko_th1_vs_bcl6ko_th1 = "%s/%s-pval-0.05_dn.csv" % (in_dir, "DKO_Th1_vs_Bcl6KO_Th1")
dko_tfh_vs_wt_tfh = "%s/%s-pval-0.05_dn.csv" % (in_dir, "DKO_Tfh_vs_WT_Tfh")
dko_tfh_vs_prdm1ko_tfh = "%s/%s-pval-0.05_dn.csv" % (in_dir, "DKO_Tfh_vs_Prdm1KO_Tfh")
dn_list = [wt_tfh_vs_wt_th1, dko_th1_vs_wt_th1, dko_th1_vs_bcl6ko_th1, dko_tfh_vs_wt_tfh, dko_tfh_vs_prdm1ko_tfh]
fc.compile_pctg("vsWT-Tfh_pval-0.05_dn-sig_c10.csv", dn_list)
fc.compile_pctg("vsWT-Tfh_pval-0.05_dn-sig_c25.csv", dn_list)
'''

##########---------- Fine adjustment
#--- _vs_Naive upregulated -- Sort by family
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsNaive_updn"
wt_tfh_up = "WT_Tfh_vs_Naive"
prdm1_tfh_up = "Prdm1KO_Tfh_vs_Naive"
wt_th1_up = "WT_Th1_vs_Naive"
bcl6ko_th1_up = "Bcl6KO_Th1_vs_Naive"
dko_th1_up = "DKO_Th1_vs_Naive"
dko_tfh_up = "DKO_Tfh_vs_Naive"
up_list = [wt_tfh_up, prdm1_tfh_up, dko_tfh_up, wt_th1_up, bcl6ko_th1_up, dko_th1_up]

os.chdir(wkdir)
infile = "vsNaive_pval-0.05_up-sig_c10_heatmap.csv"
outname = infile.replace(".csv","_byfamily.csv")
intab = ascii.read(infile)
intab = fc.setcolnames(intab)
intab = fc.rankByfamily(intab, "WT_Tfh_vs_Naive", up_list)
ascii.write(intab, outname, format="csv", overwrite=True)

os.chdir(wkdir)
infile = "vsNaive_pval-0.05_up-sig_c25_heatmap.csv"
outname = infile.replace(".csv","_byfamily.csv")
intab = ascii.read(infile)
intab = fc.setcolnames(intab)
intab = fc.rankByfamily(intab, "WT_Tfh_vs_Naive", up_list)
ascii.write(intab, outname, format="csv", overwrite=True)
'''


#--- _vs_Naive dowbregulated -- Sort by family
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsNaive_updn"
wt_tfh_dn = "WT_Tfh_vs_Naive"
prdm1_tfh_dn = "Prdm1KO_Tfh_vs_Naive"
wt_th1_dn = "WT_Th1_vs_Naive"
bcl6ko_th1_dn = "Bcl6KO_Th1_vs_Naive"
dko_th1_dn = "DKO_Th1_vs_Naive"
dko_tfh_dn = "DKO_Tfh_vs_Naive"
dn_list = [wt_tfh_dn, prdm1_tfh_dn, dko_tfh_dn, wt_th1_dn, bcl6ko_th1_dn, dko_th1_dn]

os.chdir(wkdir)
infile = "vsNaive_pval-0.05_dn-sig_c10_heatmap.csv"
outname = infile.replace(".csv","_byfamily.csv")
intab = ascii.read(infile)
intab = fc.setcolnames(intab)
intab = fc.rankByfamily(intab, "WT_Tfh_vs_Naive", dn_list)
ascii.write(intab, outname, format="csv", overwrite=True)

os.chdir(wkdir)
infile = "vsNaive_pval-0.05_dn-sig_c25_heatmap.csv"
outname = infile.replace(".csv","_byfamily.csv")
intab = ascii.read(infile)
intab = fc.setcolnames(intab)
intab = fc.rankByfamily(intab, "WT_Tfh_vs_Naive", dn_list)
ascii.write(intab, outname, format="csv", overwrite=True)
'''


#--- _vs_WT Tfh upregulated / downregulated  -- Sort by WT Tfh vs WT Th1
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsNaive_updn"
os.chdir(wkdir)

wt_tfh_vs_wt_th1 =  "WT_Tfh_vs_WT_Th1"
dko_th1_vs_wt_th1 =  "DKO_Th1_vs_WT_Th1"
dko_th1_vs_bcl6ko_th1 =  "DKO_Th1_vs_Bcl6KO_Th1"
dko_tfh_vs_wt_tfh =  "DKO_Tfh_vs_WT_Tfh"
dko_tfh_vs_prdm1ko_tfh =  "DKO_Tfh_vs_Prdm1KO_Tfh"
up_list = [wt_tfh_vs_wt_th1, dko_th1_vs_wt_th1, dko_th1_vs_bcl6ko_th1, dko_tfh_vs_wt_tfh, dko_tfh_vs_prdm1ko_tfh]

infile = "vsWT-Tfh_pval-0.05_up-sig_c10_heatmap.csv"
outname = infile.replace(".csv", "_byWTTfh.csv")
intab = ascii.read(infile)
intab = fc.setcolnames(intab)
intab = fc.rankByfamily(intab, "WT_Tfh_vs_WT_Th1", None)
ascii.write(intab, outname, format="csv", overwrite=True)

infile = "vsWT-Tfh_pval-0.05_up-sig_c25_heatmap.csv"
outname = infile.replace(".csv", "_byWTTfh.csv")
intab = ascii.read(infile)
intab = fc.setcolnames(intab)
intab = fc.rankByfamily(intab, "WT_Tfh_vs_WT_Th1", None)
ascii.write(intab, outname, format="csv", overwrite=True)


infile = "vsWT-Tfh_pval-0.05_dn-sig_c10_heatmap.csv"
outname = infile.replace(".csv", "_byWTTfh.csv")
intab = ascii.read(infile)
intab = fc.setcolnames(intab)
intab = fc.rankByfamily(intab, "WT_Tfh_vs_WT_Th1", None)
ascii.write(intab, outname, format="csv", overwrite=True)



infile = "vsWT-Tfh_pval-0.05_dn-sig_c25_heatmap.csv"
outname = infile.replace(".csv", "_byWTTfh.csv")
intab = ascii.read(infile)
intab = fc.setcolnames(intab)
intab = fc.rankByfamily(intab, "WT_Tfh_vs_WT_Th1", None)
ascii.write(intab, outname, format="csv", overwrite=True)
'''


#################### 20181111 ATAC-seq analysis -- 2 ####################

##########---------- Make ratio heatmap table
#--- Comparing with WT-Tfh v.s. Naive - up
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsWT-Tfh-Naive_updn"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn-Homer-out/pval-0.05_updn-Homer-out_csv"
wt_tfh_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "WT_Tfh_vs_Naive")
prdm1_tfh_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "Prdm1KO_Tfh_vs_Naive")
dko_tfh_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "DKO_Tfh_vs_Naive")
wt_th1_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "WT_Th1_vs_Naive")
bcl6ko_th1_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "Bcl6KO_Th1_vs_Naive")
dko_th1_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "DKO_Th1_vs_Naive")
up_list = [wt_tfh_up, prdm1_tfh_up, dko_tfh_up, wt_th1_up, bcl6ko_th1_up, dko_th1_up]

vs_Naive_up_dir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsNaive_updn"
vs_Naive_up_c10 = "vsNaive_pval-0.05_up-sig_c10.csv"
vs_Naive_up_c25 = "vsNaive_pval-0.05_up-sig_c25.csv"

inlist = "/".join([vs_Naive_up_dir, vs_Naive_up_c10])
fc.compile_diff(inlist, up_list, "WT_Tfh_vs_Naive")

inlist = "/".join([vs_Naive_up_dir, vs_Naive_up_c25])
fc.compile_diff(inlist, up_list, "WT_Tfh_vs_Naive")
'''

#--- Comparing with WT-Tfh v.s. Naive - dn
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsWT-Tfh-Naive_updn"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn-Homer-out/pval-0.05_updn-Homer-out_csv"
wt_tfh_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "WT_Tfh_vs_Naive")
prdm1_tfh_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "Prdm1KO_Tfh_vs_Naive")
dko_tfh_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "DKO_Tfh_vs_Naive")
wt_th1_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "WT_Th1_vs_Naive")
bcl6ko_th1_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "Bcl6KO_Th1_vs_Naive")
dko_th1_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "DKO_Th1_vs_Naive")
dn_list = [wt_tfh_dn, prdm1_tfh_dn, dko_tfh_dn, wt_th1_dn, bcl6ko_th1_dn, dko_th1_dn]

vs_Naive_dn_dir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsNaive_updn"
vs_Naive_dn_c10 = "vsNaive_pval-0.05_dn-sig_c10.csv"
vs_Naive_dn_c25 = "vsNaive_pval-0.05_dn-sig_c25.csv"

inlist = "/".join([vs_Naive_dn_dir, vs_Naive_dn_c10])
fc.compile_diff(inlist, dn_list, "WT_Tfh_vs_Naive")

inlist = "/".join([vs_Naive_dn_dir, vs_Naive_dn_c25])
fc.compile_diff(inlist, dn_list, "WT_Tfh_vs_Naive")
'''


#--- Comparing with WT-Th1 v.s. Naive - up
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsWT-Tfh-Naive_updn"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn-Homer-out/pval-0.05_updn-Homer-out_csv"
wt_tfh_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "WT_Tfh_vs_Naive")
prdm1_tfh_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "Prdm1KO_Tfh_vs_Naive")
dko_tfh_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "DKO_Tfh_vs_Naive")
wt_th1_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "WT_Th1_vs_Naive")
bcl6ko_th1_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "Bcl6KO_Th1_vs_Naive")
dko_th1_up = "%s/%s-pval-0.05_up.csv" % (in_dir, "DKO_Th1_vs_Naive")
up_list = [wt_tfh_up, prdm1_tfh_up, dko_tfh_up, wt_th1_up, bcl6ko_th1_up, dko_th1_up]

vs_Naive_up_dir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsNaive_updn"
vs_Naive_up_c10 = "vsNaive_pval-0.05_up-sig_c10.csv"
vs_Naive_up_c25 = "vsNaive_pval-0.05_up-sig_c25.csv"

inlist = "/".join([vs_Naive_up_dir, vs_Naive_up_c10])
fc.compile_diff(inlist, up_list, "WT_Th1_vs_Naive")

inlist = "/".join([vs_Naive_up_dir, vs_Naive_up_c25])
fc.compile_diff(inlist, up_list, "WT_Th1_vs_Naive")
'''

#--- Comparing with WT-Th1 v.s. Naive - dn
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsWT-Tfh-Naive_updn"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn-Homer-out/pval-0.05_updn-Homer-out_csv"
wt_tfh_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "WT_Tfh_vs_Naive")
prdm1_tfh_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "Prdm1KO_Tfh_vs_Naive")
dko_tfh_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "DKO_Tfh_vs_Naive")
wt_th1_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "WT_Th1_vs_Naive")
bcl6ko_th1_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "Bcl6KO_Th1_vs_Naive")
dko_th1_dn = "%s/%s-pval-0.05_dn.csv" % (in_dir, "DKO_Th1_vs_Naive")
dn_list = [wt_tfh_dn, prdm1_tfh_dn, dko_tfh_dn, wt_th1_dn, bcl6ko_th1_dn, dko_th1_dn]

vs_Naive_dn_dir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsNaive_updn"
vs_Naive_dn_c10 = "vsNaive_pval-0.05_dn-sig_c10.csv"
vs_Naive_dn_c25 = "vsNaive_pval-0.05_dn-sig_c25.csv"

inlist = "/".join([vs_Naive_dn_dir, vs_Naive_dn_c10])
fc.compile_diff(inlist, dn_list, "WT_Th1_vs_Naive")

inlist = "/".join([vs_Naive_dn_dir, vs_Naive_dn_c25])
fc.compile_diff(inlist, dn_list, "WT_Th1_vs_Naive")
'''

##########---------- Sort heatmap tables
#--- Sort by family
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/vsWT-Tfh-Naive_updn"
os.chdir(wkdir)

file_list = []
for file in glob.glob("*Heatmap.csv"):
    file_list.append(file)
print(file_list)

for i in file_list:
    outname = i.replace(".csv", "_byfamily.csv")
    intab = ascii.read(i)
    intab = fc.setcolnames(intab)
    intab = fc.rankByfamily(intab, None, None)
    ascii.write(intab, outname, format="csv", overwrite=True)
'''







#####------------------ Main function END ------------------#####











