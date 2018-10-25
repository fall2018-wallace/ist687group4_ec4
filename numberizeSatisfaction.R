
cleanSatisfactionSurvey <- satisfactionSurvey[(satisfactionSurvey$Satisfaction!="4.00.2.00"&satisfactionSurvey$Satisfaction!="4.00.5"),]
cleanSatisfactionSurvey$SatisfactionNumeric <- as.numeric(as.character(cleanSatisfactionSurvey$Satisfaction))
cleanSatisfactionSurvey$binarySat <- cleanSatisfactionSurvey$SatisfactionNumeric > 3.5
