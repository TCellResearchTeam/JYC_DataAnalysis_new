################################################################################
#             Convert ENSEMBL-IDs to GeneNames for DEseq output                #
#                              Dependent: DEseq                                #
################################################################################

library(biomaRt)
#listMarts(host="useast.ensembl.org")
#ensembl_us_east = useMart(biomart="ENSEMBL_MART_ENSEMBL", host="useast.ensembl.org")
#head(listDatasets(ensembl_us_east))

#the data set at ensembl that contains all of their mouse data is "mmusculus_gene_ensembl"
#generating a datafram of all the possible attributes you can download from biomaRt
ensembl = useEnsembl(biomart="ensembl", dataset="mmusculus_gene_ensembl")
#attributes_df<-listAttributes(biomart="ensembl")



matchGN <- function(infilename)
{
  infilename <- "test.csv"
  outfilename <- gsub(".csv","_gn.csv",infilename)
  #import our gene information and query against the biomaRt to find our desired attributes
  input <- read.csv(infilename, header = TRUE)
  esblNames <- input[1]
  esblNames
  mart <- useDataset(dataset="mmusculus_gene_ensembl", useMart("ensembl"))
  G_list <- getBM(attributes= c("ensembl_transcript_id","external_gene_name"), values=esblNames, mart = mart)
  G_list
  output <- merge(input, G_list, by.x="name", all.x=TRUE, by.y="ensembl_transcript_id")
  head()
  write.csv(G_list, outfilename, row.names = FALSE)
  
}



setwd("/Users/yolandatiao/Desktop/jycATAC/RNAseq/TPMs")
matchGN(".csv")

