#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct  2 21:35:48 2019

@author: yolandatiao
"""

import os
import csv
import glob

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

wkdir = "/Volumes/Yolanda/JYC_DataAnalysis/3_MACS2/xls_combined_p0.3_noshift/p_0.01/merged"
os.chdir(wkdir)

for file in glob.glob("*.txt"):
    simp_merge_out(file)