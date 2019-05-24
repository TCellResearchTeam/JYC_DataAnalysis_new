#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Tue Apr 18 00:00:34 2017

@author: yolandatiao
"""

#####------------------ Import START ------------------#####
import os # For changing directory
import subprocess # For calling bash 
from astropy.io import ascii # For using ascii table to open csv
from astropy.table import Table, Column, join   # For using astropy table functions
import seaborn as sns # For plotting
import matplotlib.pyplot as plt # For plotting
import pandas as pd # For using pandas in seaborn plot
import numpy as np # For using numpy matrix
from matplotlib_venn import *
import math
import matplotlib.pyplot as plt
#####------------------ Import END ------------------#####



#####------------------ Config START ------------------#####
#code_dir="/Volumes/Huitian/Exp122_169_GSE88987/codes"
#####------------------ Config END ------------------#####



#####------------------ Self Defined functions START ------------------#####
def strlist(listx):
    outlist=[]
    for i in listx:
        outlist.append(str(i))
    return outlist
#####------------------ Self Defined functions END ------------------######


#####------------------ Main START ------------------######
def setcolnames(table_x):
	old_colnames=table_x.colnames
	if old_colnames[0] == 'col1':
		new_colnames=list(table_x[0])
		table_x.remove_row(0)
		for x in range(0, len(table_x[0])):
			table_x[old_colnames[x]].name=new_colnames[x]
	return table_x

def Venn_free(in_filenames, plot_nameslist, sc=99): # sc: solid outline circle, non:99
    #os.chdir("/Users/yolandatiao/Desktop/jycATAC/DEseq2/pval-0.05-up")
    #in_filenames=["all.df.numx.c5-Bcl6KO_Th1_vs_Naive-pval-0.05_up.csv"]
    in_filenames_len = len(in_filenames) #Get number of opened files
    #--- Check numbers and names of files
    print("You are opening %d files: " % (in_filenames_len) )
    for x in range (0, in_filenames_len):
    	print(in_filenames[x].split('/')[-1]) #Get rid of directory
    print('\n')
    
    #--- Output name
    o_n_list=[]
    for i in plot_nameslist:
        o_n_list.append(i)
    outname="--".join(o_n_list)
    outname="%s.pdf"%outname
    
    #--- Getting data lists from files
    if len(in_filenames) == 3:
        data_1=ascii.read(in_filenames[0])
        data_2=ascii.read(in_filenames[1])
        data_3=ascii.read(in_filenames[2])
        
        data_1=setcolnames(data_1)
        data_2=setcolnames(data_2)
        data_3=setcolnames(data_3)
        
        set_1=set(list(data_1.columns[0]))
        set_2=set(list(data_2.columns[0]))
        set_3=set(list(data_3.columns[0]))
        
        setlist=[set_1, set_2, set_3]

        r_n=0
        g_n=1
        p_n=2
        #keylist=[r_n,g_n,p_n]
          
        v3=venn3([setlist[r_n],setlist[g_n], setlist[p_n]],(plot_nameslist[r_n],plot_nameslist[g_n],plot_nameslist[p_n]))
        if sc == 99:
            plt.savefig(outname)
        else:
            idlist=[]
            for x in range(0,3):
                if x == sc:
                    idlist.append("1")
                else:
                    idlist.append("0")
            idxyz=str("".join(strlist(idlist)))
            v3.get_patch_by_id(idxyz).set_alpha(0)
            v3c=venn3_circles([setlist[r_n],setlist[g_n], setlist[p_n]],linestyle='solid')
            for x in range(0,len(in_filenames)):
                if x != sc:
                    v3c[x].set_lw(0)
            plt.savefig(outname)
        
        
    elif len(in_filenames) == 2:
        data_1=ascii.read(in_filenames[0])
        data_2=ascii.read(in_filenames[1])
        
        chdata_1=setcolnames(data_1)
        data_2=setcolnames(data_2)
        
        set_1=set(list(data_1.columns[0]))
        set_2=set(list(data_2.columns[0]))
        
        setlist=[set_1, set_2]
        
        r_n=0
        g_n=1
        #keylist=[r_n,g_n]
        
        v2=venn2([setlist[r_n],setlist[g_n]],(plot_nameslist[r_n],plot_nameslist[g_n]))
        if sc == 99:
            plt.savefig(outname)
        else:
            idlist=[]
            for x in range(0,2):
                if x == sc:
                    idlist.append("1")
                else:
                    idlist.append("0")
            idxy=str("".join(strlist(idlist)))
            v2.get_patch_by_id(idxy).set_alpha(0)
            v2c=venn2_circles([setlist[r_n],setlist[g_n]],linestyle='solid')
            for x in range(0,len(in_filenames)):
                if x != sc:
                    v2c[x].set_lw(0)
            plt.savefig(outname)
#####------------------ Main END ------------------######


















