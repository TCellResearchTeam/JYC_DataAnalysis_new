#PBS -l mem=30gb

module unload R # Unload older version of R
module load R # Load R/3.5.1, because DiffBind package is installed in R/3.5.1

cd /gpfs/home/hdiao/jycATAC/codes
Rscript 2_0_jycATAC_DiffBind.RetrieveCount.r # Run the R script
