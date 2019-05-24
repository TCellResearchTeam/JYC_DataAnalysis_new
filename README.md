# JYC_DataAnalysis

## 1. ATAC-seq & ChIP-seq peak visualization
[UCSC custom tracks](http://genome.ucsc.edu/cgi-bin/hgTracks?hgS_doOtherUser=submit&hgS_otherUserName=Huitian%20Diao&hgS_otherUserSessionName=jycATAC)

* All ATAC-seq bdg files (then converted to bw) normalized by __scaling_factor__ calculated by: <br/>
```
accumulation=($(awk '{sum+=(($3-$2)*$4)} END {print sum}' $input_bdg_file)) 
scaling_factor= 1e+09 / $accumulation
```

## 5. Differential ATAC-seq region motif enrichment

__Folder description__: <br/>
> __[Folder]__ 9_Figures_plottingCodes/0_motifHeatMap <br/>
0_only_homer_known: motif enrichment heatmaps with only _homer known motif_ <br/>
1_combined_motifs: motif enrichment heatmaps created with combined _homer known motif_ + _JYC motif_ <br/>

#### 5.1 Motif enrichment percentage
Motif enrichment percentage in significant differential regions (DEseq2 pval < 0.05)

__Naming__: <br/>
>__Condition1_vs_Condition2_up__: Regions that are _more_ accessible in _condition1_ than _condition2_ <br/>
__all_sig_motifs_c25__: Motifs that are selected based on > _25%_ enrichment in any group <br/>
__byfamily__: Spreadsheet for motif enrichment ranked by TF family <br/>

* [vsNaive-dn](9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps/vsNaive-dn_all_sig_motifs_c25_byfamilynew.pdf)
* [vsNaive-up](9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps/vsNaive-up_all_sig_motifs_c25_byfamilynew.pdf)
* [vsTfh-dn](9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps/vsWTTfh-dn_all_sig_motifs_c25_byfamilynew.pdf)
* [vsTfh-up](9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Percentage_Heatmaps/vsWTTfh-up_all_sig_motifs_c25_byfamilynew.pdf)


#### 5.2 Motif enrichment percentage comparison
Motif enrichment in significant differential regions of __Comparison1__ v.s. significant differential regions of __Comparison2__

__Naming__: <br/>
> [Filename]__vs−WT_Tfh_vs_Naive_dn_XXXX.pdf__: All the differential region motif enrichments conditions are compared to enrichment in _WT_Tfh_vs_Naive_dn regions (WT Tfh less accessible than Naiv)_

* [vs-WT_Tfh_vs_Naive_dn](9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Diff_percentage_Heatmaps/vs-WT_Tfh_vs_Naive_dn--all_sig_motifs_c25_byfamilynew.pdf)
* [vs-WT_Tfh_vs_Naive_up](9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Diff_percentage_Heatmaps/vs-WT_Tfh_vs_Naive_up--all_sig_motifs_c25_byfamilynew.pdf)
* [vs-WT_Th1_vs_Naive_dn](9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Diff_percentage_Heatmaps/vs-WT_Th1_vs_Naive_dn--all_sig_motifs_c25_byfamilynew.pdf)
* [vs-WT_Th1_vs_Naive_up](9_Figures_plottingCodes/0_motifHeatMap/1_combined_motifs/Diff_percentage_Heatmaps/vs-WT_Th1_vs_Naive_up--all_sig_motifs_c25_byfamilynew.pdf)

## 6. Motif analysis by gene group
__Folder description__: <br/>
> __[Folder]__ 6_GeneGroupMotifAnalysis <br/>
byGroup: motif analysis of peaks annotated to genes in each group <br/>
byGroup_open: motif analysis of peaks annotated to genes in each group & more accessible in regions that are more accessible in Tfh/Th1 than Naive <br/>

* Main resullts folder: 6_GeneGroupMotifAnalysis/byGroup_open/vsNAVopen_cb_mtfs_motif-finding


# References & Tools
### [RGT (Regulatory Genomics Toolbox)](http://www.regulatory-genomics.org/rgt/basic-introduction/)
* System: Ubuntu, nonGUI, x86_64 [Cyverse Atmosphere Server](https://atmo.cyverse.org/application/dashboard)
* Pre-requisites:
  - [Miniconda3](https://docs.conda.io/en/latest/miniconda.html)
  - [Pip](https://anaconda.org/anaconda/pip)
  - [Gcc](https://anaconda.org/anaconda/gcc)
  - [Setuptools](https://anaconda.org/anaconda/setuptools)
  - [Pybigwig 0.3.12](https://anaconda.org/bioconda/pybigwig)
  - [Pyvcf](https://anaconda.org/bioconda/pyvcf)
  - [HTSeq](https://anaconda.org/bioconda/htseq)
  - [Hmmlearn](https://anaconda.org/omnia/hmmlearn)
  - [Fisher](https://anaconda.org/bioconda/fisher)


![Analysis Overview](https://user-images.githubusercontent.com/26311995/48738302-8fc49800-ec1e-11e8-92d6-f0a4cd55e32e.jpg)
