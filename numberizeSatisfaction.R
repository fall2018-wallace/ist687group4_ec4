
# Coerce satisfaction ratings into a new (numeric) column
ssClean$SatisfactionNumeric <- as.numeric(as.character(ssClean$Satisfaction))

# In order to define our binary satisfcation categories of "High" and "Low", we must determine
# the threshold that makes the most sense within the distribution of Satisfaction numbers 
# in our data.
# Create a new column assigning a binary value to satisfaction for future analysis
ssClean$binarySat <- ssClean$SatisfactionNumeric > 3.5
