
dSatisfactionSurveyPart4<-df[,c("Airline.Status","Gender","Type.of.Travel",
"Class","Flight.date","Airline.Code","binarySat")]

#Factorize variables
dSatisfactionSurveyPart4$Airline.Status <- factor(dSatisfactionSurveyPart4$Airline.Status)
