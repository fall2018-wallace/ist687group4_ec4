
# Coerce satisfaction ratings into a new (numeric) column
ssClean$SatisfactionNumeric <- as.numeric(as.character(ssClean$Satisfaction))

# In order to define our binary satisfcation categories of "High" and "Low", we must determine
# the threshold that makes the most sense within the distribution of Satisfaction numbers 
# in our data.

# Examine the central tendency and dispersion of the Satisfcation numbers
summary(ssClean$SatisfactionNumeric)
histSat <- hist(ssClean$SatisfactionNumeric)

# It seems the Satisfaction numbers fall into two groups distributed around 3.5, so we will
# make that our threshold for defining "High" and "Low" satisfaction. We know from previous 
# analysis that there is an insignificant quantity of 3.5 ratings so we will group them in the 
# high group for the sake of simplicity.

# Create a new column assigning a binary value to satisfaction for future analysis
ssClean$binarySat <- ifelse(ssClean$SatisfactionNumeric > 3.5, "High", "Low")
