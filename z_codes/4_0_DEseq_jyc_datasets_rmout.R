library(DESeq2)


########## 1 Read all count data into a dataframe and export
wkdir <- "/Users/yolandatiao/Desktop/jycATAC/3_HTseqCount/jyc"
setwd(wkdir)
file.names <- dir(wkdir, pattern =".tpm")
file.names <- file.names[!file.names== "Naive_rep2_Tn5.srt.tpm"]

DKO.1 <- read.table("DKO_Tfh_rep1_Tn5.srt.tpm", sep = '\t',header = FALSE)
peaknames <- DKO.1$V1

all.df <- data.frame(DKO.1$V1)

for(i in file.names){
  new.tab <- read.table(i, sep = '\t',header = FALSE )
  all.df <- cbind(all.df, new.tab$V2)
}

all.colnames <- gsub("_Tn5.srt.tpm", "", file.names)
all.colnames <- gsub("rep", "", all.colnames)
all.colnames <- gsub("-", "_", all.colnames)
all.colnames <- c("peak_name", all.colnames)

colnames(all.df) <- all.colnames
rownames(all.df) <- all.df$peak_name
all.df$peak_name <- NULL

write.csv(all.df, file="jyc.all.df_rmout.csv")

########## 2 Create: int dataframe
all.df.numx <- as.data.frame(lapply(all.df, as.integer))
rownames(all.df.numx) <- rownames(all.df)
head(all.df.numx)
write.csv(all.df.numx, file="jyc.all.df_rmout.int.csv")


########## 3 Create: subset datafram
max.num <- numeric(nrow(all.df))
for (i in c(1:nrow(all.df))){
  max.num[i] <- max(all.df[i,])
}

all.df <- cbind(all.df, max.num)
write.csv(all.df, file="jyc.all.df_rmout.max.csv")

all.df.numx <- cbind(all.df.numx, max.num)
write.csv(all.df.numx, file="jyc.all.df_rmout.int.max.csv")

all.df.numx.c5 <- subset(all.df.numx, all.df.numx$max.num >=5 )
all.df.numx.c5$max.num <- NULL
write.csv(all.df.numx.c5, file="jyc.all.df_rmout.int.max.c5.csv")

########## 4 DEseq
all.df.numx.c5 <- read.csv("jyc.all.df_rmout.int.max.c5.csv")
rownames(all.df.numx.c5) <- all.df.numx.c5$X
all.df.numx.c5$X <- NULL
conds <- gsub("_1", "", colnames(all.df.numx.c5))
conds <- gsub("_2", "", conds)
conds <- gsub("_3", "", conds)
conds
all.df.numx.c5.design <- data.frame(row.names=colnames(all.df.numx.c5), condition=as.factor(conds))
all.df.numx.c5.DES<-DESeqDataSetFromMatrix(countData = all.df.numx.c5, colData = all.df.numx.c5.design,design = ~ condition)
all.df.numx.c5.DES<-DESeq(all.df.numx.c5.DES)

###----- Write reports
Bcl6KO_Th1_vs_Naive <-results(all.df.numx.c5.DES, contrast = c("condition", "Bcl6KO_Th1", "Naive")) 
DKO_Th1_vs_Naive <-results(all.df.numx.c5.DES, contrast = c("condition", "DKO_Th1", "Naive")) 
WT_Th1_vs_Naive <-results(all.df.numx.c5.DES, contrast = c("condition", "WT_Th1", "Naive")) 
DKO_Tfh_vs_Naive <-results(all.df.numx.c5.DES, contrast = c("condition", "DKO_Tfh", "Naive")) 
Prdm1KO_Tfh_vs_Naive <-results(all.df.numx.c5.DES, contrast = c("condition", "Prdm1KO_Tfh", "Naive")) 
STAT4_KO_Tfh_vs_Naive <-results(all.df.numx.c5.DES, contrast = c("condition", "STAT4_KO_Tfh", "Naive")) 
STAT4_WT_Tfh_vs_Naive <-results(all.df.numx.c5.DES, contrast = c("condition", "STAT4_WT_Tfh", "Naive")) 
WT_Tfh_vs_Naive <-results(all.df.numx.c5.DES, contrast = c("condition", "WT_Tfh", "Naive")) 
Bcl6KO_Th1_vs_WT_Th1 <-results(all.df.numx.c5.DES, contrast = c("condition", "Bcl6KO_Th1", "WT_Th1")) 
DKO_Th1_vs_WT_Th1 <-results(all.df.numx.c5.DES, contrast = c("condition", "DKO_Th1", "WT_Th1")) 
DKO_Tfh_vs_WT_Tfh <-results(all.df.numx.c5.DES, contrast = c("condition", "DKO_Tfh", "WT_Tfh")) 
Prdm1KO_Tfh_vs_WT_Tfh <-results(all.df.numx.c5.DES, contrast = c("condition", "Prdm1KO_Tfh", "WT_Tfh")) 
STAT4_KO_Tfh_vs_WT_Tfh <-results(all.df.numx.c5.DES, contrast = c("condition", "STAT4_KO_Tfh", "WT_Tfh")) 
STAT4_WT_Tfh_vs_WT_Tfh <-results(all.df.numx.c5.DES, contrast = c("condition", "STAT4_WT_Tfh", "WT_Tfh")) 
DKO_Tfh_vs_WT_Th1 <-results(all.df.numx.c5.DES, contrast = c("condition", "DKO_Tfh", "WT_Th1")) 
Prdm1KO_Tfh_vs_WT_Th1 <-results(all.df.numx.c5.DES, contrast = c("condition", "Prdm1KO_Tfh", "WT_Th1")) 
STAT4_KO_Tfh_vs_WT_Th1 <-results(all.df.numx.c5.DES, contrast = c("condition", "STAT4_KO_Tfh", "WT_Th1")) 
STAT4_WT_Tfh_vs_WT_Th1 <-results(all.df.numx.c5.DES, contrast = c("condition", "STAT4_WT_Tfh", "WT_Th1")) 
WT_Tfh_vs_WT_Th1 <-results(all.df.numx.c5.DES, contrast = c("condition", "WT_Tfh", "WT_Th1")) 
Bcl6KO_Th1_vs_WT_Tfh <-results(all.df.numx.c5.DES, contrast = c("condition", "Bcl6KO_Th1", "WT_Tfh")) 
DKO_Th1_vs_WT_Tfh <-results(all.df.numx.c5.DES, contrast = c("condition", "DKO_Th1", "WT_Tfh")) 
DKO_Tfh_vs_Prdm1KO_Tfh <-results(all.df.numx.c5.DES, contrast = c("condition", "DKO_Tfh", "Prdm1KO_Tfh")) 
DKO_Th1_vs_Bcl6KO_Th1 <- results(all.df.numx.c5.DES, contrast = c("condition", "DKO_Th1", "Bcl6KO_Th1"))

write.csv(Bcl6KO_Th1_vs_Naive ,"all.df.numx.c5-Bcl6KO_Th1_vs_Naive_rmout.csv")
write.csv(DKO_Th1_vs_Naive ,"all.df.numx.c5-DKO_Th1_vs_Naive_rmout.csv")
write.csv(WT_Th1_vs_Naive ,"all.df.numx.c5-WT_Th1_vs_Naive_rmout.csv")
write.csv(DKO_Tfh_vs_Naive ,"all.df.numx.c5-DKO_Tfh_vs_Naive_rmout.csv")
write.csv(Prdm1KO_Tfh_vs_Naive ,"all.df.numx.c5-Prdm1KO_Tfh_vs_Naive_rmout.csv")
write.csv(STAT4_KO_Tfh_vs_Naive ,"all.df.numx.c5-STAT4_KO_Tfh_vs_Naive_rmout.csv")
write.csv(STAT4_WT_Tfh_vs_Naive ,"all.df.numx.c5-STAT4_WT_Tfh_vs_Naive_rmout.csv")
write.csv(WT_Tfh_vs_Naive ,"all.df.numx.c5-WT_Tfh_vs_Naive_rmout.csv")
write.csv(Bcl6KO_Th1_vs_WT_Th1 ,"all.df.numx.c5-Bcl6KO_Th1_vs_WT_Th1_rmout.csv")
write.csv(DKO_Th1_vs_WT_Th1 ,"all.df.numx.c5-DKO_Th1_vs_WT_Th1_rmout.csv")
write.csv(DKO_Tfh_vs_WT_Tfh ,"all.df.numx.c5-DKO_Tfh_vs_WT_Tfh_rmout.csv")
write.csv(Prdm1KO_Tfh_vs_WT_Tfh ,"all.df.numx.c5-Prdm1KO_Tfh_vs_WT_Tfh_rmout.csv")
write.csv(STAT4_KO_Tfh_vs_WT_Tfh ,"all.df.numx.c5-STAT4_KO_Tfh_vs_WT_Tfh_rmout.csv")
write.csv(STAT4_WT_Tfh_vs_WT_Tfh ,"all.df.numx.c5-STAT4_WT_Tfh_vs_WT_Tfh_rmout.csv")
write.csv(DKO_Tfh_vs_WT_Th1 ,"all.df.numx.c5-DKO_Tfh_vs_WT_Th1_rmout.csv")
write.csv(Prdm1KO_Tfh_vs_WT_Th1 ,"all.df.numx.c5-Prdm1KO_Tfh_vs_WT_Th1_rmout.csv")
write.csv(STAT4_KO_Tfh_vs_WT_Th1 ,"all.df.numx.c5-STAT4_KO_Tfh_vs_WT_Th1_rmout.csv")
write.csv(STAT4_WT_Tfh_vs_WT_Th1 ,"all.df.numx.c5-STAT4_WT_Tfh_vs_WT_Th1_rmout.csv")
write.csv(WT_Tfh_vs_WT_Th1 ,"all.df.numx.c5-WT_Tfh_vs_WT_Th1_rmout.csv")
write.csv(Bcl6KO_Th1_vs_WT_Tfh ,"all.df.numx.c5-Bcl6KO_Th1_vs_WT_Tfh_rmout.csv")
write.csv(DKO_Th1_vs_WT_Tfh ,"all.df.numx.c5-DKO_Th1_vs_WT_Tfh_rmout.csv")
write.csv(DKO_Tfh_vs_Prdm1KO_Tfh ,"all.df.numx.c5-DKO_Tfh_vs_Prdm1KO_Tfh_rmout.csv")
write.csv(DKO_Th1_vs_Bcl6KO_Th1 ,"all.df.numx.c5-DKO_Th1_vs_Bcl6KO_Th1_rmout.csv")




