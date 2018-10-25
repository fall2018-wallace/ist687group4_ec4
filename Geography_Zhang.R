
#Load the datasets
getwd() 
sSurvey <-read.csv("satisfactionSurvey.csv",TRUE,",") #read in the file
str(sSurvey)
#create new dataframe satisfaction surveyGep with 5 variables 
#surveyGeo<-sSurvey [,-c(2:17,22:28)] 
surveyGeo<-sSurvey [,c("Satisfaction","Orgin.City","Origin.State","Destination.City","Destination.State")]
str(surveyGeo)


#Explore the Satisfaction Variable 
length(surveyGeo$Satisfaction)
class(surveyGeo$Satisfaction)
surveyGeo$Satisfaction<-as.numeric(surveyGeo$Satisfaction)

#Insgtall ggplot packages 
library(ggplot2)
library(ggmap)
library(maps)
