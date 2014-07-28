#processing of test set
tst <- testing[,which(as.logical(keep))]#keep only the columns I want
test <- as.data.frame(lapply(tst,as.numeric))
answers <- predict(modelFit2,tst)

#final answers
#Let "answers" be a character vector of the 20 samples in the test set

pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0("problem_id_",i,".txt")
    write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
  }
}

#create a folder where the files will be written and set that as the new wd
setwd("../results/")

#write the new files
pml_write_files(answers)
