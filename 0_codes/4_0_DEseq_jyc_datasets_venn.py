#!/usr/bin/env python3
# -*- coding: utf-8 -*-

########## DEseq_jyc_datasets_venn ##########
# Author: Huitian (Yolanda) Diao
# Nov 3, 2018
# Dependencies:
#   0. Import source code: fc_Venn_diagram_all.py
#   1. Sliced DEseq output (based on fc and p-value, used awk)
#   2. DEseq output <- HTseq-count
#   3. HTseq cout <- Homer merge
#   4. Homer merge <- MACS2

########## Import ##########
import os
code_dir="/Users/yolandatiao/Desktop/jycATAC/codes"
import fc_Venn_diagram_all as fcVenn


########## Main ##########
wkdir = "/Users/yolandatiao/Desktop/jycATAC/DEseq2/pval-0.05-updn_Venn"
os.chdir(wkdir)

dir_up = "/Users/yolandatiao/Desktop/jycATAC/DEseq2/pval-0.05-up"
dir_dn = "/Users/yolandatiao/Desktop/jycATAC/DEseq2/pval-0.05-dn"

DKO_Th1_vs_Naive = "DKO_Th1_vs_Naive"
Bcl6KO_Th1_vs_Naive = "Bcl6KO_Th1_vs_Naive"
WT_Th1_vs_Naive = "WT_Th1_vs_Naive"
				
DKO_Th1_vs_WT_Th1 = "DKO_Th1_vs_WT_Th1"
Bcl6KO_Th1_vs_WT_Th1 = "Bcl6KO_Th1_vs_WT_Th1"
DKO_Th1_vs_Bcl6KO_Th1 = "DKO_Th1_vs_Bcl6KO_Th1"
				
DKO_Tfh_vs_Naive = "DKO_Tfh_vs_Naive"
Prdm1KO_Tfh_vs_Naive = "Prdm1KO_Tfh_vs_Naive"
WT_Tfh_vs_Naive = "WT_Tfh_vs_Naive"

DKO_Tfh_vs_WT_Tfh = "DKO_Tfh_vs_WT_Tfh"
Prdm1KO_Tfh_vs_WT_Tfh = "Prdm1KO_Tfh_vs_WT_Tfh"
DKO_Tfh_vs_Prdm1KO_Tfh = "DKO_Tfh_vs_Prdm1KO_Tfh"


###----- Plot for Th1 -vs- Naive
Th1_Naive_names = [WT_Th1_vs_Naive, Bcl6KO_Th1_vs_Naive, DKO_Th1_vs_Naive]
names_list = Th1_Naive_names
names_up = ["%s--up" %i for i in names_list]
names_dn = ["%s--dn" %i for i in names_list]
up_files = ["%s/all.df.numx.c5-%s-pval-0.05_up.csv"% (dir_up, i) for i in names_list]
dn_files = ["%s/all.df.numx.c5-%s-pval-0.05_dn.csv"% (dir_dn, i) for i in names_list]
fcVenn.Venn_free(up_files, names_up, 0)
fcVenn.Venn_free(dn_files, names_dn, 0)


###----- Plot for Tfh -vs- Naive
Tfh_Naive_names = [WT_Tfh_vs_Naive, Prdm1KO_Tfh_vs_Naive, DKO_Tfh_vs_Naive]
names_list = Tfh_Naive_names
names_up = ["%s--up" %i for i in names_list]
names_dn = ["%s--dn" %i for i in names_list]
up_files = ["%s/all.df.numx.c5-%s-pval-0.05_up.csv"% (dir_up, i) for i in names_list]
dn_files = ["%s/all.df.numx.c5-%s-pval-0.05_dn.csv"% (dir_dn, i) for i in names_list]
fcVenn.Venn_free(up_files, names_up, 0)
fcVenn.Venn_free(dn_files, names_dn, 0)

###----- Plot for Th1 -vs- Th1
Th1_names = [Bcl6KO_Th1_vs_WT_Th1, DKO_Th1_vs_WT_Th1]
names_list = Th1_names
names_up = ["%s--up" %i for i in names_list]
names_dn = ["%s--dn" %i for i in names_list]
up_files = ["%s/all.df.numx.c5-%s-pval-0.05_up.csv"% (dir_up, i) for i in names_list]
dn_files = ["%s/all.df.numx.c5-%s-pval-0.05_dn.csv"% (dir_dn, i) for i in names_list]
fcVenn.Venn_free(up_files, names_up, 99)
fcVenn.Venn_free(dn_files, names_dn, 99)

###----- Plot for Tfh -vs- Tfh
Tfh_names = [Prdm1KO_Tfh_vs_WT_Tfh, DKO_Tfh_vs_WT_Tfh]
names_list = Tfh_names
names_up = ["%s--up" %i for i in names_list]
names_dn = ["%s--dn" %i for i in names_list]
up_files = ["%s/all.df.numx.c5-%s-pval-0.05_up.csv"% (dir_up, i) for i in names_list]
dn_files = ["%s/all.df.numx.c5-%s-pval-0.05_dn.csv"% (dir_dn, i) for i in names_list]
fcVenn.Venn_free(up_files, names_up, 99)
fcVenn.Venn_free(dn_files, names_dn, 99)


