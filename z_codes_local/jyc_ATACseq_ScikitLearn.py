#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Nov  5 23:44:43 2018

@author: yolandatiao
"""

########## jyc_Seq_ScikitLearn ##########
# Author: Huitian (Yolanda) Diao
# Nov 5, 2018
# Dependencies:
#   1. RNAseq: TPM <- Salmon
#   2. ATACseq: TPM <- 3_1_HTseq_count_TPM.py
#   3. Data compiling <- jyc_Seq_ScikitLearn_dataprep.py

########## Import ##########
import os
import numpy as np
from numpy import genfromtxt
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from sklearn import decomposition
from sklearn import datasets
import pandas as pd
from sklearn.decomposition import PCA
from astropy.io import ascii # For using ascii table to open csv
from astropy.table import Table, Column, join   # For using astropy table functions
from sklearn import manifold, datasets
import matplotlib.patches as mpatches

########## Main ##########
wkdir = "/Users/yolandatiao/Desktop/jycATAC/3_HTseqCount/jyc"
os.chdir(wkdir)

########## JYC-STAT4 ##########
#--- Read tpm file
tpm_file = "jyc.all.df.int.max.c5.csv"
tpm_df = ascii.read(tpm_file)
header = list(tpm_df[0])
for x in range(1,len(tpm_df.colnames)):
    tpm_df[tpm_df.colnames[x]].name=header[x]
tpm_df.remove_row(0)
sp_names = tpm_df.colnames[1:]


#--- Convert to numpy array
tpm_arr = np.array([list(tpm_df.columns[1])])
tpm_arr.shape
for x in range(2, len(tpm_df.colnames)):
    #print(len(list(tpm_df.columns[x])))
    tpm_arr = np.append(tpm_arr, [list(tpm_df.columns[x])], axis = 0)
tpm_arr.shape

###----- Tsne 
n_components = 2
tsne = manifold.TSNE(n_components=n_components, init='pca', perplexity=4, random_state=0)
tpm_arr_tsne = tsne.fit_transform(tpm_arr)
tpm_arr_tsne.shape
plt.scatter(tpm_arr_tsne[:, 0], tpm_arr_tsne[:, 1])

###---- Plot
#--- Create coloring sets - Different cell types
print(sp_names)
print(len(sp_names))
col_type = []	
for x in range(0, len(sp_names)):
    if "Th1" in sp_names[x]:
        if "WT" in sp_names[x]:
            col_type.append("orange")
        elif "Bcl6KO" in sp_names[x]:
            col_type.append("red")
        elif "DKO" in sp_names[x]:
            col_type.append("firebrick")
    elif "Tfh" in sp_names[x]:
        if "STAT4_WT" in sp_names[x]:
            col_type.append("forestgreen")
        elif "WT" in sp_names[x]:
            col_type.append("aqua")
        elif "Prdm1KO" in sp_names[x]:
            col_type.append("dodgerblue")
        elif "DKO" in sp_names[x]:
            col_type.append("navy")
        elif "STAT4_KO" in sp_names[x]:
            col_type.append("limegreen")
    elif "Naive" in sp_names[x]:
        col_type.append("gray")
    else:
        print(sp_names[x])
print(len(col_type))
fig, ax = plt.subplots( nrows=1, ncols=1 , figsize=(6,6)) 
ax.scatter(tpm_arr_tsne[:, 0], tpm_arr_tsne[:, 1], color=col_type, alpha=0.8)
ax.legend([mpatches.Patch(color="orange"), 
           mpatches.Patch(color="red"),
           mpatches.Patch(color="firebrick"),
           mpatches.Patch(color="forestgreen"),
           mpatches.Patch(color="limegreen"),
           mpatches.Patch(color="aqua"),
           mpatches.Patch(color="dodgerblue"),           
           mpatches.Patch(color="navy"),
           mpatches.Patch(color="gray")],
           ["Th1-WT","Th1-Bcl6KO", "Th1-DKO",
           "Tfh-STAT4WT","Tfh-STAT4KO", 
           "Tfh-WT","Tfh-Prdm1KO", "Tfh-DKO",
            "NAV"])
fig.savefig('jyc_STAT4_ATAC_tsne.pdf')

########## JYC-only ##########
'''
#--- Read tpm file
tpm_file = "jyc.all.df.int.max.c5_nostat4.csv"
tpm_df = ascii.read(tpm_file)
header = list(tpm_df[0])
for x in range(1,len(tpm_df.colnames)):
    tpm_df[tpm_df.colnames[x]].name=header[x]
tpm_df.remove_row(0)
sp_names = tpm_df.colnames[1:]


#--- Convert to numpy array
tpm_arr = np.array([list(tpm_df.columns[1])])
tpm_arr.shape
for x in range(2, len(tpm_df.colnames)):
    #print(len(list(tpm_df.columns[x])))
    tpm_arr = np.append(tpm_arr, [list(tpm_df.columns[x])], axis = 0)
tpm_arr.shape

###---- Plot
#--- Create coloring sets - Different cell types
print(sp_names)
print(len(sp_names))
col_type = []	
for x in range(0, len(sp_names)):
    if "Th1" in sp_names[x]:
        if "WT" in sp_names[x]:
            col_type.append("orange")
        elif "Bcl6KO" in sp_names[x]:
            col_type.append("red")
        elif "DKO" in sp_names[x]:
            col_type.append("firebrick")
    elif "Tfh" in sp_names[x]:
        if "WT" in sp_names[x]:
            col_type.append("aqua")
        elif "Prdm1KO" in sp_names[x]:
            col_type.append("dodgerblue")
        elif "DKO" in sp_names[x]:
            col_type.append("navy")
    elif "Naive" in sp_names[x]:
        print(sp_names[x])
        if "_1" in sp_names[x]:
            col_type.append("lightgray")
        elif "_2" in sp_names[x]:
            col_type.append("grey")
        elif "_3" in sp_names[x]:
            col_type.append("k")
    else:
        print(sp_names[x])
print(len(col_type))

###----- Tsne 
n_components = 2
tsne = manifold.TSNE(n_components=n_components, init='pca', perplexity=4, 
                     n_iter = 10000, random_state=0, learning_rate=50,
                     early_exaggeration=20)
tpm_arr_tsne = tsne.fit_transform(tpm_arr)
tpm_arr_tsne.shape
plt.scatter(tpm_arr_tsne[:, 0], tpm_arr_tsne[:, 1])
fig, ax = plt.subplots( nrows=1, ncols=1 , figsize=(8,8)) 
ax.scatter(tpm_arr_tsne[:, 0], tpm_arr_tsne[:, 1], color=col_type, alpha=0.8)
ax.legend([mpatches.Patch(color="orange"), 
           mpatches.Patch(color="red"),
           mpatches.Patch(color="firebrick"),
           mpatches.Patch(color="aqua"),
           mpatches.Patch(color="dodgerblue"),           
           mpatches.Patch(color="navy"),
           mpatches.Patch(color="lightgray"),
           mpatches.Patch(color="grey"),
           mpatches.Patch(color="k")],
           ["Th1-WT","Th1-Bcl6KO", "Th1-DKO",
            "Tfh-WT","Tfh-Prdm1KO", "Tfh-DKO",
            "NAV-1","NAV-2","NAV-3"])
fig.savefig('jyc_STAT4_ATAC_tsne.pdf')
'''

########## JYC-only - rm outlier ##########

#--- Read tpm file
tpm_file = "jyc.all.df.int.max.c5_nostat4.csv"
tpm_df = ascii.read(tpm_file)
header = list(tpm_df[0])
for x in range(1,len(tpm_df.colnames)):
    tpm_df[tpm_df.colnames[x]].name=header[x]
tpm_df.remove_row(0)
#del tpm_df["Naive_1"]
del tpm_df["Naive_2"]
#del tpm_df["Naive_3"]
sp_names = tpm_df.colnames[1:]
sp_names


#--- Convert to numpy array
tpm_arr = np.array([list(tpm_df.columns[1])])
tpm_arr.shape
for x in range(2, len(tpm_df.colnames)):
    #print(len(list(tpm_df.columns[x])))
    tpm_arr = np.append(tpm_arr, [list(tpm_df.columns[x])], axis = 0)
tpm_arr.shape

###---- Plot
#--- Create coloring sets - Different cell types
print(sp_names)
print(len(sp_names))
col_type = []	
for x in range(0, len(sp_names)):
    if "Th1" in sp_names[x]:
        if "WT" in sp_names[x]:
            col_type.append("orange")
        elif "Bcl6KO" in sp_names[x]:
            col_type.append("red")
        elif "DKO" in sp_names[x]:
            col_type.append("firebrick")
    elif "Tfh" in sp_names[x]:
        if "WT" in sp_names[x]:
            col_type.append("aqua")
        elif "Prdm1KO" in sp_names[x]:
            col_type.append("dodgerblue")
        elif "DKO" in sp_names[x]:
            col_type.append("navy")
    elif "Naive" in sp_names[x]:
        col_type.append("gray")
    else:
        print(sp_names[x])
print(len(col_type))

###----- Tsne 
sp_names
n_components = 2
tsne = manifold.TSNE(n_components=n_components, init='pca', perplexity=4, 
                     n_iter = 20000, random_state=0, learning_rate=100,
                     early_exaggeration=20)
tpm_arr_tsne = tsne.fit_transform(tpm_arr)
tpm_arr_tsne.shape
plt.scatter(tpm_arr_tsne[:, 0], tpm_arr_tsne[:, 1])
fig, ax = plt.subplots( nrows=1, ncols=1 , figsize=(8,8)) 
ax.scatter(tpm_arr_tsne[:, 0], tpm_arr_tsne[:, 1], color=col_type, alpha=0.8)
ax.legend([mpatches.Patch(color="orange"), 
           mpatches.Patch(color="red"),
           mpatches.Patch(color="firebrick"),
           mpatches.Patch(color="aqua"),
           mpatches.Patch(color="dodgerblue"),           
           mpatches.Patch(color="navy"),
           mpatches.Patch(color="gray")],
           ["Th1-WT","Th1-Bcl6KO", "Th1-DKO",
            "Tfh-WT","Tfh-Prdm1KO", "Tfh-DKO",
            "NAV"])
fig.savefig('jyc_ATAC_tsne_rmout.pdf')










