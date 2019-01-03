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
wk_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn_cb_mtfs"
os.chdir(wk_dir)
file_list = []
for root, dirnames, filenames in os.walk(wk_dir):
    for filename in fnmatch.filter(filenames, 'knownResults.txt'):
        file_list.append(os.path.join(root, filename))
print(file_list)

out_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn_cb_mtfs_csv"
for i in file_list:
    outname = i.split("/")[-2] + ".csv"
    in_dir = i.replace("/knownResults.txt", "")
    fc.txt_to_csv(i, outname, in_dir,out_dir)
'''


#################### 20181109 ATAC-seq analysis -- 1 ####################
##########---------- Create motif lists
#--- Make list for _vs_Naive upregulated
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn_cb_mtfs_csv"
wt_tfh_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "WT_Tfh_vs_Naive")
prdm1_tfh_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "Prdm1KO_Tfh_vs_Naive")
wt_th1_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "WT_Th1_vs_Naive")
bcl6ko_th1_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "Bcl6KO_Th1_vs_Naive")
dko_th1_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "DKO_Th1_vs_Naive")
dko_tfh_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "DKO_Tfh_vs_Naive")
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
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn_cb_mtfs_csv"
wt_tfh_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "WT_Tfh_vs_Naive")
prdm1_tfh_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "Prdm1KO_Tfh_vs_Naive")
wt_th1_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "WT_Th1_vs_Naive")
bcl6ko_th1_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "Bcl6KO_Th1_vs_Naive")
dko_th1_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "DKO_Th1_vs_Naive")
dko_tfh_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "DKO_Tfh_vs_Naive")
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
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn_cb_mtfs_csv"
wt_tfh_vs_wt_th1 = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "WT_Tfh_vs_WT_Th1")
dko_th1_vs_wt_th1 = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "DKO_Th1_vs_WT_Th1")
dko_th1_vs_bcl6ko_th1 = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "DKO_Th1_vs_Bcl6KO_Th1")
dko_tfh_vs_wt_tfh = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "DKO_Tfh_vs_WT_Tfh")
dko_tfh_vs_prdm1ko_tfh = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "DKO_Tfh_vs_Prdm1KO_Tfh")
up_list = [wt_tfh_vs_wt_th1, dko_th1_vs_wt_th1, dko_th1_vs_bcl6ko_th1, dko_tfh_vs_wt_tfh, dko_tfh_vs_prdm1ko_tfh]

cutoff = 10
outname = "vsWT-Tfh_pval-0.05_up-sig_c%s.csv" %str(cutoff)
fc.comb_sig_list(up_list, outname, cutoff)

cutoff = 25
outname = "vsWT-Tfh_pval-0.05_up-sig_c%s.csv" %str(cutoff)
fc.comb_sig_list(up_list, outname, cutoff)
'''

#--- Make list for _vs_WT Tfh downregulated
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn_cb_mtfs_csv"
wt_tfh_vs_wt_th1 = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "WT_Tfh_vs_WT_Th1")
dko_th1_vs_wt_th1 = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "DKO_Th1_vs_WT_Th1")
dko_th1_vs_bcl6ko_th1 = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "DKO_Th1_vs_Bcl6KO_Th1")
dko_tfh_vs_wt_tfh = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "DKO_Tfh_vs_WT_Tfh")
dko_tfh_vs_prdm1ko_tfh = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "DKO_Tfh_vs_Prdm1KO_Tfh")
dn_list = [wt_tfh_vs_wt_th1, dko_th1_vs_wt_th1, dko_th1_vs_bcl6ko_th1, dko_tfh_vs_wt_tfh, dko_tfh_vs_prdm1ko_tfh]

cutoff = 10
outname = "vsWT-Tfh_pval-0.05_dn-sig_c%s.csv" %str(cutoff)
fc.comb_sig_list(dn_list, outname, cutoff)

cutoff = 25
outname = "vsWT-Tfh_pval-0.05_dn-sig_c%s.csv" %str(cutoff)
fc.comb_sig_list(dn_list, outname, cutoff)
'''

#--- Make Total reference list
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs"
os.chdir(wkdir)

c25_files = []
for file in glob.glob("*c25.csv"):
    c25_files.append(file)
 
total_motifs = []
for file in c25_files:
    tab = ascii.read(file)
    total_motifs += list(tab['motif_name'])
total_motifs = list(set(total_motifs))

outab = Table()
outab['motif_name'] = total_motifs
ascii.write(outab, "all_sig_motifs_c25.csv", format="csv", overwrite=True)
'''


##########---------- Make motif heatmap tables
'''
#--- Make table for _vs_Naive upregulated
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn_cb_mtfs_csv"
wt_tfh_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "WT_Tfh_vs_Naive")
prdm1_tfh_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "Prdm1KO_Tfh_vs_Naive")
wt_th1_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "WT_Th1_vs_Naive")
bcl6ko_th1_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "Bcl6KO_Th1_vs_Naive")
dko_th1_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "DKO_Th1_vs_Naive")
dko_tfh_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "DKO_Tfh_vs_Naive")
up_list = [wt_tfh_up, prdm1_tfh_up, dko_tfh_up, wt_th1_up, bcl6ko_th1_up, dko_th1_up]

mtfs = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/all_sig_motifs_c25.csv"
out_name = "vsNaive-up_all_sig_motifs_c25.csv"
outab = fc.compile_pctg(mtfs, up_list, out_name, False)

outab = fc.match_motifname(outab)
ascii.write(outab, out_name, format="csv", overwrite=True)


#--- Make table for _vs_Naive downregulated

wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn_cb_mtfs_csv"
wt_tfh_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "WT_Tfh_vs_Naive")
prdm1_tfh_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "Prdm1KO_Tfh_vs_Naive")
wt_th1_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "WT_Th1_vs_Naive")
bcl6ko_th1_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "Bcl6KO_Th1_vs_Naive")
dko_th1_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "DKO_Th1_vs_Naive")
dko_tfh_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "DKO_Tfh_vs_Naive")
dn_list = [wt_tfh_dn, prdm1_tfh_dn, dko_tfh_dn, wt_th1_dn, bcl6ko_th1_dn, dko_th1_dn]

mtfs = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/all_sig_motifs_c25.csv"
out_name = "vsNaive-dn_all_sig_motifs_c25.csv"
outab = fc.compile_pctg(mtfs, dn_list, out_name, False)

outab = fc.match_motifname(outab)
ascii.write(outab, out_name, format="csv", overwrite=True)



#--- Make table for _vs_WT Tfh upregulated

wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn_cb_mtfs_csv"
wt_tfh_vs_wt_th1 = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "WT_Tfh_vs_WT_Th1")
dko_th1_vs_wt_th1 = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "DKO_Th1_vs_WT_Th1")
dko_th1_vs_bcl6ko_th1 = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "DKO_Th1_vs_Bcl6KO_Th1")
dko_tfh_vs_wt_tfh = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "DKO_Tfh_vs_WT_Tfh")
dko_tfh_vs_prdm1ko_tfh = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "DKO_Tfh_vs_Prdm1KO_Tfh")
up_list = [wt_tfh_vs_wt_th1, dko_th1_vs_wt_th1, dko_th1_vs_bcl6ko_th1, dko_tfh_vs_wt_tfh, dko_tfh_vs_prdm1ko_tfh]

mtfs = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/all_sig_motifs_c25.csv"
out_name = "vsWTTfh-up_all_sig_motifs_c25.csv"
outab = fc.compile_pctg(mtfs, up_list, out_name, False)

outab = fc.match_motifname(outab)
ascii.write(outab, out_name, format="csv", overwrite=True)



#--- Make table for _vs_WT Tfh downregulated

wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn_cb_mtfs_csv"
wt_tfh_vs_wt_th1 = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "WT_Tfh_vs_WT_Th1")
dko_th1_vs_wt_th1 = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "DKO_Th1_vs_WT_Th1")
dko_th1_vs_bcl6ko_th1 = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "DKO_Th1_vs_Bcl6KO_Th1")
dko_tfh_vs_wt_tfh = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "DKO_Tfh_vs_WT_Tfh")
dko_tfh_vs_prdm1ko_tfh = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "DKO_Tfh_vs_Prdm1KO_Tfh")
dn_list = [wt_tfh_vs_wt_th1, dko_th1_vs_wt_th1, dko_th1_vs_bcl6ko_th1, dko_tfh_vs_wt_tfh, dko_tfh_vs_prdm1ko_tfh]

mtfs = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/all_sig_motifs_c25.csv"
out_name = "vsWTTfh-dn_all_sig_motifs_c25.csv"
outab = fc.compile_pctg(mtfs, dn_list, out_name, False)

outab = fc.match_motifname(outab)
ascii.write(outab, out_name, format="csv", overwrite=True)
'''

##########---------- Fine adjustment
#--- Sort by family
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps"
os.chdir(wkdir)
infile = "vsNaive-up_all_sig_motifs_c25.csv"
outname = infile.replace(".csv","_byfamily.csv")
intab = ascii.read(infile)
intab = fc.setcolnames(intab)
intab = fc.rankByfamily(intab, "WT_Tfh_vs_Naive", None)
ascii.write(intab, outname, format="csv", overwrite=True)

infile = "vsNaive-dn_all_sig_motifs_c25.csv"
outname = infile.replace(".csv","_byfamily.csv")
intab = ascii.read(infile)
intab = fc.setcolnames(intab)
intab = fc.rankByfamily(intab, "WT_Tfh_vs_Naive", None)
ascii.write(intab, outname, format="csv", overwrite=True)

infile = "vsWTTfh-up_all_sig_motifs_c25.csv"
outname = infile.replace(".csv","_byfamily.csv")
intab = ascii.read(infile)
intab = fc.setcolnames(intab)
intab = fc.rankByfamily(intab, "WT_Tfh_vs_WT_Th1", None)
ascii.write(intab, outname, format="csv", overwrite=True)

infile = "vsWTTfh-dn_all_sig_motifs_c25.csv"
outname = infile.replace(".csv","_byfamily.csv")
intab = ascii.read(infile)
intab = fc.setcolnames(intab)
intab = fc.rankByfamily(intab, "WT_Tfh_vs_WT_Th1", None)
ascii.write(intab, outname, format="csv", overwrite=True)
'''

#################### 20181111 ATAC-seq analysis -- 2 ####################

##########---------- Make ratio heatmap table
#--- Comparing with WT-Tfh v.s. Naive - up
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Diff_percentage_Heatmaps"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn_cb_mtfs_csv"
wt_tfh_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "WT_Tfh_vs_Naive")
prdm1_tfh_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "Prdm1KO_Tfh_vs_Naive")
wt_th1_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "WT_Th1_vs_Naive")
bcl6ko_th1_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "Bcl6KO_Th1_vs_Naive")
dko_th1_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "DKO_Th1_vs_Naive")
dko_tfh_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "DKO_Tfh_vs_Naive")
up_list = [wt_tfh_up, prdm1_tfh_up, dko_tfh_up, wt_th1_up, bcl6ko_th1_up, dko_th1_up]


infile = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/all_sig_motifs_c25.csv"
out_comparison = "WT_Tfh_vs_Naive"
out_name = "vs-" + out_comparison + "_up--" + infile.split("/")[-1]
fc.compile_diff(infile, up_list, out_comparison, out_name)
'''

#--- Comparing with WT-Tfh v.s. Naive - dn
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Diff_percentage_Heatmaps"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn_cb_mtfs_csv"
wt_tfh_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "WT_Tfh_vs_Naive")
prdm1_tfh_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "Prdm1KO_Tfh_vs_Naive")
wt_th1_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "WT_Th1_vs_Naive")
bcl6ko_th1_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "Bcl6KO_Th1_vs_Naive")
dko_th1_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "DKO_Th1_vs_Naive")
dko_tfh_dn = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "DKO_Tfh_vs_Naive")
dn_list = [wt_tfh_dn, prdm1_tfh_dn, dko_tfh_dn, wt_th1_dn, bcl6ko_th1_dn, dko_th1_dn]

infile = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/all_sig_motifs_c25.csv"
out_comparison = "WT_Tfh_vs_Naive"
out_name = "vs-" + out_comparison + "_dn--" + infile.split("/")[-1]
fc.compile_diff(infile, dn_list, out_comparison, out_name)
'''

#--- Comparing with WT-Th1 v.s. Naive - up
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Diff_percentage_Heatmaps"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn_cb_mtfs_csv"
wt_tfh_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "WT_Tfh_vs_Naive")
prdm1_tfh_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "Prdm1KO_Tfh_vs_Naive")
dko_tfh_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "DKO_Tfh_vs_Naive")
wt_th1_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "WT_Th1_vs_Naive")
bcl6ko_th1_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "Bcl6KO_Th1_vs_Naive")
dko_th1_up = "%s/%s-pval-0.05_up_cb_mtfs.csv" % (in_dir, "DKO_Th1_vs_Naive")
up_list = [wt_tfh_up, prdm1_tfh_up, dko_tfh_up, wt_th1_up, bcl6ko_th1_up, dko_th1_up]


infile = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/all_sig_motifs_c25.csv"
out_comparison = "WT_Th1_vs_Naive"
out_name = "vs-" + out_comparison + "_up--" + infile.split("/")[-1]
fc.compile_diff(infile, up_list, out_comparison, out_name)
'''

#--- Comparing with WT-Th1 v.s. Naive - dn
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Diff_percentage_Heatmaps"
os.chdir(wkdir)

in_dir = "/Volumes/Huitian/jycATAC/5_Motif_finding/pval-0.05_updn_cb_mtfs_csv"
wt_tfh_up = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "WT_Tfh_vs_Naive")
prdm1_tfh_up = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "Prdm1KO_Tfh_vs_Naive")
dko_tfh_up = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "DKO_Tfh_vs_Naive")
wt_th1_up = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "WT_Th1_vs_Naive")
bcl6ko_th1_up = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "Bcl6KO_Th1_vs_Naive")
dko_th1_up = "%s/%s-pval-0.05_dn_cb_mtfs.csv" % (in_dir, "DKO_Th1_vs_Naive")
dn_list = [wt_tfh_up, prdm1_tfh_up, dko_tfh_up, wt_th1_up, bcl6ko_th1_up, dko_th1_up]


infile = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/all_sig_motifs_c25.csv"
out_comparison = "WT_Th1_vs_Naive"
out_name = "vs-" + out_comparison + "_dn--" + infile.split("/")[-1]
fc.compile_diff(infile, dn_list, out_comparison, out_name)
'''

##########---------- Sort heatmap tables
'''
wkdir = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Diff_percentage_Heatmaps"
os.chdir(wkdir)

file_list = []
for file in glob.glob("*c25.csv"):
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











