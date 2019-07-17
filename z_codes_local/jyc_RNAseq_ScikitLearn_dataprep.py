#!/usr/bin/env python3
# -*- coding: utf-8 -*-

########## jyc_Seq_ScikitLearn ##########
# Author: Huitian (Yolanda) Diao
# Nov 3, 2018
# Dependencies:
#   1. RNAseq: TPM <- Salmon
#   2. ATACseq: TPM <- 3_1_HTseq_count_TPM.py


########## Import ##########
import os
import csv
from astropy.io import ascii # For using ascii table to open csv
from astropy.table import Table, Column, join   # For using astropy table functions
import glob

########## Main ##########
wkdir = "/Users/yolandatiao/Desktop/jycATAC/RNAseq/TPMs"
os.chdir(wkdir)

###----- RNAseq TPM compile
def CompileTPM(salmon_dir, out_name):
    #salmon_dir="/Volumes/Huitian/Exp124_RNASeq/salmon"
    #out_name="out.csv"
    filelist=[]
    for root, dirs, files in os.walk(salmon_dir):
        for file in files:
            if file.endswith("quant.sf"):
                filelist.append(os.path.join(root, file))
    print(filelist)
    fnames = [x.split("/")[-2] for x in filelist]
    
    with open(out_name, "w") as fout:
        wfout = csv.writer(fout, delimiter=",")
        header = ["name"] + fnames
        wfout.writerow(header)
        finlist = []
        rfinlist = []
        for x in range(0, len(filelist)):
            finlist.append(open(filelist[x], "r"))
        for x in range(0, len(filelist)):
            rfinlist.append(csv.reader(finlist[x], delimiter="\t"))
        for x in range(0, len(filelist)):
            next(rfinlist[x])
        for row in rfinlist[0]:
            newrow = [row[0], float(row[3])]
            for x in range(1, len(filelist)):
                newrow.append(float(next(rfinlist[x])[3]))
            wfout.writerow(newrow)
'''           
#--- Exp124
Exp124_dir="/Volumes/Huitian/Exp124_RNASeq/salmon"
Exp124_tpmName="Exp124_tpm.csv"
CompileTPM(Exp124_dir, Exp124_tpmName)

#--- Exp276
Exp124_dir="/Volumes/Huitian/Exp276_RNASeq/salmon_nonTrim"
Exp124_tpmName="Exp276_tpm.csv"
CompileTPM(Exp124_dir, Exp124_tpmName)

#--- Exp36
Exp124_dir="/Volumes/Huitian/Exp36_RNAseq/EXP36"
Exp124_tpmName="Exp36_tpm.csv"
CompileTPM(Exp124_dir, Exp124_tpmName)

#--- GEO_Th
Exp124_dir="/Users/yolandatiao/Desktop/jycATAC/RNAseq/GEO_Th_RNASeq"
Exp124_tpmName="GEO_Th_tpm.csv"
CompileTPM(Exp124_dir, Exp124_tpmName)

#--- Goldrathlab
Goldrath_dir="/Users/yolandatiao/Desktop/jycATAC/RNAseq/Goldrath_RNAseq/Salmon"
Goldrath_tpmName="Justin_tpm.csv"
CompileTPM(Goldrath_dir, Goldrath_tpmName)

#--- GSE88987
GSE88987_dir="/Volumes/Huitian/GSE88987_RNAseq/GSE88987_RNAseq/fastq"
GSE88987_tpmName="GSE88987_tpm.csv"
CompileTPM(GSE88987_dir, GSE88987_tpmName)
'''

###----- Convert ENSEMBL IDs to gene names
'''
wkdir = "/Users/yolandatiao/Desktop/jycATAC/RNAseq/TPMs"
os.chdir(wkdir)
id_to_gn = "/Users/yolandatiao/Desktop/jycATAC/RNAseq/TPMs/ENSEMBL_IDs_gn.csv"
salmon_ids = "/Users/yolandatiao/Desktop/jycATAC/RNAseq/TPMs/Salmon_ENSEMBL_IDs.csv"
salmon_ids_out = "Salmon_ENSEMBL_IDs_gn.csv"

idtognTab = ascii.read(id_to_gn)
ids = list(idtognTab['ensembl_transcript_id'])
gns = list(idtognTab['external_gene_name'])

with open(salmon_ids, "r") as fin:
    with open(salmon_ids_out, "w") as fout:
        rfin = csv.reader(fin, delimiter=",")
        wfout = csv. writer(fout, delimiter=",")
        header = next(rfin)
        newheader = header + ["gene_name"]
        wfout.writerow(newheader)
        for row in rfin:
            ID = row[0].split(".")[0]
            if ID in ids:
                IDidx = ids.index(ID)
                IDgn = gns[IDidx]
                newrow = row + [IDgn]
                wfout.writerow(newrow)
                del ids[IDidx]
                del gns[IDidx]
            else:
                newrow = row + ["N.A."]
                wfout.writerow(newrow)
'''


###----- Convert salmon transcript quant to gene quant
def collapse_transcripts(sal_tsp_tpm, id_gn):
    #sal_tsp_tpm = "Exp36_tpm.csv"
    #id_gn = "Salmon_ENSEMBL_IDs_gn_DoNotUseExcel.csv"
    
    outname = sal_tsp_tpm.replace("tpm.csv", "gnTPM.csv")
    saltab = ascii.read(sal_tsp_tpm)
    idgntab = ascii.read(id_gn)
    gns = list(idgntab["gene_name"])
    saltab["gn"] = gns
    sp_num = len(saltab.colnames) - 2
    
    saltab_by_gn = saltab.group_by("gn")
    with open(outname, "w") as fout:
        wfout = csv.writer(fout, delimiter=",")
        wfout.writerow(["gene_name"] + saltab.colnames[1:(sp_num+1)])
        for x in range(0, len(saltab_by_gn.groups.keys)):
            # print(saltab_by_gn.groups[x])
            subsetTab = saltab_by_gn.groups[x]
            gnx = subsetTab["gn"][0]
            if gnx!= "N.A.":
                newrow = [gnx]
                for y in range(1, sp_num+1):
                    colsum = sum(list(subsetTab.columns[y]))
                    newrow.append(colsum)  
                wfout.writerow(newrow) 
            else:
                for z in range(0, len(subsetTab)):
                    #print(list(subsetTab[z]))
                    #print(len(list(subsetTab[z])))
                    newrow = list(subsetTab[z])[0:len(subsetTab[z])-1]
                    #print(newrow)
                    wfout.writerow(newrow) 
ref_id_gn = "/Users/yolandatiao/Desktop/jycATAC/RNAseq/TPMs/Refs/Salmon_ENSEMBL_IDs_gn_DoNotUseExcel.csv"
'''
collapse_transcripts("Exp124_tpm.csv", ref_id_gn)
collapse_transcripts("Exp276_tpm.csv", ref_id_gn)
collapse_transcripts("GEO_Th_tpm.csv", ref_id_gn)
collapse_transcripts("Justin_tpm.csv", ref_id_gn)
collapse_transcripts("GSE88987_tpm.csv", ref_id_gn)
'''

###----- Reset column names for "Adam_Exp174"
'''
exp174 = ascii.read("/Users/yolandatiao/Desktop/jycATAC/RNAseq/TPMs/Exp174_Adam_TPM.csv")
exp174_cols = ["gene_name", "WT2-Day5-EEC", "WT2-Day5-SLEC", "KO2-Day5-EEC", 
               "KO2-Day5-SLEC", "WT3-Day5-EEC", "WT3-Day5-SLEC", 
               "KO3-Day5-EEC", "KO3-Day5-SLEC", "WT2-Day8-EEC", 
               "WT2-Day8-SLEC", "WT2-Day8-MPEC", "KO2-Day8-EEC", 
               "KO2-Day8-SLEC", "KO2-Day8-MPEC", "WT3-Day8-EEC", 
               "WT3-Day8-SLEC", "WT3-Day8-MPEC", "KO3-Day8-EEC", 
               "KO3-Day8-SLEC", "KO3-Day8-MPEC"]
exp174.remove_row(0)
for x in range(0, len(exp174[0])):
    exp174[exp174.colnames[x]].name = exp174_cols[x]
ascii.write(exp174, "Exp174_gnTPM.csv", format="csv")
'''


###----- Merge all files
'''
wkdir = "/Users/yolandatiao/Desktop/jycATAC/RNAseq/TPMs"
os.chdir(wkdir)

filelist = []
for filepath in glob.glob("*gnTPM.csv"):
    filelist.append(filepath)

intab = ascii.read(filelist[0])
exp0 = filelist[0].split("_")[0]
for x in range(1, len(intab.colnames)):
    intab[intab.colnames[x]].name = exp0 + "::" + intab.colnames[x]
    print(exp0 + "::" + intab.colnames[x])

for x in range(1, len(filelist)):
    newtab = ascii.read(filelist[x])
    newtab[newtab.colnames[0]].name = "gene_name"
    expx = filelist[x].split("_")[0]
    for x in range(1, len(newtab.colnames)):
        newtab[newtab.colnames[x]].name = expx + "::" + newtab.colnames[x]
    print(newtab.colnames)
    intab = join(intab, newtab, join_type="outer", keys="gene_name")

ascii.write(intab, "all_gnTPM.csv", format="csv", overwrite=True)
'''

###----- Sort merged table

wkdir = "/Users/yolandatiao/Desktop/jycATAC/RNAseq/TPMs"
os.chdir(wkdir)

infile = "all_gnTPM.csv"
outfile = "all_gnTPM_true.csv"

with open(infile, "r") as fin:
    with open(outfile, "w") as fout:
        rfin = csv.reader(fin, delimiter=",")
        wfout = csv.writer(fout, delimiter=",")
        header = next(rfin)
        wfout.writerow(header)
        exp174start = header.index("Exp174::WT2-Day5-EEC")
        exp174end = header.index("Exp174::KO3-Day8-MPEC")
        #print(header[exp174start:exp174end])
        #print(header[:exp174start])
        #print(header[exp174end+1:])
        for row in rfin:
            roweval = row[:exp174start] + row[exp174end+1:]
            if "" not in roweval:
                wfout.writerow(row)


###----- Rescale merged table

# Calculated tpm_sums by excel
tpm_sums = [831753.1021, 831181.2549, 842293.9401, 850550.5601, 856677.6202, 857844.4095, 777249.0262, 759225.2401, 829221.1318, 
            854789.76, 847631.1578, 834000.7864, 853732.2399, 849450.6941, 937913.254, 938955.385, 938583.73, 934263.857, 
            935510.779, 934556.191, 938443.259, 939885.383, 939278.122, 936461.92, 935734.077, 935179.134, 938520.25, 938109.78, 
            937510.443, 937534.166, 937551.669, 937804.971, 932830.836, 935354.37, 936571.433, 883579.5701, 884392.3851, 
            877113.2835, 883521.246, 885525.3464, 889355.2593, 881447.9328, 885695.6125, 869995.7856, 873366.4969, 853226.4224, 
            848860.5586, 874552.8246, 852250.5376, 859048.8061, 871160.4461, 853722.5207, 857325.9631, 869676.5877, 855942.7419, 
            842717.8696, 841018.6977, 842410.7855, 842592.7611, 829907.2144, 829373.368, 831945.9839, 831402.7739, 806946.5325, 
            806940.1557, 810911.4711, 811469.3361, 786581.3351, 786516.8387, 797129.5272, 795401.9702, 837270.9243, 848845.2754, 
            841882.4869, 847744.7853, 831777.5576, 827494.5418, 843403.2114, 855157.0305, 828082.5554, 769978.4643, 771400.0529, 
            812098.2866, 814902.19, 833334.4601, 838902.2206, 810407.1695, 824554.7499, 791170.061, 837223.1359, 835304.9868, 
            787613.3771, 763472.5847, 775053.1013, 823184.2675, 820341.1494, 834336.9471, 840616.812, 817188.598, 832430.2476, 
            781143.4596, 835112.4796, 843770.5995, 785342.0066, 742684.7042, 758630.0613, 791668.599, 752949.9697, 688825.7416, 
            757484.857, 727618.2222, 753827.0469, 773094.5397, 702326.7408, 756922.3171, 787406.3688, 751513.2925, 757760.3947, 
            784975.8366, 753823.6418, 768115.5676, 712030.0061, 754703.4093, 758891.3651, 715834.7835, 765950.5273, 751737.3941, 
            721559.6115, 729198.8489, 769250.9401, 837100.4112, 722324.2615, 712854.4692, 752571.9242, 763668.4518, 737622.0379, 
            739353.7794, 710491.2638, 707473.0708, 688597.1695, 749360.4111, 726342.4651, 770791.5974, 738016.8105, 690830.3091, 
            700771.3847, 749493.1757, 755966.1465, 744129.7188, 745956.594, 729616.1496, 705819.0186, 757738.6766, 758354.0453, 
            745773.4767, 747675.4978, 746901.2326, 738811.4538, 738605.2229, 763729.1806, 743289.3216, 752949.2693, 729503.2064, 
            708919.5065, 738281.1897, 767981.9987, 740450.7254, 712914.9398, 749325.8106, 750514.3389, 756974.5225, 756365.8727, 
            746588.2236, 728624.6458, 753225.6277, 836820.8184, 756368.7593, 744253.0975, 751425.8373, 719999.241, 745328.7925, 
            725886.0253, 740805.7156, 782469.5995, 754525.5785, 751416.6404, 750338.9346, 751051.3571, 772444.8207, 751847.0014, 
            714820.2318, 753025.1018, 691647.4145, 721856.4916, 750461.5473, 769576.3187, 746909.2009, 700037.5125, 742908.9062, 
            765901.7543, 789557.9086, 745072.5536, 767433.4696, 763422.3536, 741350.5097, 752452.4228, 722142.6513, 716833.3696, 
            702213.9077, 768659.2211, 753145.9014, 767502.9296, 754016.9343, 739088.1377, 674934.216, 753660.1819, 796308.945, 
            766338.8805, 726838.4998, 715718.7654, 709054.8319, 753063.3956, 692450.9996, 735529.828, 752106.3541, 734884.7172, 
            715827.3845, 727127.9023, 752786.7033, 698409.6852, 741014.2351, 789262.4974, 724974.4173, 750468.1344, 757530.8747, 
            737073.2978, 733341.0322, 743643.4491, 746406.8532, 737634.6177, 761808.8332, 764922.325, 756103.8887, 755640.5071, 
            714127.5674, 734206.9858, 742620.2682, 747328.3373, 746067.7484, 758396.0948, 804715.6966, 721922.6292, 739887.2698, 
            719513.1992, 749816.2668, 768455.9479, 750904.0065, 752289.5984, 739157.0464, 792339.494, 755359.5512, 754234.7507, 
            786054.2296, 743545.7651, 751099.5612]

wkdir = "/Users/yolandatiao/Desktop/jycATAC/RNAseq/TPMs"
os.chdir(wkdir)

infile = "all_gnTPM_true.csv"
outfile = "all_gnTPM_true_rescale.csv"

with open(infile, "r") as fin:
    with open(outfile, "w") as fout:
        rfin = csv.reader(fin, delimiter=",")
        wfout = csv.writer(fout, delimiter=",")
        wfout.writerow(next(rfin))
        for row in rfin:
            for x in range(0, len(row)):
                if row[x] == "":
                    row[x] = 0
            rownum = [float(i) for i in row[1:]]
            newrow = [row[0]]
            for x in range(0,len(rownum)):
                newrow.append(rownum[x]*1000000/tpm_sums[x])
            wfout.writerow(newrow)

        
        
###----- Filter
'''
wkdir = "/Users/yolandatiao/Desktop/jycATAC/RNAseq/TPMs"
os.chdir(wkdir)

infile = "all_gnTPM_true_rescale.csv"
outfile = "all_gnTPM_true_rescale_c10.csv"


with open(infile, "r") as fin:
    with open(outfile, "w") as fout:
        rfin = csv.reader(fin, delimiter=",")
        wfout = csv.writer(fout, delimiter=",")
        wfout.writerow(next(rfin))
        for row in rfin:
            rownum = [float(i) for i in row[1:]]
            if max(rownum) > 10:
                wfout.writerow(row)
'''

###----- Make column description table
'''
colinfo = ascii.read("all_gnTPM_col_description.csv")
gse_all = ascii.read("gse_all_sets.csv")

newtab = join(colinfo, gse_all, join_type="left")
ascii.write(newtab, "all_gnTPM_col_info.csv", format="csv")
'''

colinfo = ascii.read("all_gnTPM_col_info.csv")
colinfo_name = list(colinfo["Name"])
infile = "all_gnTPM_cols.csv"
outfile = "all_gnTPM_col_description.csv"

with open(infile, "r") as fin:
    with open(outfile, "w") as fout:
        rfin = csv.reader(fin, delimiter=",")
        wfout = csv.writer(fout, delimiter=",")
        next(rfin)
        wfout.writerow(["Name", "Group", "Type", "SubType"])
        for row in rfin:
            if row[0] in colinfo_name:
                idx = colinfo_name.index(row[0])
                wfout.writerow(colinfo[idx])
            







       


