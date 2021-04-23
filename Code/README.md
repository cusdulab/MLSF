# MLSF machine-learning scoring function
Code for reproducing the results on CASF-2016 and Blind-2018.

This directory contains Perl and R source code and bash scripts implementing the extraction of features from complexes, partitioning of training data according to cutoff values, building and evaluating MLR and RF models, and plotting performance figures.
* `extractFeatures.sh` extracts Cyscore, X-Score and Vina features from the complexes.
* `calculateSimilarity.sh` calculates pairwise similarity matrices between training complexes and test complexes under the three measures of protein structure, ligand fingerprint and pocket topology.
* `generateSubsetIds.pl` determines the id of training complexes given a range of similarity cutoff values.
* `generateSubsetFeatures.sh` generates nested training sets populated with features.
* `lm.R` builds multiple linear regression models on the training set and evaluates them on the test set.
* `rf.R` builds random forest models on the training set and evaluates them on the test set.
* `xgb.R` builds xgboost models on the training set and evaluates them on the test set.
* `runPipeline.sh` runs the above scripts in order.
* `plotPerformance{Rp,Rs,RMSE}2016.R` plots the Rp, Rs, RMSE performance figures (3 columns by 4 rows). It was used on CASF-2016.
* `plotPerformance{Rp,Rs,RMSE}2018.R` plots the Rp, Rs, RMSE performance figures (3 columns by 4 rows). It was used on Blind-2018.
* `plotScatter2016.R` plots the predicted against the measured binding affinities (3 columns by 3 rows). It was used on CASF-2016.
* `plotScatter2018.R` plots the predicted against the measured binding affinities (3 columns by 3 rows). It was used on Blind-2018.
