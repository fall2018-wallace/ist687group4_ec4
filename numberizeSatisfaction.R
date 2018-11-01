
# Coerce satisfaction ratings into a new (numeric) column
cleanSatisfactionSurvey$SatisfactionNumeric <- as.numeric(as.character(cleanSatisfactionSurvey$Satisfaction))

# Create a new column assigning a binary value to satisfaction for future analysis
cleanSatisfactionSurvey$binarySat <- cleanSatisfactionSurvey$SatisfactionNumeric > 3.5
