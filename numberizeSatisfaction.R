
# Coerce satisfaction ratings into a new (numeric) column
ssClean$SatisfactionNumeric <- as.numeric(as.character(ssClean$Satisfaction))

# Create a new column assigning a binary value to satisfaction for future analysis
ssClean$binarySat <- ssClean$SatisfactionNumeric > 3.5
