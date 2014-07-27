download.file(url="https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv",method="curl",destfile="training.csv")
download.file(url="https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv",method="curl",destfile="testing.csv")

training <- read.csv(file="training.csv",header=TRUE,stringsAsFactor=FALSE,na.strings=c("#DIV/0!",NA))
testing <- read.csv(file="testing.csv",header=TRUE,stringsAsFactor=FALSE,na.strings=c("#DIV/0!",NA))
