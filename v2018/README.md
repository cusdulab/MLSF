# MLSF machine-learning scoring function
Data for reproducing the results presented in the paper by Li et al. [1].

* `Similarity.xlsx` contains the pairwise similarity matrices for protein structure, ligand fingerprint and pocket topology. This file was derived from running MM-align, OpenBabel and TopMap.
* `Cutoff.xlsx` contains the corresponding numbers of training complexes given specific cutoff values. This file was derived from the `Similarity.xlsx` file.
* `Cutoff.pdf` contains six plots showing the corresponding number of training complexes against cutoff for three similarity metrics in two directions. This file was derived from the `Cutoff.xlsx` file.
* `Feature.xlsx` contains values of six X-Score features, six Vina features and four Cyscore features for the complexes in the PDBbind v2017 refined set and the Blind-2018 test set. This file was derived from running X-Score, Vina and Cyscore.
* `Performance.xlsx` contains Rp, Rs, RMSE values obtained by eight scoring functions when they were trained on nested sets of complexes in two similarity directions. This file was derived from running R on `Feature.xlsx`.
* `Rp.pdf` contains 12 plots showing the Rp performance of eight scoring functions when they were trained on nested sets generated according to three similarity metrics in two directions. This file was derived from running R on `Performance.xlsx`.
* `Rs.pdf` same as above, but Rs instead.
* `RMSE.pdf` same as above, but RMSE instead.

## References
[1] Hongjian Li, Gang Lu, Kam-Heung Sze, Kwong-Sak Leung. Machine-Learning Scoring Functions Trained on Complexes Dissimilar to the Test Set Already Outperform Classical Counterparts on a Blind Benchmark.
