# Usage: Rscript plotPerformanceLF.R

library('ggpubr')
library(reshape2)
library('ggplot2')
setwd("/Users/kamheungsze/Desktop/Figure2/ligand/ECFP4")
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
data9<-read.csv(file="number_cutoff_ligand_ECFP4.csv",header = F,sep="\t")
data9<-data9[16:61,]

Similaritycutoff<-data1[,1]
Numberoftrainingcomplexes<-data9[,1]

#Rs
MLR_Cyscore<-data1[,2]
MLR_Xscore<-data2[,2]
RF_Cyscore<-data3[,2]
RF_Xscore<-data4[,2]
RF_XVC<-data5[,2]
RF_Vina<-data6[,2]
MLR_Vina<-data7[,2]

Rs<-data.frame(Similaritycutoff,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRs<-melt(Rs,id.vars="Similaritycutoff",variable.name="Models",value.name="Rs")
p1<-ggplot(data=myRs, aes(x=Similaritycutoff, y=Rs, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="Rs",breaks=c(0.45,0.5,0.6,0.7),limits=c(0.43,0.74))+scale_x_continuous(name="Ligand fingerprint similarity cutoff with \n increasingly similar ligands", breaks=c(0.55,0.6,0.7,0.8,0.9,1.0))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
#theme(legend.position="none")+theme(legend.position="top")
p1

Rs<-data.frame(Numberoftrainingcomplexes,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRs<-melt(Rs,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="Rs")
p2<-ggplot(data=myRs, aes(x=Numberoftrainingcomplexes, y=Rs, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="Rs",breaks=c(0.45,0.5,0.6,0.7),limits=c(0.43,0.74))+scale_x_continuous(name="Number of training complexes with \n increasingly similar ligands", breaks=c(399,1000,1500,2000,2500,2764))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p2

#Rp
MLR_Cyscore<-data1[,3]
MLR_Xscore<-data2[,3]
RF_Cyscore<-data3[,3]
RF_Xscore<-data4[,3]
RF_XVC<-data5[,3]
RF_Vina<-data6[,3]
MLR_Vina<-data7[,3]


Rp<-data.frame(Similaritycutoff,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRp<-melt(Rp,id.vars="Similaritycutoff",variable.name="Models",value.name="Rp")
p3<-ggplot(data=myRp, aes(x=Similaritycutoff, y=Rp, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="Rp",breaks=c(0.45,0.5,0.6,0.7),limits=c(0.43,0.74))+scale_x_continuous(name="Ligand fingerprint similarity cutoff with \n increasingly similar ligands", breaks=c(0.55,0.6,0.7,0.8,0.9,1.0))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
#theme(legend.position="top")
p3

Rp<-data.frame(Numberoftrainingcomplexes,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRp<-melt(Rp,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="Rp")
p4<-ggplot(data=myRp, aes(x=Numberoftrainingcomplexes,y=Rp, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="Rp",breaks=c(0.45,0.5,0.6,0.7),limits=c(0.43,0.74))+scale_x_continuous(name="Number of training complexes with \n increasingly similar ligands",breaks=c(399,1000,1500,2000,2500,2764))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p4

#RMSE
MLR_Cyscore<-data1[,4]
MLR_Xscore<-data2[,4]
RF_Cyscore<-data3[,4]
RF_Xscore<-data4[,4]
RF_XVC<-data5[,4]
RF_Vina<-data6[,4]
MLR_Vina<-data7[,4]


RMSE<-data.frame(Similaritycutoff,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRMSE<-melt(RMSE,id.vars="Similaritycutoff",variable.name="Models",value.name="RMSE")
p5<-ggplot(data=myRMSE, aes(x=Similaritycutoff, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.6,1.7,1.8,1.9,2.0,2.1),limits =c(1.55,2.12))+scale_x_continuous(name="Ligand fingerprint similarity cutoff with \n increasingly similar ligands", breaks=c(0.55,0.6,0.7,0.8,0.9,1.0))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p5

RMSE<-data.frame(Numberoftrainingcomplexes,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRMSE<-melt(RMSE,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="RMSE")
p6<-ggplot(data=myRMSE, aes(x=Numberoftrainingcomplexes, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.6,1.7,1.8,1.9,2.0,2.1),limits =c(1.55,2.12))+scale_x_continuous(name="Number of training complexes with \n increasingly similar ligands",breaks=c(399,1000,1500,2000,2500,2764))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p6

#######========================================================================#######

setwd("/Users/kamheungsze/Desktop/v2013_reverse/Figure2/ligand/ECFP4")
data1<-read.csv(file="correlation_lm_Cyscore.csv",header = T,sep=",")
data1<-rbind(data1[1,],data1[7:51,])
data2<-read.csv(file="correlation_lm_Xscore.csv",header = T,sep=",")
data2<-rbind(data2[1,],data2[7:51,])
data3<-read.csv(file="correlation_RF_Cyscore.csv",header = T,sep=",")
data3<-rbind(data3[1,],data3[7:51,])
data4<-read.csv(file="correlation_RF_Xscore.csv",header = T,sep=",")
data4<-rbind(data4[1,],data4[7:51,])
data5<-read.csv(file="correlation_RF_Cy_Xscore_Vina.csv",header = T,sep=",")
data5<-rbind(data5[1,],data5[7:51,])
data6<-read.csv(file="correlation_RF_Vina.csv",header = T,sep=",")
data6<-rbind(data6[1,],data6[7:51,])
data7<-read.csv(file="correlation_lm_Vina.csv",header = T,sep=",")
data7<-rbind(data7[1,],data7[7:51,])
data9<-read.csv(file="number_cutoff_ligand_ECFP4.csv",header = F,sep="\t")
data9<-rbind(data9[1,],data9[7:51,])

Similaritycutoff<-data1[,1]
Numberoftrainingcomplexes<-data9[,1]
Similaritycutoff[1]<-0.54

#Rs
MLR_Cyscore<-data1[,2]
MLR_Xscore<-data2[,2]
RF_Cyscore<-data3[,2]
RF_Xscore<-data4[,2]
RF_XVC<-data5[,2]
RF_Vina<-data6[,2]
MLR_Vina<-data7[,2]

Rs<-data.frame(Similaritycutoff,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRs<-melt(Rs,id.vars="Similaritycutoff",variable.name="Models",value.name="Rs")
p7<-ggplot(data=myRs, aes(x=Similaritycutoff, y=Rs, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="Rs",breaks=c(0.45,0.5,0.6,0.7),limits=c(0.43,0.74))+scale_x_reverse(name="Ligand fingerprint similarity cutoff with \n increasingly dissimilar ligands",breaks=c(0.55,0.65,0.75,0.85,0.99))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p7

Rs<-data.frame(Numberoftrainingcomplexes,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRs<-melt(Rs,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="Rs")
p8<-ggplot(data=myRs, aes(x=Numberoftrainingcomplexes, y=Rs, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="Rs",breaks=c(0.45,0.5,0.6,0.7),limits=c(0.43,0.74))+scale_x_continuous(name="Number of training complexes with \n increasingly dissimilar ligands",breaks=c(179,500,1000,1500,2000,2500,2764))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p8


#Rp
MLR_Cyscore<-data1[,3]
MLR_Xscore<-data2[,3]
RF_Cyscore<-data3[,3]
RF_Xscore<-data4[,3]
RF_XVC<-data5[,3]
RF_Vina<-data6[,3]
MLR_Vina<-data7[,3]


Rp<-data.frame(Similaritycutoff,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRp<-melt(Rp,id.vars="Similaritycutoff",variable.name="Models",value.name="Rp")
p9<-ggplot(data=myRp, aes(x=Similaritycutoff, y=Rp, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="Rp",breaks=c(0.45,0.5,0.6,0.7),limits=c(0.43,0.74))+scale_x_reverse(name="Ligand fingerprint similarity cutoff with \n increasingly dissimilar ligands",breaks=c(0.55,0.65,0.75,0.85,0.99))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
#theme(legend.position="top")
p9

Rp<-data.frame(Numberoftrainingcomplexes,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRp<-melt(Rp,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="Rp")
p10<-ggplot(data=myRp, aes(x=Numberoftrainingcomplexes,y=Rp, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="Rp",breaks=c(0.45,0.5,0.6,0.7),limits=c(0.43,0.74))+scale_x_continuous(name="Number of training complexes with \n increasingly dissimilar ligands",breaks=c(179,500,1000,1500,2000,2500,2764))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
#theme(legend.position="bottom")+theme(legend.position="top")
p10

#RMSE
MLR_Cyscore<-data1[,4]
MLR_Xscore<-data2[,4]
RF_Cyscore<-data3[,4]
RF_Xscore<-data4[,4]
RF_XVC<-data5[,4]
RF_Vina<-data6[,4]
MLR_Vina<-data7[,4]


RMSE<-data.frame(Similaritycutoff,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRMSE<-melt(RMSE,id.vars="Similaritycutoff",variable.name="Models",value.name="RMSE")
p11<-ggplot(data=myRMSE, aes(x=Similaritycutoff, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.6,1.7,1.8,1.9,2.0,2.1),limits =c(1.55,2.12))+scale_x_reverse(name="Ligand fingerprint similarity cutoff with \n increasingly dissimilar ligands",breaks=c(0.55,0.65,0.75,0.85,0.99))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p11

RMSE<-data.frame(Numberoftrainingcomplexes,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRMSE<-melt(RMSE,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="RMSE")
p12<-ggplot(data=myRMSE, aes(x=Numberoftrainingcomplexes, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.6,1.7,1.8,1.9,2.0,2.1),limits =c(1.55,2.12))+scale_x_continuous(name="Number of training complexes with \n increasingly dissimilar ligands",breaks=c(179,500,1000,1500,2000,2500,2764))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p12

ggarrange(p3,p1,p5,p4,p2,p6,p9,p7,p11,p10,p8,p12,ncol=3,nrow=4,common.legend = TRUE)

