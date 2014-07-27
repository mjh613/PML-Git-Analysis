library(caret)

#create four crossvalidation partitions from the main data set
set.seed(1234)
crossval <- createDataPartition(y=training$"classe",p=0.1,times=4)
crossval1 <- training[crossval$Resample1,]
crossval2 <- training[crossval$Resample2,]
crossval3 <- training[crossval$Resample3,]
crossval4 <- training[crossval$Resample4,]
#create a working training set "train" that doesn't have any of the
#crossvalidation samples in it
train <- training[-c(crossval$Resample1,crossval$Resample2,
                     crossval$Resample3,crossval$Resample4),]

#clean the data by finding useless columns
keep = rep(0,times=length(train))
for(i in 1:length(train)) {
  if (typeof(train[,i]) == "character") #throws out "character" columns
      keep[i] = FALSE
  else keep[i] = TRUE
  if (is.na(var(train[,i])) == TRUE) #throws out columns that have no variance
      keep[i] = FALSE
  else keep[i] = TRUE
}
keep[1:5] <- 0 #throws out the X, timestamp columns
keep[length(keep)] <- 1 #so that it keeps the predictor variable classe
trainnum <- train[,which(as.logical(keep))]#keep only the columns I want

trainnumm <- as.data.frame(lapply(trainnum,as.numeric))
trainnumm$"classe" <- factor(trainnum$"classe") #return classe variable to be a factor

#use PCA to figure out how many predictors can explain 95% of the data
preProc <- preProcess(x=trainnumm[,-length(trainnumm)],outcome=trainnum$"classe",method="pca",thresh=0.95)

#use that now to get a preprocessed training set
trainpc <- predict(preProc,trainnumm[,-length(trainnumm)])

#set up parallel processing
library(doParallel)
cl<-makeCluster(detectCores())
registerDoParallel(cl)

#random forest
library(randomForest)
modelFit <- train(trainnumm$"classe"~.,method="rf",data=trainpc,prox=TRUE)
