########## ChIPQC ##########
# Author: Huitian (Yolanda) Diao
# March 22nd, 2019


########## Libraries ##########
library(ChIPQC)

##########---------- Main ----------##########
setwd("/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/7_ChIP")

# Load sampleSheet
samples <- read.csv("ChIPQC_samplesheet.csv")
head(samples)

## Create ChIPQC object
chipObj <- ChIPQC(samples, annotation="mm10")

## Create ChIPQC report
ChIPQCreport(chipObj, reportName="ChIP QC report - Blimp1", reportFolder="ChIPQCreport_Blimp1")