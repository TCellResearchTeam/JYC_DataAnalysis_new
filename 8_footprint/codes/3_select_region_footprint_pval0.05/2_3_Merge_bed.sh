#!/bin/bash

wk_dir=/Volumes/Yolanda/jycATAC/JYC_DataAnalysis/8_footprint/1_mpbs_updn/sep

cd $wk_dir

#Bcl6KO_Th1 rep1 2 3      BKO up dn
#Prdm1KO_Tfh rep 1 2 3     PKO up dn
#DKO_Tfh rep 1 2 3      DKO up dn
#DKO_Th1 rep 1 2 3      DKO up dn
#WT_Tfh rep 1 2 3      PKO up dn      DKO up dn
#WT_Th1 rep 1 2 3      BKO up dn      DKO up dn


sp_list=(Bcl6KO_Th1 Prdm1KO_Tfh DKO_Tfh DKO_Th1 WT_Tfh WT_Th1)
cd_list=(BKO PKO DKO)

for i in ${sp_list[@]}
do
	for j in ${cd_list[@]}
	do
		for k in ${i}_rep1*${j}dn.bed
		do
			cat $k >> ${i}_rep1_${j}dn_mpbs.bed
		done
		for k in ${i}_rep2*${j}dn.bed
		do
			cat $k >> ${i}_rep2_${j}dn_mpbs.bed
		done
		for k in ${i}_rep3*${j}dn.bed
		do
			cat $k >> ${i}_rep3_${j}dn_mpbs.bed
		done

		for k in ${i}_rep1*${j}up.bed
		do
			cat $k >> ${i}_rep1_${j}up_mpbs.bed
		done
		for k in ${i}_rep2*${j}up.bed
		do
			cat $k >> ${i}_rep2_${j}up_mpbs.bed
		done
		for k in ${i}_rep3*${j}up.bed
		do
			cat $k >> ${i}_rep3_${j}up_mpbs.bed
		done
	done
done
