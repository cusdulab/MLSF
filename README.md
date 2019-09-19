# MLSF
Code and data for reproducing the results of machine-learning vs classical scoring functions on a similarity-based benchmark [1].

## rawdata
This directory contains three files: `training.tsv`, `test.tsv` and `ligands.tar.gz`.
* `training.tsv` contains 1105 protein-ligand complexes for training.
* `test.tsv` contains 195 protein-ligand complexes for testing.
* `ligands.tar.gz` contains 1300 ligands in PDBbind v2007 refined set.

## source
This directory contains two subdirectories: `eval` and `plot`.
* `eval` contains Matlab source code, python notebook and data for building and evaluating scoring functions.
* `plot` contains Matlab source code and data for plotting Rp, Rs, RMSE figures.

## results
This directory contains a file and a subdirectory: `results.xlsx` and `plots`.
* `results.xlsx` lists all the results in six tables (three similarity measures * two similarity directions).
* `plots` contains figures in PDF and PNG (600 dpi) formats showing and comparing the predictive performance of nine scoring functions.

## License
MIT License

## References
[1] Hongjian Li, Jiangjun Peng, Pavel Sidorov, Yee Leung, Kwong-Sak Leung, Man-Hon Wong, Gang Lu and Pedro J. Ballester. Classical scoring functions for docking are unable to exploit large volumes of structural and interaction data. Bioinformatics, btz183, 2019. [DOI: 10.1093/bioinformatics/btz183]: https://doi.org/10.1093/bioinformatics/btz183
