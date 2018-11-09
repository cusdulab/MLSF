# MLSF
Code and data for reproducing the results of machine-learning vs classical scoring functions on a similarity-based benchmark [1].

## rawdata
This directory contains two files: training.tsv and test.tsv.  
The training.tsv file contains 1105 protein-ligand complexes for training.  
The test.tsv file contains 195 protein-ligand complexes for testing.  

## source
This directory contains two subdirectories: eval and plot.
THe eval subdirectory contains Matlab source code and data for building and evaluating scoring functions.  
The plot subdirectory contains Matlab source code and data for plotting Rp, Rs, RMSE figures.  

## results
This directory contains a file and a subdirectory: results.xlsx and plots.  
The results.xlsx file lists all the results in four tables (two similarity measures * two similarity directions).  
The plots subdirectory contains 36 figures in PDF, TIFF and PNG (600 dpi) formats showing and comparing the predictive performance of nine scoring functions.  

## License
MIT License

## References
[1] Hongjian Li, Jiangjun Peng, Pavel Sidorov, Yee Leung, Kwong-Sak Leung, Man-Hon Wong, Gang Lu and Pedro J. Ballester. Classical scoring functions for docking are unable to exploit large volumes of structural and interaction data. Submitted to Bioinformatics.
