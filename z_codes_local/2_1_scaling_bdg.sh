#!/usr/bin/env bash

cd /gpfs/group/pipkin/jycATAC/MACS2/pileup_bdg/srt_bdg

file_arr=(Bcl6KO_Th1_rep1 Bcl6KO_Th1_rep2 Bcl6KO_Th1_rep3 DKO_Tfh_rep1 DKO_Tfh_rep2 DKO_Tfh_rep3 DKO_Th1_rep1 DKO_Th1_rep2 DKO_Th1_rep3 Naive_rep1 Naive_rep2 Naive_rep3 Prdm1KO_Tfh_rep1 Prdm1KO_Tfh_rep2 Prdm1KO_Tfh_rep3 WT_Tfh_rep1 WT_Tfh_rep2 WT_Tfh_rep3 WT_Th1_rep1 WT_Th1_rep2 WT_Th1_rep3)
file_len=(1.67819e+08 1.88679e+08 1.82007e+08 1.48288e+08 1.67798e+08 1.61383e+08 1.55237e+08 1.7167e+08 1.666e+08 1.57669e+08 1.81344e+08 1.58214e+08 1.59453e+08 1.73242e+08 1.69883e+08 1.55581e+08 1.84872e+08 1.64568e+08 1.66063e+08 1.76908e+08 1.82337e+08)
sc_arr=(5.9588 5.30001 5.49429 6.74363 5.95955 6.19644 6.44176 5.82513 6.0024 6.3424 5.51438 6.32055 6.27144 5.77227 5.8864 6.42752 5.40915 6.07652 6.02181 5.65266 5.48435)


### Rescalling files
for i in $(seq 0 $(expr ${#file_arr[@]} - 1))
do
	sci=${sc_arr[i]}
	filei=${file_arr[i]}_treat_pileup_srt.bdg
	filei_out=${file_arr[i]}_e9-bdgaccuNORM.bdg
	echo $sci
	echo $filei
	awk -v sc_i=$sci  '{printf $1 "\t" $2 "\t" $3 "\t" "%3.1f\n", $4*sc_i}' $filei > $filei_out
done


