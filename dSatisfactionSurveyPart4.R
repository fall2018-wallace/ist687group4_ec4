
dSatisfactionSurveyPart4<-df[,c("Airline.Status","Gender","Type.of.Travel",
"Class","Airline.Code","binarySat")]

#Factorize variables
dSatisfactionSurveyPart4$Airline.Status <- factor(dSatisfactionSurveyPart4$Airline.Status)
dSatisfactionSurveyPart4$Gender <- factor(dSatisfactionSurveyPart4$Gender)
dSatisfactionSurveyPart4$Type.of.Travel <- factor(dSatisfactionSurveyPart4$Type.of.Travel)
dSatisfactionSurveyPart4$Class <- factor(dSatisfactionSurveyPart4$Class)
dSatisfactionSurveyPart4$Airline.Code <- factor(dSatisfactionSurveyPart4$Airline.Code)
dSatisfactionSurveyPart4$binarySat <- factor(dSatisfactionSurveyPart4$binarySat)
