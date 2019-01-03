#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Sat May  6 19:58:10 2017

@author: yolandatiao
"""

#####------------------ Import START ------------------#####
import os # For changing directory
import subprocess # For calling bash 
from astropy.io import ascii # For using ascii table to open csv
from astropy.table import Table, Column    # For using astropy table functions
import seaborn as sns # For plotting
import matplotlib.pyplot as plt # For plotting
import pandas as pd # For using pandas in seaborn plot
import numpy as np # For using numpy matrix
import plotly.plotly as py
import plotly.tools as tls
import Tkinter,tkFileDialog
import csv # For using csv writer
#####------------------ Import END ------------------#####



#####------------------ Config START ------------------#####
code_directory="/Volumes/Huitian/Exp122_169_GSE88987/codes"
out_dir="/Volumes/Huitian/Exp122_169_GSE88987/data/7_DEseq2/input_raw_count_tables"
main_in_file="/Volumes/Huitian/Exp122_169_GSE88987/data/6_count/count_cord/Exp169_Runx3_cord.csv"
cutoff=5
#norm_mode="T" #norm: T (only Tn5 insertion site normalization) TS (Tn5 insertion site and peak size)
#####------------------ Config END ------------------#####



#####------------------ Self Defined functions START ------------------#####
os.chdir(code_directory)
import fc_basic_astropy_subprocess as fc

# A function to transform an index list to element list from a source list
def list_tsf(list_n, list_source):
    list_out=[]
    for element in list_n:
        list_out.append(list_source[int(element)])
    return list_out

# A function to transform a list with the format like Condition_Number to a set of conditions
def name_to_cond(name_list):
    cond_list=[]
    for i in name_list:
        i_list=i.split("_")
        i_cond="_".join(i_list[0:len(i_list)-1])
        cond_list.append(i_cond)
    return list(set(cond_list))
        
#####------------------ Self Defined functions END ------------------#####

#####------------------ Main function START ------------------#####
###----- Main Function
def filter_data(in_file,cf_n):
    in_file_nf=fc.filenamenoformat(fc.Getfilename(in_file))
    
    in_tab=ascii.read(in_file)
    in_tab=fc.setcolnames(in_tab)
    in_colnames=in_tab.colnames
    for x in xrange(0,len(in_colnames)):
        print "%s %s"%(x, in_colnames[x])
    print "Please choose your comparison groups, seperated by comma: "
    print "(1-2,1-3,1-4)"
    comp=raw_input()
    comp_list=comp.split(",")
    #--- For all Comp lists, filter
    for x in xrange(0, len(comp_list)):
        sublist_x=comp_list[x].split("-")
        out_suf_list=list_tsf(sublist_x, in_colnames)
        out_suf_str='-'.join(name_to_cond(out_suf_list))
        out_filename="%s_%s_c%s.csv"%(in_file_nf, out_suf_str,cf_n)
        # Create output table
        subtab=Table()
        subtab[in_colnames[0]]=list(in_tab.columns[0])
        for y in xrange(0, len(sublist_x)):
            subtab_colname_y=in_colnames[int(sublist_x[y])]
            subtab[subtab_colname_y]=list(in_tab[subtab_colname_y])
        # Create delete list
        del_row=[]
        for nrow in xrange(0, len(subtab)):
            nrow_del=True
            row_content_list=list(subtab[nrow])[1:]
            for i in row_content_list:
                if i>=cf_n:
                    nrow_del=False
            if nrow_del==True:
                del_row.append(nrow)
        subtab.remove_rows(del_row)
        ascii.write(subtab, out_filename, format = 'csv', overwrite = True)
        
###----- Use function and make files
os.chdir(out_dir)
filter_data(main_in_file,cutoff)

#####------------------ Main function END ------------------#####















