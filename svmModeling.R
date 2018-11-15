
##################################################################
#Use SVM to evaluate customer satisfaction

#import necessary libraries
library(jsonlite)
#library(dplyr)
library(kernlab)

#cleanData <- read.csv('/Users/Ryan/Dropbox/college/7_Semester_V/IST_687/group_project/cleanData.csv')
cleanData <- ssClean

#create binary satisfaction variable
cleanData$binSat <- ifelse(cleanData$Satisfaction>3,1,0)
cleanData$binSat <- as.factor(cleanData$binSat)

sampleData <- sample_n(cleanData, 10000, replace = TRUE)

#randomize the order of the data to allow for random sampling of the thirds selected
table(sampleData$binSat)
randIndex <- sample(1:dim(sampleData)[1])

#create a 2/3 cut point by dividing the data into thirds
cutPoint2_3 <- floor(2 * dim(sampleData)[1]/3)
cutPoint2_3

#create the training and testing data off of the 2/3 cut point
trainData <- sampleData[randIndex[1:cutPoint2_3],]
testData <- sampleData[randIndex[(cutPoint2_3+1):dim(sampleData)[1]],]

#create the SVM expression with the following parameters
svmOutput <- ksvm(binSat ~ ., data=sampleData, kernel="rbfdot", C=5000, cross=3, prob.model=TRUE)
svmOutput

#examine the support vectors
hist(alpha(svmOutput)[[1]], main="Support Vector Histogram with C=5000", xlab="Support Vector Values")

#test the created model against the test data set
svmPred <- predict(svmOutput, testData, type='votes')
#review the contents of svmPred
head(svmPred)

#create a confusion matrix of the second row of svmPred vs binSat
#compTable <- data.frame(testData$binSat,svmPred[2,])
#table(compTable) 
