#!/usr/bin/env python3
# -*- coding: utf-8 -*-

########## jyc_Seq_ScikitLearn ##########
# Author: Huitian (Yolanda) Diao
# Nov 3, 2018
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
wkdir = "/Users/yolandatiao/Desktop/jycATAC/RNAseq/TPMs"
os.chdir(wkdir)

'''
#--- Read tpm file
tpm_file = "all_gnTPM_true_rescale_c10.csv"
tpm_df = ascii.read(tpm_file)
sp_names = tpm_df.colnames

#--- Convert to numpy array
tpm_arr = np.array([list(tpm_df.columns[1])])
tpm_arr.shape
for x in range(2, len(tpm_df.colnames)):
    #print(len(list(tpm_df.columns[x])))
    tpm_arr = np.append(tpm_arr, [list(tpm_df.columns[x])], axis = 0)
tpm_arr.shape

#--- PCA analysis
pca = PCA(n_components=30)
tpm_arr_new = pca.fit_transform(tpm_arr)
tpm_arr_new.shape # Check new array shape
pca.components_.shape # Principal axes in feature space
pca.explained_variance_ratio_
np.sum(pca.explained_variance_ratio_) # Percentage explained by PCs

#--- Tsne
n_components = 3
tsne = manifold.TSNE(n_components=n_components, init='pca', random_state=0)
tpm_arr_tsne = tsne.fit_transform(tpm_arr)
tpm_arr_tsne.shape
plt.scatter(tpm_arr_tsne[:, 0], tpm_arr_tsne[:, 1], c="red")

#--- Create coloring sets: CD4 - CD8
colinfo = ascii.read("all_gnTPM_col_description_new.csv")
celltype = list(colinfo["Type"])
col_cd4_cd8 = []
for i in celltype:
    if i == "CD4":
        col_cd4_cd8.append('red')
    else:
        col_cd4_cd8.append('blue')
len(col_cd4_cd8)
plt.scatter(tpm_arr_tsne[:, 0], tpm_arr_tsne[:, 1],color=col_cd4_cd8)

#--- Create coloring sets CD4 - CD8 - Naive
colinfo = ascii.read("all_gnTPM_col_description_new.csv")
celltype = list(colinfo["Type"])
cellsubtype = list(colinfo["SubType"])
print(len(celltype))
col_cd4_cd8_nav = []
alphas = []
for x in range(0, len(celltype)):
    print(x)
    if celltype[x] == "CD4":
        if cellsubtype[x] == "NAV":
            col_cd4_cd8_nav.append("lightgrey")
            alphas.append(0.5)
        else:
            col_cd4_cd8_nav.append("lightgrey")
            alphas.append(0.5)
    elif celltype[x] == "CD8":
        if cellsubtype[x] == "NAV":
            col_cd4_cd8_nav.append("dodgerblue")
            alphas.append(1)
        elif cellsubtype[x] == "TE":
            col_cd4_cd8_nav.append("red")
            alphas.append(0.5)
        elif cellsubtype[x] == "MP":
            col_cd4_cd8_nav.append("g")
            alphas.append(0.5)
        elif cellsubtype[x] == "MEM":
            col_cd4_cd8_nav.append("rebeccapurple")
            alphas.append(0.5)
        else:
            col_cd4_cd8_nav.append("orange")
            alphas.append(0.5)
    print(len(col_cd4_cd8_nav))
    print("\n")
print(len(col_cd4_cd8_nav))
print(col_cd4_cd8_nav)
fig, ax = plt.subplots( nrows=1, ncols=1 , figsize=(8,8)) 
ax.scatter(tpm_arr_tsne[:, 0], tpm_arr_tsne[:, 1], color=col_cd4_cd8_nav, alpha=0.5)
ax.legend([mpatches.Patch(color="lightgrey"),  
            mpatches.Patch(color="dodgerblue"), 
            mpatches.Patch(color="red"),
            mpatches.Patch(color="g"),
            mpatches.Patch(color="rebeccapurple"),
            mpatches.Patch(color="orange")], 
           ['CD4', 'NAV', 'TE', 'MP', 'MEM', 'Other'])
fig.savefig('plot1.pdf')

#--- Create coloring sets Different Exps
colinfo = ascii.read("all_gnTPM_col_description_new.csv")
cellgroup = list(colinfo["Group"])
celltype = list(colinfo["Type"])
cellsubtype = list(colinfo["SubType"])
col_group = []
for x in range(0, len(celltype)):
    print(x)
    if celltype[x] == "CD4":
        col_group.append("lightgrey")
    elif celltype[x] == "CD8":
        if cellgroup[x] == "Exp36":
            col_group.append("orange")
        elif cellgroup[x] == "Justin":
            col_group.append("cyan")
        elif cellgroup[x] == "GSE88987":
            col_group.append("dodgerblue")
        elif cellgroup[x] == "Exp174":
            col_group.append("green")
        elif cellgroup[x] == "Exp124":
            col_group.append("orchid")
        elif cellgroup[x] == "Exp276":
            col_group.append("red")
        
fig, ax = plt.subplots( nrows=1, ncols=1 , figsize=(8,8)) 
leg = ax.legend(["a", "b", "c", "d"], [1,2,3,4])
ax.scatter(tpm_arr_tsne[:, 0], tpm_arr_tsne[:, 1], color=col_group, alpha=0.5)
ax.legend([mpatches.Patch(color="lightgrey"),  
            mpatches.Patch(color="orange"), 
            mpatches.Patch(color="cyan"),
            mpatches.Patch(color="dodgerblue"),
            mpatches.Patch(color="green"),
            mpatches.Patch(color="orchid"),
            mpatches.Patch(color="red")], 
           ['CD4', "Exp36", "Justin","GSE88987", "Exp174", "Exp124","Exp276"])
fig.savefig('plot2.pdf')
'''


#################### CD4 tsne ####################

wkdir = "/Users/yolandatiao/Desktop/jycATAC/RNAseq/TPMs"
os.chdir(wkdir)

#--- Create CD4 tpm file
'''
tpm_file = "all_gnTPM_true_rescale_c10.csv"
tpm_df = ascii.read(tpm_file)
sp_names = tpm_df.colnames

colinfo = ascii.read("all_gnTPM_col_description_new.csv")
colinfo.colnames
cellnames = list(colinfo['Name'])
celltype = list(colinfo["Type"])

delcols = []
for x in range(0,len(celltype)):
    if celltype[x] == "CD8":
        delcols.append(cellnames[x])
del tpm_df[delcols]

ascii.write(tpm_df, "all_gnTPM_true_rescale_c10_CD4.csv", format="csv")
'''

'''
###----- TSNE
cd4_tpm_df = ascii.read("all_gnTPM_true_rescale_c10_CD4.csv")
cd4_names = cd4_tpm_df.colnames[1:]

#--- Convert to numpy array
cd4_tpm_arr = np.array([list(cd4_tpm_df.columns[1])])
cd4_tpm_arr.shape
for x in range(2, len(cd4_tpm_df.colnames)):
    #print(len(list(tpm_df.columns[x])))
    cd4_tpm_arr = np.append(cd4_tpm_arr, [list(cd4_tpm_df.columns[x])], axis = 0)
cd4_tpm_arr.shape

#--- Tsne
n_components = 2
tsne = manifold.TSNE(n_components=n_components, init='pca', perplexity=10, random_state=0)
cd4_tpm_arr_tsne = tsne.fit_transform(cd4_tpm_arr)
cd4_tpm_arr_tsne.shape
plt.scatter(cd4_tpm_arr_tsne[:, 0], cd4_tpm_arr_tsne[:, 1])

#--- Create coloring sets Different Exps
colinfo = ascii.read("all_gnTPM_col_description_new.csv")
cellname = list(colinfo["Name"])
cellgroup = list(colinfo["Group"])
celltype = list(colinfo["Type"])
cellsubtype = list(colinfo["SubType"])
col_group = []
for x in range(0, len(cd4_names)):
    idx = cellname.index(cd4_names[x])
    groupx = cellgroup[idx]
    if groupx == "jyc":
        col_group.append("red")
    elif groupx == "GSE106464_in_vitro":
        col_group.append("paleturquoise")
    elif groupx == "GSE106464_in_vivo":
        col_group.append("darkturquoise")
    elif groupx == "GSE105808":
        col_group.append("forestgreen")
print(len(col_group))
        
fig, ax = plt.subplots( nrows=1, ncols=1 , figsize=(8,8)) 
ax.scatter(cd4_tpm_arr_tsne[:, 0], cd4_tpm_arr_tsne[:, 1], color=col_group, alpha=0.5)
ax.legend([mpatches.Patch(color="red"),  
           mpatches.Patch(color="paleturquoise"), 
           mpatches.Patch(color="darkturquoise"), 
           mpatches.Patch(color="forestgreen")],
           ["JYC", "GSE106464_in_vitro", "GSE106464_in_vivo", "GSE105808"])
fig.savefig('cd4_plot1.pdf')
'''

#################### invivo CD4 tsne ####################
wkdir = "/Users/yolandatiao/Desktop/jycATAC/RNAseq/TPMs"
os.chdir(wkdir)

#--- Create invivo CD4 tpm file
'''
tpm_file = "all_gnTPM_true_rescale_c10.csv"
tpm_df = ascii.read(tpm_file)
sp_names = tpm_df.colnames

colinfo = ascii.read("all_gnTPM_col_description_new.csv")
colinfo.colnames
cellnames = list(colinfo['Name'])
celltype = list(colinfo["Type"])
cellsubtype = list(colinfo['SubType'])

delcols = []
for x in range(0,len(celltype)):
    if celltype[x] == "CD8":
        delcols.append(cellnames[x])
    elif "invitro" in cellsubtype[x]:
        delcols.append(cellnames[x])
del tpm_df[delcols]

ascii.write(tpm_df, "all_gnTPM_true_rescale_c10_CD4_invivo.csv", format="csv")
'''


###----- TSNE
'''
cd4_tpm_df = ascii.read("all_gnTPM_true_rescale_c10_CD4_invivo.csv")
cd4_names = cd4_tpm_df.colnames[1:]

#--- Convert to numpy array
cd4_tpm_arr = np.array([list(cd4_tpm_df.columns[1])])
cd4_tpm_arr.shape
for x in range(2, len(cd4_tpm_df.colnames)):
    #print(len(list(tpm_df.columns[x])))
    cd4_tpm_arr = np.append(cd4_tpm_arr, [list(cd4_tpm_df.columns[x])], axis = 0)
cd4_tpm_arr.shape

###----- Tsne 
n_components = 2
tsne = manifold.TSNE(n_components=n_components, init='pca', perplexity=4, random_state=0)
cd4_tpm_arr_tsne = tsne.fit_transform(cd4_tpm_arr)
cd4_tpm_arr_tsne.shape
plt.scatter(cd4_tpm_arr_tsne[:, 0], cd4_tpm_arr_tsne[:, 1])

#--- Create coloring sets - Different Exps
colinfo = ascii.read("all_gnTPM_col_description_new.csv")
cellname = list(colinfo["Name"])
cellgroup = list(colinfo["Group"])
celltype = list(colinfo["Type"])
cellsubtype = list(colinfo["SubType"])
col_group = []
for x in range(0, len(cd4_names)):
    idx = cellname.index(cd4_names[x])
    groupx = cellgroup[idx]
    if groupx == "jyc":
        col_group.append("red")
    elif groupx == "GSE106464_in_vivo":
        col_group.append("darkturquoise")
    elif groupx == "GSE105808":
        col_group.append("forestgreen")
print(len(col_group))
        
fig, ax = plt.subplots( nrows=1, ncols=1 , figsize=(8,8)) 
ax.scatter(cd4_tpm_arr_tsne[:, 0], cd4_tpm_arr_tsne[:, 1], color=col_group, alpha=0.8)
ax.legend([mpatches.Patch(color="red"),  
           mpatches.Patch(color="darkturquoise"), 
           mpatches.Patch(color="forestgreen")],
           ["JYC",  "GSE106464_in_vivo", "GSE105808"])
fig.savefig('cd4_plot2.pdf')

#--- Create coloring sets - Different cell types
colinfo = ascii.read("all_gnTPM_col_description_new.csv")
cellname = list(colinfo["Name"])
cellgroup = list(colinfo["Group"])
celltype = list(colinfo["Type"])
cellsubtype = list(colinfo["SubType"])
col_subtype = []

for x in range(0, len(cd4_names)):
    idx = cellname.index(cd4_names[x])
    subtypex = cellsubtype[idx]
    if subtypex == "Th1":
        col_subtype.append("red")
    elif subtypex == "Tfh" or subtypex == "Thf":
        col_subtype.append("cyan")
    elif subtypex == "NAV":
        col_subtype.append("gray")
    elif subtypex == "Th2":
        col_subtype.append("orange")
    elif subtypex == "Th17":
        col_subtype.append("forestgreen")
    else:
        print(subtypex)
        
fig, ax = plt.subplots( nrows=1, ncols=1 , figsize=(8,8)) 
ax.scatter(cd4_tpm_arr_tsne[:, 0], cd4_tpm_arr_tsne[:, 1], color=col_subtype, alpha=0.8)
ax.legend([mpatches.Patch(color="red"),  
           mpatches.Patch(color="cyan"), 
           mpatches.Patch(color="gray"),
           mpatches.Patch(color="orange"),
           mpatches.Patch(color="forestgreen")],
           ["Th1","Tfh","NAV","Th2","Th17"])
fig.savefig('cd4_plot3.pdf')
'''



#################### JYC CD4 tsne ####################
'''
wkdir = "/Users/yolandatiao/Desktop/jycATAC/RNAseq/TPMs"
os.chdir(wkdir)

###----- TSNE
cd4_tpm_df = ascii.read("/Users/yolandatiao/Desktop/jycATAC/RNAseq/TPMs/gnTPM/jyc_gnTPM.csv")
cd4_names = cd4_tpm_df.colnames[1:]

#--- Convert to numpy array
cd4_tpm_arr = np.array([list(cd4_tpm_df.columns[1])])
cd4_tpm_arr.shape
for x in range(2, len(cd4_tpm_df.colnames)):
    #print(len(list(tpm_df.columns[x])))
    cd4_tpm_arr = np.append(cd4_tpm_arr, [list(cd4_tpm_df.columns[x])], axis = 0)
cd4_tpm_arr.shape

###----- Tsne 
n_components = 2
tsne = manifold.TSNE(n_components=n_components, init='pca', perplexity=4, random_state=0)
cd4_tpm_arr_tsne = tsne.fit_transform(cd4_tpm_arr)
cd4_tpm_arr_tsne.shape
plt.scatter(cd4_tpm_arr_tsne[:, 0], cd4_tpm_arr_tsne[:, 1])

#--- Create coloring sets - Different cell types
cd4_names
col_type = []
for x in range(0, len(cd4_names)):
    if "TH1" in cd4_names[x]:
        if "WT" in cd4_names[x]:
            col_type.append("orange")
        elif "Bcl6KO" in cd4_names[x]:
            col_type.append("red")
        elif "DKO" in cd4_names[x]:
            col_type.append("firebrick")
    elif "TFH" in cd4_names[x]:
        if "WT" in cd4_names[x]:
            col_type.append("aqua")
        elif "Prdm1KO" in cd4_names[x]:
            col_type.append("dodgerblue")
        elif "DKO" in cd4_names[x]:
            col_type.append("navy")
    elif "Naive" in cd4_names[x]:
        col_type.append("gray")
    else:
        print(cd4_names[x])
print(len(col_type))
fig, ax = plt.subplots( nrows=1, ncols=1 , figsize=(6,6)) 
ax.scatter(cd4_tpm_arr_tsne[:, 0], cd4_tpm_arr_tsne[:, 1], color=col_type, alpha=0.8)
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
fig.savefig('cd4_plot5.pdf')
'''


#################### CD8 tsne ####################

wkdir = "/Users/yolandatiao/Desktop/jycATAC/RNAseq/TPMs"
os.chdir(wkdir)

#--- Create CD8 tpm file
'''
tpm_file = "all_gnTPM_true_rescale_c10.csv"
tpm_df = ascii.read(tpm_file)
sp_names = tpm_df.colnames

colinfo = ascii.read("all_gnTPM_col_description_new.csv")
colinfo.colnames
cellnames = list(colinfo['Name'])
celltype = list(colinfo["Type"])

delcols = []
for x in range(0,len(celltype)):
    if celltype[x] == "CD4":
        delcols.append(cellnames[x])
del tpm_df[delcols]

ascii.write(tpm_df, "all_gnTPM_true_rescale_c10_CD8.csv", format="csv")
'''


###----- TSNE
cd4_tpm_df = ascii.read("all_gnTPM_true_rescale_c10_CD4.csv")
cd4_names = cd4_tpm_df.colnames[1:]

#--- Convert to numpy array
cd4_tpm_arr = np.array([list(cd4_tpm_df.columns[1])])
cd4_tpm_arr.shape
for x in range(2, len(cd4_tpm_df.colnames)):
    #print(len(list(tpm_df.columns[x])))
    cd4_tpm_arr = np.append(cd4_tpm_arr, [list(cd4_tpm_df.columns[x])], axis = 0)
cd4_tpm_arr.shape

#--- Tsne
n_components = 2
tsne = manifold.TSNE(n_components=n_components, init='pca', perplexity=10, random_state=0)
cd4_tpm_arr_tsne = tsne.fit_transform(cd4_tpm_arr)
cd4_tpm_arr_tsne.shape
plt.scatter(cd4_tpm_arr_tsne[:, 0], cd4_tpm_arr_tsne[:, 1])

#--- Create coloring sets Different Exps
colinfo = ascii.read("all_gnTPM_col_description_new.csv")
cellname = list(colinfo["Name"])
cellgroup = list(colinfo["Group"])
celltype = list(colinfo["Type"])
cellsubtype = list(colinfo["SubType"])
col_group = []
for x in range(0, len(cd4_names)):
    idx = cellname.index(cd4_names[x])
    groupx = cellgroup[idx]
    if groupx == "jyc":
        col_group.append("red")
    elif groupx == "GSE106464_in_vitro":
        col_group.append("paleturquoise")
    elif groupx == "GSE106464_in_vivo":
        col_group.append("darkturquoise")
    elif groupx == "GSE105808":
        col_group.append("forestgreen")
print(len(col_group))
        
fig, ax = plt.subplots( nrows=1, ncols=1 , figsize=(8,8)) 
ax.scatter(cd4_tpm_arr_tsne[:, 0], cd4_tpm_arr_tsne[:, 1], color=col_group, alpha=0.5)
ax.legend([mpatches.Patch(color="red"),  
           mpatches.Patch(color="paleturquoise"), 
           mpatches.Patch(color="darkturquoise"), 
           mpatches.Patch(color="forestgreen")],
           ["JYC", "GSE106464_in_vitro", "GSE106464_in_vivo", "GSE105808"])
fig.savefig('cd4_plot1.pdf')
































































