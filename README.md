# MLSF
Code and data for reproducing the results of machine-learning vs classical scoring functions on a similarity-based benchmark [1].

## rawdata
This directory contains three files: `training.tsv`, `test.tsv` and `ligands.tar.gz`.
* `training.tsv` contains 1105 protein-ligand complexes for training.
* `test.tsv` contains 195 protein-ligand complexes for testing.
* `ligands.tar.gz` contains 1300 ligands in PDBbind v2007 refined set.

## source
This directory contains a file and two subdirectories: `XGB-Score.ipynb`, `eval` and `plot`.
* `XGB-Score.ipynb` is the Python Notebook for XGB-Score.
* `eval` contains Matlab source code and data for building and evaluating scoring functions.
* `plot` contains Matlab source code and data for plotting Rp, Rs, RMSE figures.

## results
This directory contains a file and a subdirectory: `results.xlsx` and `plots`.
* `results.xlsx` lists all the results in six tables (three similarity measures * two similarity directions).
* `plots` contains 54 figures in PDF and PNG (600 dpi) formats showing and comparing the predictive performance of nine scoring functions.

## License
MIT License

## References
[1] Hongjian Li, Jiangjun Peng, Pavel Sidorov, Yee Leung, Kwong-Sak Leung, Man-Hon Wong, Gang Lu and Pedro J. Ballester. Classical scoring functions for docking are unable to exploit large volumes of structural and interaction data. Submitted to Bioinformatics.
