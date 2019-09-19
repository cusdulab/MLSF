# MLSF machine-learning scoring function
Code and data for reproducing the results presented in the paper by Li et al. [1].

## Cutoff
This directory contains three files: `Similarity.xlsx`, `Cutoff.xlsx` and `Cutoff.pdf`.
* `Similarity.xlsx` contains the pairwise similarity matrices for protein structure, ligand fingerprint and pocket topology. This file is derived from running MM-align, OpenBabel and TopMap.
* `Cutoff.xlsx` contains the corresponding numbers of training complexes given a group of specific cutoff values. This file is derived from the `Similarity.xlsx` file.
* `Cutoff.pdf` contains six plots showing the corresponding number of training complexes against cutoff for the three similarity measures in two directions. This file is derived from the `Cutoff.xlsx` file.

## Performance
This directory contains five files: `Feature.xlsx`, `Performance.xlsx`, `Protein structure.pdf`, `Ligand fingerprint.pdf` and `Pocket topology.pdf`.
* `Feature.xlsx` contains values of six X-Score features, six Vina features and four Cyscore features for the 2959 complexes in PDBbind v2013 refined set. This file is derived from running X-Score, Vina and Cyscore.
* `Performance.xlsx` contains Rp, Rs, RMSE values obtained by seven scoring functions when they are trained on nested sets in two similarity directions. This file is derived from running R on `Feature.xlsx`.
* `Protein structure.pdf` contains 12 plots showing the Rp, Rs, RMSE performance of seven scoring functions when they are trained on nested sets generated according to protein structure similarity in two directions. This file is derived from running R on `Performance.xlsx`.
* `Ligand fingerprint.pdf` same as above, but substituting ligand fingerprint similarity instead.
* `Pocket topology.pdf` same as above, but substituting pocket topology similarity instead.

## References
[1] HongjianL Li, Kam-Heung Sze, Gang Lu. Influence of data similarity on the scoring power of machine-learning scoring functions on PDBbind v2013. To be submitted to the 11th International Conference on Bioinformatics Models, Methods and Algorithms.
