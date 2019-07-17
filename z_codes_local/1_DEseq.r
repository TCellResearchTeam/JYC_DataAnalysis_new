################################################################################
#                   Extracting from Salmon quant & DEseq                       #
#                  Original version: Adam Getzler 7/18/17                      #
#                               Edits:Huitian Diao                             #
################################################################################

library(readr)
library(GenomicFeatures)
library(DESeq2)
library(pcaExplorer)
library(org.Mm.eg.db)
library(rjson)
library(tximport)
library(DBI)

##########---------- Setworking directory
setwd("/Volumes/Huitian/Exp124/salmon")

##########---------- Read Quant Files
colData <- read.csv("/Volumes/Huitian/Exp124/meta.csv")
files <- file.path("/Volumes/Huitian/Exp124/salmon",colData$Samples,"quant.sf")
names(files) <- colData$Cond


##########---------- Make table to match EMSU to GeneID
#setwd("/Volumes/Huitian/GSE66763")
#txdb <- makeTxDbFromGFF("/Volumes/Huitian/GSE66763/Homo_sapiens.GRCh38.92.gtf.gz")
#saveDb(txdb, file="Homo_sapiens.GRCh38.92") #Did this once so I dont need to do it again

#txdb <- makeTxDbFromGFF("/Users/yolandatiao/Documents/0_Bioinformatics2017/19_Salmon/Mus_musculus.GRCm38.90.gtf.gz")
#saveDb(txdb, file="Mus_musculus.GRCm38.90") #Did this once so I dont need to do it again


###--- Convert transcript ID to gene ID
txdb <- loadDb("Users/yolandatiao/Documents/0_Bioinformatics2017/19_Salmon/Mus_musculus.GRCm38.90")
k <- keys(txdb, "GENEID")
res <- AnnotationDbi::select(txdb, k, "TXNAME", "GENEID")
tx2gene <- res[,2:1]
# Must make table TX name Gene id to be read
tx2gene

# Drop in freps TURE = ignore verison  # Ignore TX verison stringsplits on . 
txi <- tximport(files, type="salmon", tx2gene=tx2gene, ignoreTxVersion = TRUE) #dropInfReps = TRUE, 

# Construct sampleTable
sampleTable <- data.frame(condition =factor(c("shCD4_1","shChd7_1","shChd7_2","shChd7_3","shCD4_1","shChd7_1","shChd7_2","shChd7_3","shCD19_1")))
rownames(sampleTable) <- colnames(txi$counts)

#import into DESEQ2 framework
dds <- DESeqDataSetFromTximport(txi, sampleTable, ~ condition)
summary(dds)


dds <- DESeq(dds) #RunDESEQ

results<-as.data.frame(results(dds, contrast = c("condition","shChd7_1","shCD4_1"))) # makes the fold change 1st elment is the numerator 2nd denominator 
write.csv(results,"shCD7_1-shCD4_1-Salmon.csv")

results<-as.data.frame(results(dds, contrast = c("condition","shChd7_2","shCD4_1"))) # makes the fold change 1st elment is the numerator 2nd denominator 
write.csv(results,"shCD7_2-shCD4_1-Salmon.csv")

results<-as.data.frame(results(dds, contrast = c("condition","shChd7_3","shCD4_1"))) # makes the fold change 1st elment is the numerator 2nd denominator 
write.csv(results,"shCD7_3-shCD4_1-Salmon.csv")

results<-as.data.frame(results(dds, contrast = c("condition","shChd7_1","shCD19_1"))) # makes the fold change 1st elment is the numerator 2nd denominator 
write.csv(results,"shCD7_1-shCD19_1-Salmon.csv")

results<-as.data.frame(results(dds, contrast = c("condition","shChd7_2","shCD19_1"))) # makes the fold change 1st elment is the numerator 2nd denominator 
write.csv(results,"shCD7_2-shCD19_1-Salmon.csv")

results<-as.data.frame(results(dds, contrast = c("condition","shChd7_3","shCD19_1"))) # makes the fold change 1st elment is the numerator 2nd denominator 
write.csv(results,"shCD7_3-shCD19_1-Salmon.csv")

results<-as.data.frame(results(dds, contrast = c("condition","shCD19_1","shCD4_1"))) # makes the fold change 1st elment is the numerator 2nd denominator 
write.csv(results,"shCD19_1-shCD4_1-Salmon.csv")



############################################################ Redoanalysis
# Construct sampleTable
sampleTable <- NULL
sampleTable <- data.frame(condition =factor(c("Ctrl","shChd7_1","shChd7_2","shChd7_3","Ctrl","shChd7_1","shChd7_2","shChd7_3","Ctrl")))
rownames(sampleTable) <- colnames(txi$counts)

#import into DESEQ2 framework
dds <- DESeqDataSetFromTximport(txi, sampleTable, ~ condition)
summary(dds)


dds <- DESeq(dds) #RunDESEQ

results<-as.data.frame(results(dds, contrast = c("condition","shChd7_1","Ctrl"))) # makes the fold change 1st elment is the numerator 2nd denominator 
write.csv(results,"shChd7_1-Ctrl-Salmon.csv")

results<-as.data.frame(results(dds, contrast = c("condition","shChd7_2","Ctrl"))) # makes the fold change 1st elment is the numerator 2nd denominator 
write.csv(results,"shChd7_2-Ctrl-Salmon.csv")

results<-as.data.frame(results(dds, contrast = c("condition","shChd7_3","Ctrl"))) # makes the fold change 1st elment is the numerator 2nd denominator 
write.csv(results,"shChd7_3-Ctrl-Salmon.csv")

############################################################ Redoanalysis
# Construct sampleTable
sampleTable <- NULL
sampleTable <- data.frame(condition =factor(c("Ctrl","shChd7","shChd7","shChd7","Ctrl","shChd7","shChd7","shChd7","Ctrl")))
rownames(sampleTable) <- colnames(txi$counts)

#import into DESEQ2 framework
dds <- DESeqDataSetFromTximport(txi, sampleTable, ~ condition)
summary(dds)


dds <- DESeq(dds) #RunDESEQ

results<-as.data.frame(results(dds, contrast = c("condition","shChd7","Ctrl"))) # makes the fold change 1st elment is the numerator 2nd denominator 
write.csv(results,"shChd7-Ctrl-Salmon.csv")






