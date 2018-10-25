
# Remove the rows with non-numeric satisfaction ratings 
# (we can do this check as an automated, non-manual process for the final project, but I knew what they were and am just exploring)
cleanSatisfactionSurvey <- satisfactionSurvey[(satisfactionSurvey$Satisfaction!="4.00.2.00"&satisfactionSurvey$Satisfaction!="4.00.5"),]

cleanSatisfactionSurvey$SatisfactionNumeric <- as.numeric(as.character(cleanSatisfactionSurvey$Satisfaction))
cleanSatisfactionSurvey$binarySat <- cleanSatisfactionSurvey$SatisfactionNumeric > 3.5
