#!/usr/bin/env Rscript
args=commandArgs(trailingOnly=T)
trn=read.csv("training.csv")
tst=read.csv("test.csv")
fit=lm(pbindaff~Hydrophobic+Vdw+HBond+Ent,trn)
tst["predicted"]=predict(fit,tst)
write.csv(c(tst["PDB"],tst["pbindaff"],tst["predicted"]),row.names=F,quote=F,file="iyp.csv")
