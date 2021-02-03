# Usage: Rscript xgb.R protein XscoreResult Xscore xgb_model


args = commandArgs(TRUE)
folder=args[1];
path=args[2];
method=args[3];
output=args[4];


path<-paste(path,folder,sep="/")
setwd(path)
temp=list.files(path=path,pattern="*.csv")

library(xgboost)
Rp<-c()
Rs<-c()
RMSE<-c()
cutoff<-c()
# file shoule change.
file=paste(method,"test.txt",sep = "_")
test<-read.csv(file=file,header = T,sep=",")

for(i in 1:length(temp)){
	name<-tools::file_path_sans_ext(temp)
# if name change, "3" will change.
	cut<-tail(strsplit(name,split="_")[[i]],1)
#	cut<-strsplit(name, "_")[[i]][3]
	train<-read.csv(file=temp[i],header = T,sep=",")

	nselfeats = ncol(train)	
	dtrain <- xgb.DMatrix(as.matrix(sapply(train[,2:nselfeats], as.numeric)), label=train$Y)
	dtest <- xgb.DMatrix(as.matrix(sapply(test[,2:nselfeats], as.numeric)), label=test$Y) 

	model <- xgboost(data = dtrain,min_child_weight=15,colsample_bytree=0.8,nround=200,eta=0.06)
	xgb_result<-data.frame(test[,1],predict(model, dtest))

	s=cor(xgb_result[,1],xgb_result[,2],method="spearman")
	Rs<-append(Rs,s)
	p=cor(xgb_result[,1],xgb_result[,2],method="pearson")
	Rp<-append(Rp,p)
	rmse=sqrt(mean((xgb_result[,1] - xgb_result[,2])^2))
	RMSE<-append(RMSE,rmse)
	cutoff<-append(cutoff,cut)

	
}

setwd(output)
setwd(folder)
correlation_xgb <- data.frame(cutoff,Rs,Rp,RMSE)
file=paste(method,"csv",sep = ".")
file=paste("correlation_xgboost",file,sep = "_")
write.csv(correlation_xgb, file = file,row.names = FALSE)
