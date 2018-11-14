
library("arules")
library("arulesViz")

#Create a new data frame based on  different parts of discretized data 
dSatisfactionCategory <- data.frame(cbind(dSatisfactionSurveyPart1,dSatisfactionSurveyPart2,dSatisfactionSurveyPart3,dSatisfactionSurveyPart4))
