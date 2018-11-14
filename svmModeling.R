
##################################################################
#Use SVM to evaluate customer satisfaction

#import necessary libraries
library(RCurl)
library(RJSONIO)
library(jsonlite)
library(dplyr)
library(kernlab)

#import data
cleanData <- cleanData



#PART B
cleanData$binSat <- ifelse(cleanData$Satisfaction>4,1,0)
cleanData$binSat <- as.factor(cleanData$binSat)


#PART C
#randomize the order of the data to allow for random sampling of the thirds selected
table(cleanData$binSat)
randIndex <- sample(1:dim(cleanData)[1])

#create a 2/3 cut point by dividing the data into thirds
cutPoint2_3 <- floor(2 * dim(cleanData)[1]/3)
cutPoint2_3

#create the training and testing data off of the 2/3 cut point
trainData <- cleanData[randIndex[1:cutPoint2_3],]
testData <- cleanData[randIndex[(cutPoint2_3+1):dim(cleanData)[1]],]

#create the SVM expression with the following parameters
svmOutput <- ksvm(binSat ~ Airline.Status, data=trainData, kernel="rbfdot", C=5, cross=10, prob.model=TRUE)
svmOutput
