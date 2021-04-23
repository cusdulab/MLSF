library('ggplot2')
library('ggpubr')

pdf("/Users/shixingda/Desktop/ScatterWithHistogram_v2018Test(0.4--0.6)_210422.pdf", width=18, height=18)
# cutoff=0.40
data1<-read.csv(file="/Users/shixingda/Desktop/v2018/lm_result_Xscore_0.40.csv",header = T,sep=",")
p1 <- ggplot(data=data1, aes(x=real,y=predict)) + geom_point(colour="#66CC33")+scale_y_continuous(name="Predicted binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12))+scale_x_continuous(name="Measured binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12)) + labs(title = "MLR::Xscore trained at cutoff=0.40 (N=334) \n N=318, RMSE=1.53, Rp=0.486, Rs=0.537")+geom_abline(intercept = 0,linetype="dashed") + theme(legend.position = "none",plot.title = element_text(size=16,hjust = 0.5,vjust=-1),axis.title.x=element_text(size=16),axis.text.x = element_text(size = 14),axis.title.y =element_text(size=16),axis.text.y = element_text(size = 14))
p1<-ggExtra::ggMarginal(p1, type = "histogram",col = "#FFFFFF", fill = "#66CC33")

data2<-read.csv(file="/Users/shixingda/Desktop/v2018/RF_result_Xscore_0.40.csv",header = T,sep=",")
p2 <- ggplot(data=data2, aes(x=real,y=predict)) + geom_point(colour="#00CC99")+scale_y_continuous(name="Predicted binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12))+scale_x_continuous(name="Measured binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12)) + labs(title = "RF::Xscore trained at cutoff=0.40 (N=334) \n N=318, RMSE=1.59, Rp=0.448, Rs=0.472")+geom_abline(intercept = 0,linetype="dashed") + theme(legend.position = "none",plot.title = element_text(size=16,hjust = 0.5,vjust=-1),axis.title.x=element_text(size=16),axis.text.x = element_text(size = 14),axis.title.y =element_text(size=16),axis.text.y = element_text(size = 14))
p2<-ggExtra::ggMarginal(p2, type = "histogram",col = "#FFFFFF", fill = "#00CC99")

data3<-read.csv(file="/Users/shixingda/Desktop/v2018/RF_XVC_0.40.csv",header = T,sep=",")
p3 <- ggplot(data=data3, aes(x=real,y=predict)) + geom_point(colour="#9966FF")+scale_y_continuous(name="Predicted binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12))+scale_x_continuous(name="Measured binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12)) + labs(title = "RF::XVC trained at cutoff=0.40 (N=334) \n N=318, RMSE=1.53, Rp=0.492, Rs=0.474")+geom_abline(intercept = 0,linetype="dashed") + theme(legend.position = "none",plot.title = element_text(size=16,hjust = 0.5,vjust=-1),axis.title.x=element_text(size=16),axis.text.x = element_text(size = 14),axis.title.y =element_text(size=16),axis.text.y = element_text(size = 14))
p3<-ggExtra::ggMarginal(p3, type = "histogram",col = "#FFFFFF", fill = "#9966FF")

# cutoff=0.43
data4<-read.csv(file="/Users/shixingda/Desktop/v2018/lm_result_Xscore_0.43.csv",header = T,sep=",")
p4 <- ggplot(data=data4, aes(x=real,y=predict)) + geom_point(colour="#66CC33")+scale_y_continuous(name="Predicted binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12))+scale_x_continuous(name="Measured binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12)) + labs(title = "MLR::Xscore trained at cutoff=0.43 (N=570) \n N=318, RMSE=1.53, Rp=0.493, Rs=0.541")+geom_abline(intercept = 0,linetype="dashed") + theme(legend.position = "none",plot.title = element_text(size=16,hjust = 0.5,vjust=-1),axis.title.x=element_text(size=16),axis.text.x = element_text(size = 14),axis.title.y =element_text(size=16),axis.text.y = element_text(size = 14))
p4<-ggExtra::ggMarginal(p4, type = "histogram",col = "#FFFFFF", fill = "#66CC33")

data5<-read.csv(file="/Users/shixingda/Desktop/v2018/RF_result_Xscore_0.43.csv",header = T,sep=",")
p5 <- ggplot(data=data5, aes(x=real,y=predict)) + geom_point(colour="#00CC99")+scale_y_continuous(name="Predicted binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12))+scale_x_continuous(name="Measured binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12)) + labs(title = "RF::Xscore trained at cutoff=0.43 (N=570) \n N=318, RMSE=1.57, Rp=0.465, Rs=0.487")+geom_abline(intercept = 0,linetype="dashed") + theme(legend.position = "none",plot.title = element_text(size=16,hjust = 0.5,vjust=-1),axis.title.x=element_text(size=16),axis.text.x = element_text(size = 14),axis.title.y =element_text(size=16),axis.text.y = element_text(size = 14))
p5<-ggExtra::ggMarginal(p5, type = "histogram",col = "#FFFFFF", fill = "#00CC99")

data6<-read.csv(file="/Users/shixingda/Desktop/v2018/RF_XVC_0.43.csv",header = T,sep=",")
p6 <- ggplot(data=data6, aes(x=real,y=predict)) + geom_point(colour="#9966FF")+scale_y_continuous(name="Predicted binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12))+scale_x_continuous(name="Measured binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12)) + labs(title = "RF::XVC trained at cutoff=0.43 (N=570) \n N=318, RMSE=1.52, Rp=0.507, Rs=0.497")+geom_abline(intercept = 0,linetype="dashed") + theme(legend.position = "none",plot.title = element_text(size=16,hjust = 0.5,vjust=-1),axis.title.x=element_text(size=16),axis.text.x = element_text(size = 14),axis.title.y =element_text(size=16),axis.text.y = element_text(size = 14))
p6<-ggExtra::ggMarginal(p6, type = "histogram",col = "#FFFFFF", fill = "#9966FF")

#cutoff=0.60

data7<-read.csv(file="/Users/shixingda/Desktop/v2018/lm_result_Xscore_0.60.csv",header = T,sep=",")
p7 <- ggplot(data=data7, aes(x=real,y=predict)) + geom_point(colour="#66CC33")+scale_y_continuous(name="Predicted binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12))+scale_x_continuous(name="Measured binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12)) + labs(title = "MLR::Xscore trained at cutoff=0.60 (N=1813) \n N=318, RMSE=1.52, Rp=0.495, Rs=0.543")+geom_abline(intercept = 0,linetype="dashed") + theme(legend.position = "none",plot.title = element_text(size=16,hjust = 0.5,vjust=-1),axis.title.x=element_text(size=16),axis.text.x = element_text(size = 14),axis.title.y =element_text(size=16),axis.text.y = element_text(size = 14))
p7<-ggExtra::ggMarginal(p7, type = "histogram",col = "#FFFFFF", fill = "#66CC33")

data8<-read.csv(file="/Users/shixingda/Desktop/v2018/RF_result_Xscore_0.60.csv",header = T,sep=",")
p8 <- ggplot(data=data8, aes(x=real,y=predict)) + geom_point(colour="#00CC99")+scale_y_continuous(name="Predicted binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12))+scale_x_continuous(name="Measured binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12)) + labs(title = "RF::Xscore trained at cutoff=0.60 (N=1813) \n N=318, RMSE=1.51, Rp=0.524, Rs=0.534")+geom_abline(intercept = 0,linetype="dashed") + theme(legend.position = "none",plot.title = element_text(size=16,hjust = 0.5,vjust=-1),axis.title.x=element_text(size=16),axis.text.x = element_text(size = 14),axis.title.y =element_text(size=16),axis.text.y = element_text(size = 14))
p8<-ggExtra::ggMarginal(p8, type = "histogram",col = "#FFFFFF", fill = "#00CC99")

data9<-read.csv(file="/Users/shixingda/Desktop/v2018/RF_XVC_0.60.csv",header = T,sep=",")
p9 <- ggplot(data=data9, aes(x=real,y=predict)) + geom_point(colour="#9966FF")+scale_y_continuous(name="Predicted binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12))+scale_x_continuous(name="Measured binding affinity (pKd)",breaks=c(2,4,6,8,10,12),limits=c(2,12)) + labs(title = "RF::XVC trained at cutoff=0.60 (N=1813) \n N=318, RMSE=1.49, Rp=0.539, Rs=0.529")+geom_abline(intercept = 0,linetype="dashed") + theme(legend.position = "none",plot.title = element_text(size=16,hjust = 0.5,vjust=-1),axis.title.x=element_text(size=16),axis.text.x = element_text(size = 14),axis.title.y =element_text(size=16),axis.text.y = element_text(size = 14))
p9<-ggExtra::ggMarginal(p9, type = "histogram",col = "#FFFFFF", fill = "#9966FF")

ggarrange(p1,p2,p3,p4,p5,p6,p7,p8,p9,ncol=3,nrow=3,common.legend = FALSE)

dev.off()
