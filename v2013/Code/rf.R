# Usage: Rscript rf.R protein XscoreResult Xscore RF_model

args = commandArgs(TRUE)
folder=args[1];
path=args[2];
method=args[3];
output=args[4];

# path can change
# path<-"/home/jessiesze/DataSimilarity/v2013/XscoreResult"
path<-paste(path,folder,sep="/")
setwd(path)
temp=list.files(path=path,pattern="*.csv")

library(randomForest)
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

	seed = 1
	set.seed(seed)
	rmse_OOB_best = 1e10
	nselfeats = ncol(train)

	trainTarget<-train[1:nrow(train),1]
	testTarget <-test[1:nrow(test),1]
	trainFeats<-train[1:nrow(train),2:nselfeats]
	testFeats<-test[1:nrow(test),2:nselfeats]

# in order to find mbest for mtry
#	for (mtry in 2:nselfeats){
#		RF_mtry = randomForest(trainTarget ~ ., data=trainFeats, ntree=500, mtry=mtry, na.action=na.omit)
#		rmse_OOB = sqrt(mean(( RF_mtry$y - RF_mtry$predicted)^2))
#		if (rmse_OOB < rmse_OOB_best){
#			mbest = mtry
#			rmse_OOB_best = rmse_OOB
#			print(paste("mbest=",mbest, "rmse_OOB=",round(rmse_OOB,3)))
#		}
#		print(paste("mtry=",mtry))
#	}
#	RF_model = randomForest(trainTarget ~ ., data=trainFeats, ntree=500, mtry=mbest, importance=TRUE, na.action=na.omit)
	RF_model = randomForest(trainTarget ~ ., data=trainFeats, ntree=500,importance=TRUE, na.action=na.omit)

	RF_result<-data.frame(test[,1],predict(RF_model, newdata = testFeats))
	s=cor(RF_result[,1],RF_result[,2],method="spearman")
	Rs<-append(Rs,s)
	p=cor(RF_result[,1],RF_result[,2],method="pearson")
	Rp<-append(Rp,p)
	rmse=sqrt(mean((RF_result[,1] - RF_result[,2])^2))
	RMSE<-append(RMSE,rmse)
	cutoff<-append(cutoff,cut)


#	setwd("/home/jessiesze/AI/RF_model")
#	setwd(folder)
#	file <- paste(name[i],"R",sep = ".")
#	save(RF_model, file = file)
#	setwd(path)
}

setwd(output)
setwd(folder)
correlation_RF <- data.frame(cutoff,Rs,Rp,RMSE)
file=paste(method,"csv",sep = ".")
file=paste("correlation_RF",file,sep = "_")
write.csv(correlation_RF, file = file,row.names = FALSE)
