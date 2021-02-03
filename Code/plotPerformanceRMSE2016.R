# Usage: Rscript RMSE.R


#######################===========RMSE==========#######################

#============================= protein =============================#

library('ggpubr')
library(reshape2)
library('ggplot2')
setwd("/Users/shixingda/Desktop/work/drawFigure/V2016_Figure/v2016/protein")
data1<-read.csv(file="correlation_lm_Cyscore.csv",header = T,sep=",")
data1<-data1[11:71,]
data2<-read.csv(file="correlation_lm_Xscore.csv",header = T,sep=",")
data2<-data2[11:71,]
data3<-read.csv(file="correlation_RF_Cyscore.csv",header = T,sep=",")
data3<-data3[11:71,]
data4<-read.csv(file="correlation_RF_Xscore.csv",header = T,sep=",")
data4<-data4[11:71,]
data5<-read.csv(file="correlation_RF_Cy_Xscore_Vina.csv",header = T,sep=",")
data5<-data5[11:71,]
data6<-read.csv(file="correlation_RF_Vina.csv",header = T,sep=",")
data6<-data6[11:71,]
data7<-read.csv(file="correlation_lm_Vina.csv",header = T,sep=",")
data7<-data7[11:71,]
data8<-read.csv(file="correlation_xgboost_Cy_Xscore_Vina.csv",header = T,sep=",")
data8<-data8[11:71,]
data9<-read.csv(file="number_cutoff_protein.csv",header = F,sep="\t")
data9<-data9[11:71,]

Similaritycutoff<-data1[,1]
Numberoftrainingcomplexes<-data9[,1]

#RMSE
MLR_Cyscore<-data1[,4]
MLR_Xscore<-data2[,4]
RF_Cyscore<-data3[,4]
RF_Xscore<-data4[,4]
RF_XVC<-data5[,4]
RF_Vina<-data6[,4]
MLR_Vina<-data7[,4]
XGB_XVC<-data8[,4]

RMSE<-data.frame(Similaritycutoff,MLR_Xscore,MLR_Vina,MLR_Cyscore,RF_Xscore,RF_Vina,RF_Cyscore,RF_XVC,XGB_XVC)
myRMSE<-melt(RMSE,id.vars="Similaritycutoff",variable.name="Models",value.name="RMSE")
p3<-ggplot(data=myRMSE, aes(x=Similaritycutoff, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2),limits =c(1.40,2.21))+scale_x_continuous(name="Protein structure similarity cutoff with \n increasingly similar proteins", breaks=c(0.4,0.5,0.6,0.7,0.8,0.9,1.0))+scale_colour_manual(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC","XGB_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC","XGB::XVC"),values=c("#66CC33","#33CCFF","#FF6666","#00CC99","#FF3399","#CC9933","#9966FF","#3300CC"))+guides(colour = guide_legend(nrow = 1))
p3

RMSE<-data.frame(Numberoftrainingcomplexes,MLR_Xscore,MLR_Vina,MLR_Cyscore,RF_Xscore,RF_Vina,RF_Cyscore,RF_XVC,XGB_XVC)
myRMSE<-melt(RMSE,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="RMSE")
p4<-ggplot(data=myRMSE, aes(x=Numberoftrainingcomplexes, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2),limits =c(1.40,2.21))+scale_x_continuous(name="Number of training complexes with \n increasingly similar proteins",breaks=c(844,1500,2000,2500,3000,3500,3772))+scale_colour_manual(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC","XGB_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC","XGB::XVC"),values=c("#66CC33","#33CCFF","#FF6666","#00CC99","#FF3399","#CC9933","#9966FF","#3300CC"))+guides(colour = guide_legend(nrow = 1))
p4

#============================= ligand =============================#

setwd("/Users/shixingda/Desktop/work/drawFigure/V2016_Figure/v2016/ligand/ECFP4")
data1<-read.csv(file="correlation_lm_Cyscore.csv",header = T,sep=",")
data1<-data1[16:61,]
data2<-read.csv(file="correlation_lm_Xscore.csv",header = T,sep=",")
data2<-data2[16:61,]
data3<-read.csv(file="correlation_RF_Cyscore.csv",header = T,sep=",")
data3<-data3[16:61,]
data4<-read.csv(file="correlation_RF_Xscore.csv",header = T,sep=",")
data4<-data4[16:61,]
data5<-read.csv(file="correlation_RF_Cy_Xscore_Vina.csv",header = T,sep=",")
data5<-data5[16:61,]
data6<-read.csv(file="correlation_RF_Vina.csv",header = T,sep=",")
data6<-data6[16:61,]
data7<-read.csv(file="correlation_lm_Vina.csv",header = T,sep=",")
data7<-data7[16:61,]
data8<-read.csv(file="correlation_xgboost_Cy_Xscore_Vina.csv",header = T,sep=",")
data8<-data8[16:61,]
data9<-read.csv(file="number_cutoff_ligand_ECFP4.csv",header = F,sep="\t")
data9<-data9[16:61,]

Similaritycutoff<-data1[,1]
Numberoftrainingcomplexes<-data9[,1]

#RMSE
MLR_Cyscore<-data1[,4]
MLR_Xscore<-data2[,4]
RF_Cyscore<-data3[,4]
RF_Xscore<-data4[,4]
RF_XVC<-data5[,4]
RF_Vina<-data6[,4]
MLR_Vina<-data7[,4]
XGB_XVC<-data8[,4]

RMSE<-data.frame(Similaritycutoff,MLR_Xscore,MLR_Vina,MLR_Cyscore,RF_Xscore,RF_Vina,RF_Cyscore,RF_XVC,XGB_XVC)
myRMSE<-melt(RMSE,id.vars="Similaritycutoff",variable.name="Models",value.name="RMSE")
p1<-ggplot(data=myRMSE, aes(x=Similaritycutoff, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2),limits =c(1.40,2.21))+scale_x_continuous(name="Ligand fingerprint similarity cutoff with \n increasingly similar ligands", breaks=c(0.55,0.6,0.7,0.8,0.9,1.0))+scale_colour_manual(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC","XGB_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC","XGB::XVC"),values=c("#66CC33","#33CCFF","#FF6666","#00CC99","#FF3399","#CC9933","#9966FF","#3300CC"))+guides(colour = guide_legend(nrow = 1))
p1

RMSE<-data.frame(Numberoftrainingcomplexes,MLR_Xscore,MLR_Vina,MLR_Cyscore,RF_Xscore,RF_Vina,RF_Cyscore,RF_XVC,XGB_XVC)
myRMSE<-melt(RMSE,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="RMSE")
p2<-ggplot(data=myRMSE, aes(x=Numberoftrainingcomplexes, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2),limits =c(1.40,2.21))+scale_x_continuous(name="Number of training complexes with \n increasingly similar ligands",breaks=c(381,1000,1500,2000,2500,3000,3500,3772))+scale_colour_manual(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC","XGB_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC","XGB::XVC"),values=c("#66CC33","#33CCFF","#FF6666","#00CC99","#FF3399","#CC9933","#9966FF","#3300CC"))+guides(colour = guide_legend(nrow = 1))
p2

#============================= pocket =============================#


setwd("/Users/shixingda/Desktop/work/drawFigure/V2016_Figure/v2016/pocket")
data1<-read.csv(file="correlation_lm_Cyscore.csv",header = T,sep=",")
data2<-read.csv(file="correlation_lm_Xscore.csv",header = T,sep=",")
data3<-read.csv(file="correlation_RF_Cyscore.csv",header = T,sep=",")
data4<-read.csv(file="correlation_RF_Xscore.csv",header = T,sep=",")
data5<-read.csv(file="correlation_RF_Cy_Xscore_Vina.csv",header = T,sep=",")
data6<-read.csv(file="correlation_RF_Vina.csv",header = T,sep=",")
data7<-read.csv(file="correlation_lm_Vina.csv",header = T,sep=",")
data8<-read.csv(file="correlation_xgboost_Cy_Xscore_Vina.csv",header = T,sep=",")
data9<-read.csv(file="number_cutoff_pocket.csv",header = F,sep="\t")

Similaritycutoff<-data1[,1]
Numberoftrainingcomplexes<-data9[,1]

#RMSE
MLR_Cyscore<-data1[,4]
MLR_Xscore<-data2[,4]
RF_Cyscore<-data3[,4]
RF_Xscore<-data4[,4]
RF_XVC<-data5[,4]
RF_Vina<-data6[,4]
MLR_Vina<-data7[,4]
XGB_XVC<-data8[,4]

RMSE<-data.frame(Similaritycutoff,MLR_Xscore,MLR_Vina,MLR_Cyscore,RF_Xscore,RF_Vina,RF_Cyscore,RF_XVC,XGB_XVC)
myRMSE<-melt(RMSE,id.vars="Similaritycutoff",variable.name="Models",value.name="RMSE")
p5<-ggplot(data=myRMSE, aes(x=Similaritycutoff, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2),limits =c(1.40,2.21))+scale_x_reverse(name="Pocket topology dissimilarity cutoff with \n increasingly similar pockets",breaks=c(10.0,9.0,8.0,7.0,6.0,5.0,4.0,3.0,2.0,1.0,0.0))+scale_colour_manual(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC","XGB_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC","XGB::XVC"),values=c("#66CC33","#33CCFF","#FF6666","#00CC99","#FF3399","#CC9933","#9966FF","#3300CC"))+guides(colour = guide_legend(nrow = 1))
p5

RMSE<-data.frame(Numberoftrainingcomplexes,MLR_Xscore,MLR_Vina,MLR_Cyscore,RF_Xscore,RF_Vina,RF_Cyscore,RF_XVC,XGB_XVC)
myRMSE<-melt(RMSE,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="RMSE")
p6<-ggplot(data=myRMSE, aes(x=Numberoftrainingcomplexes, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2),limits =c(1.40,2.21))+scale_x_continuous(name="Number of training complexes with \n increasingly similar pockets",breaks=c(374,1000,1500,2000,2500,3000,3500,3772))+scale_colour_manual(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC","XGB_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC","XGB::XVC"),values=c("#66CC33","#33CCFF","#FF6666","#00CC99","#FF3399","#CC9933","#9966FF","#3300CC"))+guides(colour = guide_legend(nrow = 1))
p6

#######==============================reverse===================================#######

#============================= protein =============================#

setwd("/Users/shixingda/Desktop/work/drawFigure/V2016_Figure/v2016_reverse/protein")
data1<-read.csv(file="correlation_lm_Cyscore.csv",header = T,sep=",")
data1<-rbind(data1[1,],data1[12:71,])
data2<-read.csv(file="correlation_lm_Xscore.csv",header = T,sep=",")
data2<-rbind(data2[1,],data2[12:71,])
data3<-read.csv(file="correlation_RF_Cyscore.csv",header = T,sep=",")
data3<-rbind(data3[1,],data3[12:71,])
data4<-read.csv(file="correlation_RF_Xscore.csv",header = T,sep=",")
data4<-rbind(data4[1,],data4[12:71,])
data5<-read.csv(file="correlation_RF_Cy_Xscore_Vina.csv",header = T,sep=",")
data5<-rbind(data5[1,],data5[12:71,])
data6<-read.csv(file="correlation_RF_Vina.csv",header = T,sep=",")
data6<-rbind(data6[1,],data6[12:71,])
data7<-read.csv(file="correlation_lm_Vina.csv",header = T,sep=",")
data7<-rbind(data7[1,],data7[12:71,])
data8<-read.csv(file="correlation_xgboost_Cy_Xscore_Vina.csv",header = T,sep=",")
data8<-rbind(data8[1,],data8[12:71,])
data9<-read.csv(file="number_cutoff_protein.csv",header = F,sep="\t")
data9<-rbind(data9[1,],data9[12:71,])

Numberoftrainingcomplexes<-data9[,1]
Similaritycutoff<-data1[,1]
Similaritycutoff[1]<-0.39

#RMSE
MLR_Cyscore<-data1[,4]
MLR_Xscore<-data2[,4]
RF_Cyscore<-data3[,4]
RF_Xscore<-data4[,4]
RF_XVC<-data5[,4]
RF_Vina<-data6[,4]
MLR_Vina<-data7[,4]
XGB_XVC<-data8[,4]

RMSE<-data.frame(Similaritycutoff,MLR_Xscore,MLR_Vina,MLR_Cyscore,RF_Xscore,RF_Vina,RF_Cyscore,RF_XVC,XGB_XVC)
myRMSE<-melt(RMSE,id.vars="Similaritycutoff",variable.name="Models",value.name="RMSE")
p9<-ggplot(data=myRMSE, aes(x=Similaritycutoff, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2),limits =c(1.40,2.21))+scale_x_reverse(name="Protein structure similarity cutoff with \n increasingly dissimilar proteins",breaks=c(0.40,0.49,0.59,0.69,0.79,0.89,0.99))+scale_colour_manual(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC","XGB_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC","XGB::XVC"),values=c("#66CC33","#33CCFF","#FF6666","#00CC99","#FF3399","#CC9933","#9966FF","#3300CC"))+guides(colour = guide_legend(nrow = 1))
p9

RMSE<-data.frame(Numberoftrainingcomplexes,MLR_Xscore,MLR_Vina,MLR_Cyscore,RF_Xscore,RF_Vina,RF_Cyscore,RF_XVC,XGB_XVC)
myRMSE<-melt(RMSE,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="RMSE")
p10<-ggplot(data=myRMSE, aes(x=Numberoftrainingcomplexes, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2),limits =c(1.40,2.21))+scale_x_continuous(name="Number of training complexes with \n increasingly dissimilar proteins",breaks=c(1033,1500,2000,2500,3000,3500,3772))+scale_colour_manual(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC","XGB_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC","XGB::XVC"),values=c("#66CC33","#33CCFF","#FF6666","#00CC99","#FF3399","#CC9933","#9966FF","#3300CC"))+guides(colour = guide_legend(nrow = 1))
p10

#============================= ligand =============================#

setwd("/Users/shixingda/Desktop/work/drawFigure/V2016_Figure/v2016_reverse/ligand/ECFP4")
data1<-read.csv(file="correlation_lm_Cyscore.csv",header = T,sep=",")
data1<-rbind(data1[1,],data1[17:61,])
data2<-read.csv(file="correlation_lm_Xscore.csv",header = T,sep=",")
data2<-rbind(data2[1,],data2[17:61,])
data3<-read.csv(file="correlation_RF_Cyscore.csv",header = T,sep=",")
data3<-rbind(data3[1,],data3[17:61,])
data4<-read.csv(file="correlation_RF_Xscore.csv",header = T,sep=",")
data4<-rbind(data4[1,],data4[17:61,])
data5<-read.csv(file="correlation_RF_Cy_Xscore_Vina.csv",header = T,sep=",")
data5<-rbind(data5[1,],data5[17:61,])
data6<-read.csv(file="correlation_RF_Vina.csv",header = T,sep=",")
data6<-rbind(data6[1,],data6[17:61,])
data7<-read.csv(file="correlation_lm_Vina.csv",header = T,sep=",")
data7<-rbind(data7[1,],data7[17:61,])
data8<-read.csv(file="correlation_xgboost_Cy_Xscore_Vina.csv",header = T,sep=",")
data8<-rbind(data8[1,],data8[17:61,])
data9<-read.csv(file="number_cutoff_ligand_ECFP4.csv",header = F,sep="\t")
data9<-rbind(data9[1,],data9[17:61,])

Similaritycutoff<-data1[,1]
Numberoftrainingcomplexes<-data9[,1]
Similaritycutoff[1]<-0.54

#RMSE
MLR_Cyscore<-data1[,4]
MLR_Xscore<-data2[,4]
RF_Cyscore<-data3[,4]
RF_Xscore<-data4[,4]
RF_XVC<-data5[,4]
RF_Vina<-data6[,4]
MLR_Vina<-data7[,4]
XGB_XVC<-data8[,4]

RMSE<-data.frame(Similaritycutoff,MLR_Xscore,MLR_Vina,MLR_Cyscore,RF_Xscore,RF_Vina,RF_Cyscore,RF_XVC,XGB_XVC)
myRMSE<-melt(RMSE,id.vars="Similaritycutoff",variable.name="Models",value.name="RMSE")
p7<-ggplot(data=myRMSE, aes(x=Similaritycutoff, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2),limits =c(1.40,2.21))+scale_x_reverse(name="Ligand fingerprint similarity cutoff with \n increasingly dissimilar ligands",breaks=c(0.55,0.59,0.69,0.79,0.89,0.99))+scale_colour_manual(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC","XGB_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC","XGB::XVC"),values=c("#66CC33","#33CCFF","#FF6666","#00CC99","#FF3399","#CC9933","#9966FF","#3300CC"))+guides(colour = guide_legend(nrow = 1))
p7

RMSE<-data.frame(Numberoftrainingcomplexes,MLR_Xscore,MLR_Vina,MLR_Cyscore,RF_Xscore,RF_Vina,RF_Cyscore,RF_XVC,XGB_XVC)
myRMSE<-melt(RMSE,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="RMSE")
p8<-ggplot(data=myRMSE, aes(x=Numberoftrainingcomplexes, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2),limits =c(1.40,2.21))+scale_x_continuous(name="Number of training complexes with \n increasingly dissimilar ligands",breaks=c(246,500,1000,1500,2000,2500,3000,3500,3772))+scale_colour_manual(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC","XGB_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC","XGB::XVC"),values=c("#66CC33","#33CCFF","#FF6666","#00CC99","#FF3399","#CC9933","#9966FF","#3300CC"))+guides(colour = guide_legend(nrow = 1))
p8

#============================= pocket =============================#

setwd("/Users/shixingda/Desktop/work/drawFigure/V2016_Figure/v2016_reverse/pocket")
data1<-read.csv(file="correlation_lm_Cyscore.csv",header = T,sep=",")
data2<-read.csv(file="correlation_lm_Xscore.csv",header = T,sep=",")
data3<-read.csv(file="correlation_RF_Cyscore.csv",header = T,sep=",")
data4<-read.csv(file="correlation_RF_Xscore.csv",header = T,sep=",")
data5<-read.csv(file="correlation_RF_Cy_Xscore_Vina.csv",header = T,sep=",")
data6<-read.csv(file="correlation_RF_Vina.csv",header = T,sep=",")
data7<-read.csv(file="correlation_lm_Vina.csv",header = T,sep=",")
data8<-read.csv(file="correlation_xgboost_Cy_Xscore_Vina.csv",header = T,sep=",")
data9<-read.csv(file="number_cutoff_pocket.reverse.csv",header = F,sep="\t")
data9<-data9[2:52,]
data1<-data1[10:51,]
data2<-data2[10:51,]
data3<-data3[10:51,]
data4<-data4[10:51,]
data5<-data5[10:51,]
data6<-data6[10:51,]
data7<-data7[10:51,]
data8<-data8[10:51,]
data9<-data9[10:51,]

Numberoftrainingcomplexes<-data9[,1]
Similaritycutoff<-data1[,1]
Similaritycutoff[42]<-10.2

#RMSE
MLR_Cyscore<-data1[,4]
MLR_Xscore<-data2[,4]
RF_Cyscore<-data3[,4]
RF_Xscore<-data4[,4]
RF_XVC<-data5[,4]
RF_Vina<-data6[,4]
MLR_Vina<-data7[,4]
XGB_XVC<-data8[,4]

RMSE<-data.frame(Similaritycutoff,MLR_Xscore,MLR_Vina,MLR_Cyscore,RF_Xscore,RF_Vina,RF_Cyscore,RF_XVC,XGB_XVC)
myRMSE<-melt(RMSE,id.vars="Similaritycutoff",variable.name="Models",value.name="RMSE")
p11<-ggplot(data=myRMSE, aes(x=Similaritycutoff, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2),limits =c(1.40,2.21))+scale_x_continuous(name="Pocket topology dissimilarity cutoff with \n increasingly dissimilar pockets",breaks=c(2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0))+scale_colour_manual(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC","XGB_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC","XGB::XVC"),values=c("#66CC33","#33CCFF","#FF6666","#00CC99","#FF3399","#CC9933","#9966FF","#3300CC"))+guides(colour = guide_legend(nrow = 1))
p11

RMSE<-data.frame(Numberoftrainingcomplexes,MLR_Xscore,MLR_Vina,MLR_Cyscore,RF_Xscore,RF_Vina,RF_Cyscore,RF_XVC,XGB_XVC)
myRMSE<-melt(RMSE,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="RMSE")
p12<-ggplot(data=myRMSE, aes(x=Numberoftrainingcomplexes, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2),limits =c(1.40,2.21))+scale_x_continuous(name="Number of training complexes with \n increasingly dissimilar pockets",breaks=c(570,1000,1500,2000,2500,3000,3500,3772))+scale_colour_manual(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC","XGB_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC","XGB::XVC"),values=c("#66CC33","#33CCFF","#FF6666","#00CC99","#FF3399","#CC9933","#9966FF","#3300CC"))+guides(colour = guide_legend(nrow = 1))
p12

#ggarrange(p3,p1,p5,p4,p2,p6,p10,p8,p12,p9,p7,p11,ncol=3,nrow=4,common.legend = TRUE)
ggarrange(p3,p1,p5,p4,p2,p6,p9,p7,p11,p10,p8,p12,ncol=3,nrow=4,common.legend = TRUE)

#17*27(Landscape)
