#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct  2 21:35:48 2019

@author: yolandatiao
"""

import os
import csv
import glob
import pandas as pd

def simp_merge_out(in_txt):
    #in_txt = "merged_Cd200.txt"
    out_file = in_txt.replace(".txt", "_simp.csv")
    with open(in_txt, "r") as fin:
        with open(out_file, "w") as fout:
            rfin = csv.reader(fin, delimiter="\t")
            wfout = csv.writer(fout, delimiter=",")
            header = next(rfin)
            files = header[8:]
            files = ["_".join(f.replace("MACS2_", "").split("_")[:-1]) for f in files]
            files = [f.replace("macs2_", "") for f in files]
            header = header[1:4] + files
            wfout.writerow(header)
            for row in rfin:
                newrow = row[1:4]
                found_list = row[8:]
                print(found_list)
                out_list = []
                for i in found_list:
                    if i != '':
                        out_list.append("x")
                    else:
                        out_list.append("")
                print(out_list)
                newrow = newrow + out_list
                wfout.writerow(newrow)
                print("")

def find_summits(merged_csv, in_dir):
    merged_csv = "/Volumes/Yolanda/JYC_DataAnalysis/3_MACS2/xls_combined_p0.1/p_0.01/d150_merged/merged_Cd200_simp.csv"
    

wkdir = "/Volumes/Yolanda/JYC_DataAnalysis/3_MACS2/xls_sep_p0.1_nonshift/txt/p0.01_bed/d150_merged"
os.chdir(wkdir)

for file in glob.glob("*.txt"):
    simp_merge_out(file)