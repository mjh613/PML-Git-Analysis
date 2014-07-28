#crossval1 processing & prediction
cv1 <- crossval1[,which(as.logical(keep))]#keep only the columns I want
cv1num <- as.data.frame(lapply(cv1,as.numeric))
cv1num$"classe" <- cv1$"classe"
cv1num$"classe" <- factor(cv1num$"classe") #return classe variable to be a factor
pred1a <- predict(modelFit2,cv1num)
confusionMatrix(pred1a,cv1num$classe)
acc <- rep(0,4)
acc[1] <- 99.64

#crossval2 processing & prediction
cv2 <- crossval2[,which(as.logical(keep))]#keep only the columns I want
cv2num <- as.data.frame(lapply(cv2,as.numeric))
cv2num$"classe" <- cv2$"classe"
cv2num$"classe" <- factor(cv2num$"classe") #return classe variable to be a factor
pred2 <- predict(modelFit2,cv2num)
confusionMatrix(pred2,cv2num$classe)
acc[2] <- 99.64

#crossval3 processing & prediction
cv3 <- crossval3[,which(as.logical(keep))]#keep only the columns I want
cv3num <- as.data.frame(lapply(cv3,as.numeric))
cv3num$"classe" <- cv3$"classe"
cv3num$"classe" <- factor(cv3num$"classe") #return classe variable to be a factor
pred3 <- predict(modelFit2,cv3num)
confusionMatrix(pred3,cv3num$classe)
acc[3] <- 99.59

#crossval4 processing & prediction
cv4 <- crossval4[,which(as.logical(keep))]#keep only the columns I want
cv4num <- as.data.frame(lapply(cv4,as.numeric))
cv4num$"classe" <- cv4$"classe"
cv4num$"classe" <- factor(cv4num$"classe") #return classe variable to be a factor
pred4 <- predict(modelFit2,cv4num)
confusionMatrix(pred4,cv4num$classe)
acc[4] <- 99.59
