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


########## Self Defined functions ##########
# A function to set colnames if colnames can not be read
def setcolnames(table_x):
	old_colnames=table_x.colnames
	if old_colnames[0] == 'col1':
		new_colnames=list(table_x[0])
		table_x.remove_row(0)
		for x in range(0, len(table_x[0])):
			table_x[old_colnames[x]].name=new_colnames[x]
	return table_x

def mtf_abbr(motifname):
    if ("E-box" not in motifname) and ("c-Myc(bHLH)" not in motifname):
        outname=motifname.split("(")[0]
        outname=outname.split("/")[0]
    else:
        outname=motifname.replace("/Homer","")
    return outname

def mtf_abbr_less(motifname):
    if ("E-box" not in motifname) and ("c-Myc(bHLH)" not in motifname):
        outname=motifname.split("/")[0]
    else:
        outname=motifname.replace("/Homer","")
    return outname

def mtf_list_abbr(mtf_list):
    abbr_list=[]
    for ele in mtf_list:
        abbr_list.append(mtf_abbr(ele))
    return abbr_list

def mtf_list_abbr_less(mtf_list):
    abbr_list=[]
    for ele in mtf_list:
        abbr_list.append(mtf_abbr_less(ele))
    return abbr_list

def filename_abbr1(filename):
    filename_list=filename.split('_')
    filename_list_abbr=filename_list[filename_list.index("c5")+1:filename_list.index("pvaluesig0")]
    filename_new="_".join(filename_list_abbr)
    filename_new=filename_new.replace(".csv","")
    filename_new=filename_new.replace("X","")
    if "up" in filename:
        filename_new="%s_up"%filename_new
    elif "dn" in filename:
        filename_new="%s_dn"%filename_new
    return filename_new

def filename_abbr2(filename):
    filename=filename.replace("_mtf","")
    filename=filename.split(".")[0]
    return filename.split("-")[1]
    

def pctg_to_float(list1):
    outlist=[]
    for i in list1:
        outlist.append(float(i[:-1]))
    return outlist

def match_motifname(out_tab):
    ref_file = "/Volumes/Huitian/jycATAC/9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/all_sig_motifs_c25_formatted.csv"
    ref_tab = ascii.read(ref_file)
    ref_oldnames = list(ref_tab["old_name"])
    ref_newnames = list(ref_tab["new_name"])
    outab_motifs = list(out_tab['motif_name'])
    for x in range(0, len(outab_motifs)):
        idx = ref_oldnames.index(outab_motifs[x])
        newx = ref_newnames[idx]
        out_tab['motif_name'][x] = newx
    return(out_tab)
        

########## Main ##########
def txt_to_csv(infile,outname,indir,outdir):
    os.chdir(outdir)
    infile = infile.split("/")[-1]
    outfile = infile.replace(".txt", ".csv")
    infile = "/".join([indir,infile])
    with open(infile, "r") as fin:
        with open(outname, "w") as fout:
            rfin = csv.reader(fin, delimiter="\t")
            wfout = csv.writer(fout,delimiter=",")
            for row in rfin:
                wfout.writerow(row)

###----- Select significantly enriched motifs
#--- pvalue<0.05
#--- Motif name doesn't include SeqBias
#--- Percentage of target > 10%
def comb_sig_list(f_list, outname, pctg_cutoff):
    slt_list=[]
    for i in f_list:
        i_tab=ascii.read(i)
        i_tab=setcolnames(i_tab)
        for row in range(0, len(i_tab)):
            i_row=i_tab[row]
            i_rowname=i_row[0]
            i_rowpvalue=float(i_row[2])
            i_rowpctg=float(i_row[6][:-1])
            i_bg=float(i_row[8][:-1])
            if (("SeqBias" not in i_rowname) and ("Arabidopsis" not in i_rowname) and ("Unknown" not in i_rowname) and ("?" not in i_rowname) and ("GAGA-repeat" not in i_rowname)):
                if i_rowpvalue <= 0.05: #if i_rowpctg >= pctg_cutoff: #if i_rowpctg/i_bg >= 1.5:
                    slt_list.append(mtf_abbr_less(i_rowname))
    slt_list=sorted(list(set(slt_list)))
    slt_tab=Table()
    slt_tab["motif_name"]=slt_list
    ascii.write(slt_tab, outname, format="csv", overwrite="True")

def single_sig_list(file_i, outname, pctg_cutoff):
    i_tab=ascii.read(file_i)
    i_tab=setcolnames(i_tab)
    slt_list=[]
    nonabbr_slt_list=[]
    for row in range(0, len(i_tab)):
        i_row=i_tab[row]
        i_rowname=i_row[0]
        i_rowpvalue=float(i_row[2])
        i_rowpctg=float(i_row[6][:-1])
        i_bg=float(i_row[8][:-1])
        if (("SeqBias" not in i_rowname) and ("Arabidopsis" not in i_rowname) and ("Unknown" not in i_rowname) and ("?" not in i_rowname) and ("GAGA-repeat" not in i_rowname) and ("Initiator" not in i_rowname)):
            if i_rowpvalue <= 0.05:
                if i_rowpctg >= pctg_cutoff:
                    if i_rowpctg/i_bg >= 1.5:
                        slt_list.append(mtf_abbr_less(i_rowname))
                        nonabbr_slt_list.append(i_rowname)
    slt_list=sorted(list(set(slt_list)))
    nonabbr_slt_list=sorted(list(set(nonabbr_slt_list)))
    slt_tab=Table()
    slt_tab["motif_name"]=slt_list
    slt_tab["motif_fullname"]=nonabbr_slt_list
    ascii.write(slt_tab, outname, format="csv", overwrite="True")
    return slt_tab

def compile_pctg(input_file, files_list, outfile, write_tab=True):
    intab = ascii.read(input_file)
    intab = setcolnames(intab)
    #outfile = input_file.replace(".csv","_heatmap.csv")
    for i in files_list:
        abbri = i.split("/")[-1].replace(".csv","").replace("-pval-0.05","").replace("_dn","").replace("_up","").replace("_cb_mtfs","")
        abbri = abbri.replace("all.df.numx.c5-", "").replace("_mtfs","").replace("Group_","")
        abbri = abbri.replace("IV__","").replace("III__","").replace("II__","").replace("I__","").replace("TFH_Associated__","").replace("TH1_Associated__","")
        tabi = ascii.read(i)
        tabi_new=Table()
        tabi_new['motif_name']=mtf_list_abbr_less(list(tabi.columns[0]))
        tabi_new[abbri]=pctg_to_float(list(tabi.columns[6]))
        intab = join(intab,tabi_new,keys="motif_name", join_type="left")
        #print(tabi_new)
    if write_tab:
        ascii.write(intab, outfile, format="csv", overwrite=True)
    return(intab)


def rankByfamily(intab, sortCol, newOrder):
    intab["fam"] = [x.split("(")[1].replace(")","") for x in list(intab["motif_name"])]
    if sortCol != None:
        intab.sort(["fam", sortCol])
    else:
        intab.sort(["fam"])
    intab.reverse()
    newtab = Table()
    newtab["motif_name"] = intab["motif_name"]
    if newOrder != None:
        for x in range(0, len(newOrder)):
            newtab[newOrder[x]] = intab[newOrder[x]]
    else:
        for i in intab.colnames:
            newtab[i] = intab[i]
        del newtab["fam"]
    return newtab


def compile_diff(input_file, files_list, base_col, outfile):
    intab = ascii.read(input_file)
    intab = setcolnames(intab)
    if outfile == None:
        outfile = input_file.split("/")[-1].replace(".csv","-%s_diffHeatmap.csv" %base_col)
    for i in files_list:
        abbri = i.split("/")[-1].replace(".csv","").replace("-pval-0.05","").replace("_dn","").replace("_up","").replace("_cb_mtfs","")
        tabi = ascii.read(i)
        tabi_new=Table()
        tabi_new['motif_name']=mtf_list_abbr_less(list(tabi.columns[0]))
        tabi_new[abbri]=pctg_to_float(list(tabi.columns[6]))
        intab = join(intab,tabi_new,keys="motif_name", join_type="left")
        #print(tabi_new)
    outab = Table()
    outab["motif_name"] = list(intab["motif_name"])
    base_val = list(intab[base_col])
    for i in intab.colnames[1:]:
        listi = list(intab[i])
        newList = []
        if i != base_col:
            for x in range(0,len(listi)):
                newList.append(listi[x] - base_val[x])
            outab[i] = newList
    outab = match_motifname(outab)
    ascii.write(outab, outfile, format="csv", overwrite=True)
    return(outab)

