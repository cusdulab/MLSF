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

## Code
This directory contains Perl and R source code and bash scripts implementing the extraction of features from complexes, partitioning of training data according to cutoff values, building and evaluating MLR and RF models, and plotting performance figures.
* `extractFeatures.sh` extracts Cyscore, X-Score and Vina features from the complexes.
* `calculateSimilarity.sh` calculates pairwise similarity matrices between training complexes and test complexes under the three measures of protein structure, ligand fingerprint and pocket topology.
* `generateSubsetIds.pl` determines the id of training complexes given a range of similarity cutoff values.
* `generateSubsetFeatures.sh` generates nested training sets populated with features.
* `lm.R` builds multiple linear regression models on the training set and evaluates them on the test set.
* `rf.R` builds random forest models on the training set and evaluates them on the test set.
* `pipeline.sh` runs the above scripts in order.
* `plotPerformance{PS,LF,PT}` plots the performance figures (3 columns by 4 rows) under the three measures of protein structure (PS), ligand fingerprint (LF) and pocket topology (PT).

## References
[1] Kam-Heung Sze, Zhiqiang Xiong, Jinlong Ma, Gang Lu, Wai-Yee Chan, Hongjian Li. Influence of data similarity on the scoring power of machine-learning scoring functions for docking. Submitted to the 11th International Conference on Bioinformatics Models, Methods and Algorithms.
