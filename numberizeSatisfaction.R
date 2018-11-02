
# Coerce satisfaction ratings into a new (numeric) column for ease in future analysis
ssClean$SatisfactionNumeric <- as.numeric(as.character(ssClean$Satisfaction))

# In order to define binary satisfaction categories of "High" and "Low", we must determine
# the threshold that makes the most sense within the distribution of Satisfaction numbers 
# in our data.

# Examine the central tendency and dispersion of the Satisfaction numbers
summary(ssClean$SatisfactionNumeric)
histSat <- hist(ssClean$SatisfactionNumeric)

# It seems the Satisfaction numbers fall into two groups distributed around 3.5, so we will
# make that our threshold for defining "High" and "Low" satisfaction. We know from previous 
# analysis that there is an insignificant quantity of 3.5 ratings so we will group them in the 
# high group for the sake of simplicity.

# Create a new column assigning a binary value to satisfaction
ssClean$binarySat <- ifelse(ssClean$SatisfactionNumeric > 3.5, "High", "Low")
head(ssClean)
