library(DESeq2)

###--- Config & Info ---###
# This is a script for automatic DEseq
# Only works if you have TWO conditions in the input table
# The sample names in the input tables have to follow: "Condition_number"
wkdir<-"/Volumes/Huitian/Exp122_169_GSE88987/data/7_DEseq2/input_raw_count_tables/Exp169_24-12-6-2"
opdir<-"/Volumes/Huitian/Exp122_169_GSE88987/data/7_DEseq2/input_raw_count_tables/DEseq_results"
###--- Config & Info ---###


###--- Self-defined functions ---###
#--- A function to transform a vector containing input colnames into condition names
# Input colnames have to follow the format: cond_number
rowname_to_cond <- function(rn_list)
{
  cd_list <- character(length(rn_list))
  for(i in 1:length(rn_list))
  {
    rn_list_i_list <- unlist(strsplit(rn_list[i],"_"))
    rn_list_i_cd <- paste(rn_list_i_list[1:length(rn_list_i_list)-1], collapse="_")
    cd_list[i] <- rn_list_i_cd
  }
  return(cd_list)
}


###--- Self-defined functions ---###

#####---------------------------------------- Main START ----------------------------------------#####
setwd(wkdir)
###----- Define deseq function
deseq_run <- function(in_file, outputdir)
{
  filename_list<-unlist(strsplit(in_file,"/"))
  filename_nopath<-as.character(filename_list[length(filename_list)])
  filename_nopath_list<-unlist(strsplit(filename_nopath,"\\."))
  filename_nf<-filename_nopath_list[1]
  filename_nf
  print(filename_nopath)
  
  #--- Read input file
 # print(in_file)
  DeseqData<-read.csv(in_file,header=TRUE, row.names=1)
  rownames<-colnames(DeseqData)
  conds<-rowname_to_cond(rownames)
  conds_u<-unique(conds)
  print(rownames)
  print(conds_u)
  
  DeseqDesign<-data.frame(row.names=rownames,condition=as.factor(conds))
  DESmat<-DESeqDataSetFromMatrix(countData = DeseqData, colData = DeseqDesign,design = ~ condition)
  DESmat<-DESeq(DESmat)
  
  print("Analysis done!!!")
  
  ###--- Output
  setwd(outputdir)

  cts1<-c(c("condition"),conds_u)
  cts2<-c(c("condition"),rev(conds_u))
  
  # Create output file names
  cts1_name_list<-c(c(filename_nf),conds_u)
  cts2_name_list<-c(c(filename_nf),rev(conds_u))
  cts1_name<-paste(cts1_name_list, collapse="_")
  cts2_name<-paste(cts2_name_list, collapse="_")
  cts1_name_f<-paste(cts1_name,"csv",sep=".")
  cts2_name_f<-paste(cts2_name,"csv",sep=".")
  
  out1<-results(DESmat,contrast=cts1)
  out2<-results(DESmat,contrast=cts2)
  
  write.csv(out1,cts1_name_f)
  write.csv(out2,cts2_name_f)

}

###----- Use function
if (False) {
file_list=as.vector(list.files(path=wkdir))
for(i in 1:length(file_list))
{
  setwd(wkdir)
  deseq_run(file_list[i],opdir)
}
}


###--- Generate pair datasets
setwd("/Users/yolandatiao/Desktop/jycATAC/tfh")
DKO.1 <- read.table("DKO_Tfh_rep1_Tn5.srt.tpm", sep = '\t',header = FALSE)
DKO.2 <- read.table("DKO_Tfh_rep2_Tn5.srt.tpm", sep = '\t',header = FALSE)
DKO.3 <- read.table("DKO_Tfh_rep3_Tn5.srt.tpm", sep = '\t',header = FALSE)
Prdm1KO.1 <- read.table("Prdm1KO_Tfh_rep1_Tn5.srt.tpm", sep = '\t',header = FALSE)
Prdm1KO.2 <- read.table("Prdm1KO_Tfh_rep2_Tn5.srt.tpm", sep = '\t',header = FALSE)
Prdm1KO.3 <- read.table("Prdm1KO_Tfh_rep3_Tn5.srt.tpm", sep = '\t',header = FALSE)
WT.1 <- read.table("WT_Tfh_rep1_Tn5.srt.tpm", sep = '\t',header = FALSE)
WT.2 <- read.table("WT_Tfh_rep2_Tn5.srt.tpm", sep = '\t',header = FALSE)
WT.3 <- read.table("WT_Tfh_rep3_Tn5.srt.tpm", sep = '\t',header = FALSE)
STAT4WT.1 <- read.table("STAT4_WT_Tfh-1_Tn5.srt.tpm", sep = '\t',header = FALSE)
STAT4WT.2 <- read.table("STAT4_WT_Tfh-2_Tn5.srt.tpm", sep = '\t',header = FALSE)
STAT4KO.1 <- read.table("STAT4_KO_Tfh-1_Tn5.srt.tpm", sep = '\t',header = FALSE)
STAT4KO.2 <- read.table("STAT4_KO_Tfh-1_Tn5.srt.tpm", sep = '\t',header = FALSE)

all.df <- cbind(DKO.1, DKO.2$V2, DKO.3$V2, 
                Prdm1KO.1$V2, Prdm1KO.2$V2, Prdm1KO.3$V2, 
                WT.1$V2,  WT.2$V2,  WT.3$V2,
                STAT4WT.1$V2, STAT4WT.2$V2, STAT4KO.1$V2, STAT4KO.2$V2)
colnames(all.df) <- c("PeakName", "DKO_1", "DKO_2", "DKO_3", "Prdm1KO_1", "Prdm1KO_2", "Prdm1KO_3", "WT_1", "WT_2", "WT_3", "STAT4WT_1", "STAT4WT_2", "STAT4KO_1", "STAT4KO_2")
write.csv(all.df, file="all.df.csv", row.names=FALSE)

#--- Filter dataframe
max.num <- numeric(nrow(all.df))
for (i in c(1:nrow(all.df))){
  max.num[i] <- max(all.df[i,][c(2:14)])
}

all.df <- cbind(all.df, max.num)
all.df.2 <- subset(all.df, all.df$max.num > 2)
all.df.5 <- subset(all.df, all.df$max.num > 5)
dim(all.df)
dim(all.df.2)
dim(all.df.5)
write.csv(all.df.5, file="all.df.c5.csv", row.names=FALSE)

rownames(all.df.5) <- all.df.5[,1]
all.df.5[,1] <- NULL
all.df.5["max.num"] <- NULL
colnames(all.df.5) <- c("DKO_1", "DKO_2", "DKO_3", "Prdm1KO_1", "Prdm1KO_2", "Prdm1KO_3", "WT_1", "WT_2", "WT_3", "STAT4WT_1", "STAT4WT_2", "STAT4KO_1", "STAT4KO_2")

all.df.5.int <- as.data.frame(lapply(all.df.5, as.integer))
colnames(all.df.5.int) <- c("DKO_1", "DKO_2", "DKO_3", "Prdm1KO_1", "Prdm1KO_2", "Prdm1KO_3", "WT_1", "WT_2", "WT_3", "STAT4WT_1", "STAT4WT_2", "STAT4KO_1", "STAT4KO_2")
rownames(all.df.5.int) <- rownames(all.df.5)
head(all.df.5.int)
head(all.df.5)

all.df.5.int.design <-data.frame(row.names=c("DKO_1", "DKO_2", "DKO_3", 
                                         "Prdm1KO_1", "Prdm1KO_2", "Prdm1KO_3", 
                                         "WT_1", "WT_2", "WT_3", 
                                         "STAT4WT_1", "STAT4WT_2", "STAT4KO_1", "STAT4KO_2"),
                             condition=as.factor(c("DKO", "DKO", "DKO", 
                                                   "PKO", "PKO", "PKO", 
                                                   "WT", " WT", " WT", 
                                                   "SWT", "SWT", "SKO", "SKO")) )
all.df.5.int.DES<-DESeqDataSetFromMatrix(countData = all.df.5.int, colData = all.df.5.design,design = ~ condition)

all.df.5.int.DES<-DESeq(all.df.5.int.DES)

all.df.5.int.DKOvs_WT <-results(all.df.5.int.DES, contrast = c("condition","DKO","WT")) 
write.csv(all.df.5.int.DKOvs_WT,"all.df.5.int.DKOvs_WT.csv")

all.df.5.int.Prdm1KOvs_WT <-results(all.df.5.int.DES, contrast = c("condition","PKO","WT")) 
write.csv(all.df.5.int.Prdm1KOvs_WT,"all.df.5.int.Prdm1KOvs_WT.csv")

all.df.5.int.DKOvsPrdm1KO <-results(all.df.5.int.DES, contrast = c("condition","DKO","PKO")) 
write.csv(all.df.5.int.DKOvsPrdm1KO,"DKOvsPrdm1KO.csv")

all.df.5.int.SWTvsWT <-results(all.df.5.int.DES, contrast = c("condition","SWT","WT")) 
write.csv(all.df.5.int.SWTvsWT,"SWTvsWT.csv")

all.df.5.int.SKOvsSWT <-results(all.df.5.int.DES, contrast = c("condition","SKO","SWT")) 
write.csv(all.df.5.int.SKOvsSWT,"SKOvsSWT.csv")
#####---------------------------------------- Main END ----------------------------------------#####


