# Usage: Rscript plotPerformancePT.R

library(reshape2)
library('ggplot2')
library('ggpubr')
setwd("/Users/kamheungsze/Desktop/Figure2/pocket/")
data1<-read.csv(file="correlation_lm_Cyscore.csv",header = T,sep=",")
data2<-read.csv(file="correlation_lm_Xscore.csv",header = T,sep=",")
data3<-read.csv(file="correlation_RF_Cyscore.csv",header = T,sep=",")
data4<-read.csv(file="correlation_RF_Xscore.csv",header = T,sep=",")
data5<-read.csv(file="correlation_RF_Cy_Xscore_Vina.csv",header = T,sep=",")
data6<-read.csv(file="correlation_RF_Vina.csv",header = T,sep=",")
data7<-read.csv(file="correlation_lm_Vina.csv",header = T,sep=",")
data9<-read.csv(file="number_cutoff_pocket.csv",header = F,sep="\t")

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
p1<-ggplot(data=myRs, aes(x=Similaritycutoff, y=Rs, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="Rs",breaks=c(0.4,0.5,0.6,0.7),limits=c(0.35,0.72))+scale_x_reverse(name="Pocket topology dissimilarity cutoff with \n increasingly similar pockets",breaks=c(10.0,9.0,8.0,7.0,6.0,5.0,4.0,3.0,2.0,1.0,0.0))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p1

Rs<-data.frame(Numberoftrainingcomplexes,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRs<-melt(Rs,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="Rs")
p2<-ggplot(data=myRs, aes(x=Numberoftrainingcomplexes, y=Rs, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="Rs",breaks=c(0.4,0.5,0.6,0.7),limits=c(0.35,0.72))+scale_x_continuous(name="Number of training complexes with \n increasingly similar pockets", breaks=c(134,500,1000,1500,2000,2500,2764))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p2


##Rp
MLR_Cyscore<-data1[,3]
MLR_Xscore<-data2[,3]
RF_Cyscore<-data3[,3]
RF_Xscore<-data4[,3]
RF_XVC<-data5[,3]
RF_Vina<-data6[,3]
MLR_Vina<-data7[,3]

Rp<-data.frame(Similaritycutoff,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRp<-melt(Rp,id.vars="Similaritycutoff",variable.name="Models",value.name="Rp")
p3<-ggplot(data=myRp, aes(x=Similaritycutoff, y=Rp, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="Rp",breaks=c(0.4,0.5,0.6,0.7),limits=c(0.35,0.72))+scale_x_reverse(name="Pocket topology dissimilarity cutoff with \n increasingly similar pockets",breaks=c(10.0,9.0,8.0,7.0,6.0,5.0,4.0,3.0,2.0,1.0,0.0))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p3

Rp<-data.frame(Numberoftrainingcomplexes,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRp<-melt(Rp,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="Rp")
p4<-ggplot(data=myRp, aes(x=Numberoftrainingcomplexes,y=Rp, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="Rp",breaks=c(0.4,0.5,0.6,0.7),limits=c(0.35,0.72))+scale_x_continuous(name="Number of training complexes with \n increasingly similar pockets", breaks=c(134,500,1000,1500,2000,2500,2764))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
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
p5<-ggplot(data=myRMSE, aes(x=Similaritycutoff, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.6,1.7,1.8,1.9,2.0,2.1),limits =c(1.6,2.125))+scale_x_reverse(name="Pocket topology dissimilarity cutoff with \n increasingly similar pockets",breaks=c(10.0,9.0,8.0,7.0,6.0,5.0,4.0,3.0,2.0,1.0,0.0))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p5

RMSE<-data.frame(Numberoftrainingcomplexes,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRMSE<-melt(RMSE,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="RMSE")
p6<-ggplot(data=myRMSE, aes(x=Numberoftrainingcomplexes, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.6,1.7,1.8,1.9,2.0,2.1),limits =c(1.6,2.125))+scale_x_continuous(name="Number of training complexes with \n increasingly similar pockets",breaks=c(134,500,1000,1500,2000,2500,2764))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p6

#######========================================================================#######

setwd("/Users/kamheungsze/Desktop/v2013_reverse/Figure2/pocket")
data1<-read.csv(file="correlation_lm_Cyscore.csv",header = T,sep=",")
data2<-read.csv(file="correlation_lm_Xscore.csv",header = T,sep=",")
data3<-read.csv(file="correlation_RF_Cyscore.csv",header = T,sep=",")
data4<-read.csv(file="correlation_RF_Xscore.csv",header = T,sep=",")
data5<-read.csv(file="correlation_RF_Cy_Xscore_Vina.csv",header = T,sep=",")
data6<-read.csv(file="correlation_RF_Vina.csv",header = T,sep=",")
data7<-read.csv(file="correlation_lm_Vina.csv",header = T,sep=",")
data9<-read.csv(file="number_cutoff_pocket.reverse.csv",header = F,sep="\t")
data9<-data9[2:52,]
data1<-data1[10:51,]
data2<-data2[10:51,]
data3<-data3[10:51,]
data4<-data4[10:51,]
data5<-data5[10:51,]
data6<-data6[10:51,]
data7<-data7[10:51,]
data9<-data9[10:51,]

Numberoftrainingcomplexes<-data9[,1]
Similaritycutoff<-data1[,1]
Similaritycutoff[42]<-10.2

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
p7<-ggplot(data=myRs, aes(x=Similaritycutoff, y=Rs, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="Rs",breaks=c(0.4,0.5,0.6,0.7),limits=c(0.35,0.72))+scale_x_continuous(name="Pocket topology dissimilarity cutoff with \n increasingly dissimilar pockets",breaks=c(2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p7

Rs<-data.frame(Numberoftrainingcomplexes,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRs<-melt(Rs,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="Rs")
p8<-ggplot(data=myRs, aes(x=Numberoftrainingcomplexes, y=Rs, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="Rs",breaks=c(0.4,0.5,0.6,0.7),limits=c(0.35,0.72))+scale_x_continuous(name="Number of training complexes with \n increasingly dissimilar pockets",breaks=c(397,1000,1500,2000,2500,2764))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p8

##Rp
MLR_Cyscore<-data1[,3]
MLR_Xscore<-data2[,3]
RF_Cyscore<-data3[,3]
RF_Xscore<-data4[,3]
RF_XVC<-data5[,3]
RF_Vina<-data6[,3]
MLR_Vina<-data7[,3]


Rp<-data.frame(Similaritycutoff,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRp<-melt(Rp,id.vars="Similaritycutoff",variable.name="Models",value.name="Rp")
p9<-ggplot(data=myRp, aes(x=Similaritycutoff, y=Rp, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="Rp",breaks=c(0.4,0.5,0.6,0.7),limits=c(0.35,0.72))+scale_x_continuous(name="Pocket topology dissimilarity cutoff with \n increasingly dissimilar pockets",breaks=c(2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p9

Rp<-data.frame(Numberoftrainingcomplexes,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRp<-melt(Rp,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="Rp")
p10<-ggplot(data=myRp, aes(x=Numberoftrainingcomplexes,y=Rp, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="Rp",breaks=c(0.4,0.5,0.6,0.7),limits=c(0.35,0.72))+scale_x_continuous(name="Number of training complexes with \n increasingly dissimilar pockets",breaks=c(397,1000,1500,2000,2500,2764))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
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
p11<-ggplot(data=myRMSE, aes(x=Similaritycutoff, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.6,1.8,2.0,2.2,2.4),limits =c(1.575,2.44))+scale_x_continuous(name="Pocket topology dissimilarity cutoff with \n increasingly dissimilar pockets",breaks=c(2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p11

RMSE<-data.frame(Numberoftrainingcomplexes,MLR_Cyscore,RF_Cyscore,MLR_Xscore,RF_Xscore,MLR_Vina,RF_XVC,RF_Vina)
myRMSE<-melt(RMSE,id.vars="Numberoftrainingcomplexes",variable.name="Models",value.name="RMSE")
p12<-ggplot(data=myRMSE, aes(x=Numberoftrainingcomplexes, y=RMSE, group=Models,color=Models)) +geom_line()+scale_y_continuous(name="RMSE",breaks=c(1.6,1.8,2.0,2.2,2.4),limits =c(1.575,2.44))+scale_x_continuous(name="Number of training complexes with \n increasingly dissimilar pockets",breaks=c(397,1000,1500,2000,2500,2764))+scale_colour_discrete(name="Models",breaks=c("MLR_Xscore","MLR_Vina","MLR_Cyscore","RF_Xscore","RF_Vina","RF_Cyscore","RF_XVC"),labels=c("MLR::Xscore","MLR::Vina","MLR::Cyscore","RF::Xscore","RF::Vina","RF::Cyscore","RF::XVC"))+guides(colour = guide_legend(nrow = 1))
p12

#ggarrange(p3,p1,p5,p4,p2,p6,p10,p8,p12,p9,p7,p11,ncol=3,nrow=4,common.legend = TRUE)
ggarrange(p3,p1,p5,p4,p2,p6,p9,p7,p11,p10,p8,p12,ncol=3,nrow=4,common.legend = TRUE)

