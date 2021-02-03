# MLSF machine-learning scoring function
Data for reproducing the results presented in the paper by Sze et al. [1].

* `Similarity.xlsx` contains the pairwise similarity matrices for protein structure, ligand fingerprint and pocket topology. This file was derived from running MM-align, OpenBabel and TopMap.
* `Cutoff.xlsx` contains the corresponding numbers of training complexes given a group of specific cutoff values. This file was derived from the `Similarity.xlsx` file.
* `Cutoff.pdf` contains six plots showing the corresponding number of training complexes against cutoff for the three similarity measures in two directions. This file was derived from the `Cutoff.xlsx` file.
* `Feature.xlsx` contains values of six X-Score features, six Vina features and four Cyscore features for the 2959 complexes in PDBbind v2013 refined set. This file was derived from running X-Score, Vina and Cyscore.
* `Performance.xlsx` contains Rp, Rs, RMSE values obtained by seven scoring functions when they are trained on nested sets in two similarity directions. This file was derived from running R on `Feature.xlsx`.
* `Protein structure.pdf` contains 12 plots showing the Rp, Rs, RMSE performance of seven scoring functions when they are trained on nested sets generated according to protein structure similarity in two directions. This file was derived from running R on `Performance.xlsx`.
* `Ligand fingerprint.pdf` same as above, but substituting ligand fingerprint similarity instead.
* `Pocket topology.pdf` same as above, but substituting pocket topology similarity instead.

## References
[1] Kam-Heung Sze, Zhiqiang Xiong, Jinlong Ma, Gang Lu, Wai-Yee Chan, Hongjian Li. Influence of data similarity on the scoring power of machine-learning scoring functions for docking. In Proceedings of the 13th International Joint Conference on Biomedical Engineering Systems and Technologies - Volume 3: BIOINFORMATICS. pp. 85-92, 2020. [DOI: 10.5220/0008873800850092]

[DOI: 10.5220/0008873800850092]: https://doi.org/10.5220/0008873800850092
