# MLSF machine-learning scoring function
Code for reproducing the results presented in the paper by Sze et al. [1] and the paper by Li et al. [2].

This directory contains Perl and R source code and bash scripts implementing the extraction of features from complexes, partitioning of training data according to cutoff values, building and evaluating MLR and RF models, and plotting performance figures.
* `extractFeatures.sh` extracts Cyscore, X-Score and Vina features from the complexes.
* `calculateSimilarity.sh` calculates pairwise similarity matrices between training complexes and test complexes under the three measures of protein structure, ligand fingerprint and pocket topology.
* `generateSubsetIds.pl` determines the id of training complexes given a range of similarity cutoff values.
* `generateSubsetFeatures.sh` generates nested training sets populated with features.
* `lm.R` builds multiple linear regression models on the training set and evaluates them on the test set.
* `rf.R` builds random forest models on the training set and evaluates them on the test set.
* `xgb.R` builds xgboost models on the training set and evaluates them on the test set.
* `runPipeline.sh` runs the above scripts in order.
* `plotPerformance{PS,LF,PT}.R` plots the performance figures (3 columns by 4 rows) under the three measures of protein structure (PS), ligand fingerprint (LF) and pocket topology (PT).

## References
[1] Kam-Heung Sze, Zhiqiang Xiong, Jinlong Ma, Gang Lu, Wai-Yee Chan, Hongjian Li. Influence of data similarity on the scoring power of machine-learning scoring functions for docking. In Proceedings of the 13th International Joint Conference on Biomedical Engineering Systems and Technologies - Volume 3: BIOINFORMATICS. pp. 85-92, 2020. [DOI: 10.5220/0008873800850092]

[2] Hongjian Li, Gang Lu, Kam-Heung Sze, Kwong-Sak Leung. Machine-Learning Scoring Functions Trained on Complexes Dissimilar to the Test Set Already Outperform Classical Counterparts on a Blind Benchmark.

[DOI: 10.5220/0008873800850092]: https://doi.org/10.5220/0008873800850092
