#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct 24 16:29:39 2019

@author: yolandatiao
"""

########## T test for gene associated peaks ##########
# Author: Huitian (Yolanda) Diao
# Oct 24, 2019

import os
import csv
import glob
import pandas as pd
from scipy import stats

###----- Select peaks that are annotated to selected genes
if False:
    wk_dir = "/Volumes/Yolanda/JYC_DataAnalysis/2_MACS2/2_Peak_anno/0_HTseq_count_t-test/input"
    os.chdir(wk_dir)
    
    peak_list_file = "/Volumes/Yolanda/JYC_DataAnalysis/z_codes_local/0_1_MACS_peak_find_genes_transcript_loci_AllMergedPeaks_fixed.csv"
    peak_list_tb = pd.read_csv(peak_list_file)
    peak_list = list(peak_list_tb["matched_peak_name"])
       
    in_dir = "/Volumes/Yolanda/JYC_DataAnalysis/3_HTseq_count/1_srt_tpm"
    tpm_files = glob.glob("{useDir}/*.tpm".format(useDir = in_dir))
    
    for tpm_file in tpm_files:
        out_file = tpm_file.split("/")[-1].replace(".tpm", "_genesPeaks.csv")
        with open(tpm_file, "r") as fin:
            with open(out_file, "w") as fout:
                rfin = csv.reader(fin, delimiter = "\t")
                wfout = csv.writer(fout, delimiter = ",")
                wfout.writerow(["peak_name", "tpm"])
                for row in rfin:
                    if row[0] in peak_list:
                        wfout.writerow(row)

###----- Compile files
if False:
    wk_dir = "/Volumes/Yolanda/JYC_DataAnalysis/2_MACS2/2_Peak_anno/0_HTseq_count_t-test/input"
    os.chdir(wk_dir)
    
    tpm_files = glob.glob("{useDir}/*.csv".format(useDir = wk_dir))
    tb_0 = pd.read_csv(tpm_files[0])
    name_0 = tpm_files[0].split("/")[-1].replace("_Tn5.srt_genesPeaks.csv", "")
    tb_0.rename(columns={tb_0.columns[1]: name_0}, inplace=True)
    for i in range(1, len(tpm_files)):
        tb_i = pd.read_csv(tpm_files[i])
        name_i = tpm_files[i].split("/")[-1].replace("_Tn5.srt_genesPeaks.csv", "")
        tb_i.rename(columns={tb_i.columns[1]: name_i}, inplace=True)
        tb_0 = pd.merge(tb_0, tb_i, on = "peak_name", how = "left")
    
    out_file = "tpm_genePeaks_compiled.csv"
    tb_0.to_csv(out_file, index=False)

###----- Perform t-test
if False:
    wk_dir = "/Volumes/Yolanda/JYC_DataAnalysis/2_MACS2/2_Peak_anno/0_HTseq_count_t-test"
    os.chdir(wk_dir)
    
    tpm_all_file = "/Volumes/Yolanda/JYC_DataAnalysis/2_MACS2/2_Peak_anno/0_HTseq_count_t-test/tpm_genePeaks_compiled.csv"
    tpm_all_tb = pd.read_csv(tpm_all_file)
    tpm_all_tb_colnames = list(tpm_all_tb.columns)
    
    peak_info = "/Volumes/Yolanda/JYC_DataAnalysis/z_codes_local/0_1_MACS_peak_find_genes_transcript_loci_AllMergedPeaks_fixed.csv"
    peak_info_tb = pd.read_csv(peak_info)
    peak_info_tb.rename(columns={"matched_peak_name": "peak_name"}, inplace=True)
    
    cd_types = list(set(["_".join(i.split("_")[:-1]) for i in list(tpm_all_tb.columns[1:])]))
    cd_dict = {}
    for cd_type in cd_types:
        cd_type_use = cd_type + "_"
        cd_type_index = [index for index, i in enumerate(tpm_all_tb_colnames) if cd_type_use in i]
        cd_dict[cd_type] = cd_type_index
    
    fc_tb = pd.DataFrame({"peak_name": tpm_all_tb["peak_name"]})
    p_val_tb = pd.DataFrame({"peak_name": tpm_all_tb["peak_name"]})
    for i in range(0, len(cd_types)):
        for j in range(i+1, len(cd_types)):
            tp_i = cd_types[i]
            tp_j = cd_types[j]
            cp_name = "__vs__".join([cd_types[i], cd_types[j]])
            fc_list = []
            p_list = []
            for k in range(0, len(tpm_all_tb)):
                row_k = list(tpm_all_tb.iloc[k])
                val_i = [row_k[x] for x in cd_dict[tp_i]]
                val_j = [row_k[x] for x in cd_dict[tp_j]]
                val_i = [float(x) for x in val_i]
                val_j = [float(x) for x in val_j]
                fc = (sum(val_i)/len(val_i) + 0.1) / (sum(val_j)/len(val_j) + 0.1)
                pval = stats.ttest_ind(val_i, val_j).pvalue
                fc_list.append(fc)
                p_list.append(pval)
            fc_tb[cp_name] = fc_list
            p_val_tb[cp_name] = p_list
    
    fc_tb = pd.merge(peak_info_tb, fc_tb, on = "peak_name", how = "left")
    p_val_tb = pd.merge(peak_info_tb, p_val_tb, on = "peak_name", how = "left")            
    fc_tb_file = "tpm_genePeaks_t-test_foldChange.csv"
    p_val_file = "tpm_genePeaks_t-test_pval.csv"
    fc_tb.to_csv(fc_tb_file, index=False)
    p_val_tb.to_csv(p_val_file, index=False)
