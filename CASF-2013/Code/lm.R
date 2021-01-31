# Usage: Rscript lm.R protein XscoreResult Xscore lm_model

args = commandArgs(TRUE)
folder=args[1];
path=args[2];
method=args[3];
output=args[4];

# path can be changed
path<-paste(path,folder,sep="/")
setwd(path)
temp=list.files(path = path , pattern="*.csv")

Rp<-c()
Rs<-c()
RMSE<-c()
cutoff<-c()
# if path changed,test should be changed.
file=paste(method,"test.txt",sep = "_")
test<-read.csv(file=file,header = T,sep=",")

for(i in 1:length(temp)){

	name<-tools::file_path_sans_ext(temp)
# when file name change,the position.
	cut<-tail(strsplit(name,split="_")[[i]],1)
	train<-read.csv(file=temp[i],header = T,sep=",")
# change
	if(method == "Xscore"){

		lm_model1 <- lm(formula= Y ~ VDW + HB + HP + RT,data=train)
		lm_model2 <- lm(formula= Y ~ VDW + HB + HM + RT,data=train)
		lm_model3 <- lm(formula= Y ~ VDW + HB + HS + RT,data=train)
		pred1<-predict(lm_model1, newdata = test)
		pred2<-predict(lm_model2, newdata = test)
		pred3<-predict(lm_model3, newdata = test)
		pred<-(pred1+pred2+pred3)/3

	}else if(method == "Cyscore"){

		lm_model <- lm(formula= Y ~ Hydrophobic + Vdw + HBond + Ent,data=train)
		pred<-predict(lm_model, newdata = test)

#	}else if(method == "MW"){
#		lm_model <- lm(formula= Y ~ MW ,data=train)
#		pred<-predict(lm_model, newdata = test)

	}else if(method == "Vina"){

		rmse_OOB_best = 1e10
        #		for (w in seq(-1,1,0.001)){

        #	Z=train$Y*(1+w*train$Nrot)
        #	lm_model <- lm(formula= Z ~ gauss1 + gauss2 + repulsion + hydrophobic + Hydrogen,data=train)
        #	pred_Z <- predict(lm_model, newdata = train)
        #	rmse_OOB=sqrt(mean(( Z - pred_Z)^2))
        #	if (rmse_OOB < rmse_OOB_best){
        #		wbest = w
        #		rmse_OOB_best = rmse_OOB
        #	}
            #		}
        	wbest=0.0585
		Z=train$Y*(1+wbest*train$Nrot)
		best_lm_model <- lm(formula= Z ~ gauss1 + gauss2 + repulsion + hydrophobic + Hydrogen,data=train)
		pred_Z<-predict(best_lm_model, newdata = test)
		pred <- pred_Z/(1+wbest*test$Nrot)


	}

	result<-data.frame(test[,1],pred)
	s=cor(result[,1],result[,2],method="spearman")
	Rs<-append(Rs,s)
	p=cor(result[,1],result[,2],method="pearson")
	Rp<-append(Rp,p)
	rmse=sqrt(mean(( result[,1] - result[,2])^2))
	RMSE<-append(RMSE,rmse)
	cutoff<-append(cutoff,cut)

}

setwd(output)
setwd(folder)
correlation_lm <- data.frame(cutoff,Rs,Rp,RMSE)
file=paste(method,"csv",sep = ".")
file=paste("correlation_lm",file,sep = "_")
write.csv(correlation_lm, file = file, row.names = FALSE)
