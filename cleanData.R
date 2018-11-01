
# The Satisfaction variable is our dependent variable so it is important that it is 
# formatted correctly and that its values are measurable.

# Explore the unique values in the Satisfaction column to discover any anomolies or 
# unexpected values not equal to a number between 0 and 5.
unique(ssRaw$Satisfaction)

# Per the above analysis, we see that there are some Satisfaction ratings of 4.00.5 and 
# 4.00.2.00 in the data which fall outside of our expected format and are non-numeric 
# (unable to be used in numerical analysis). As these are most likely errors, let's check
# to see how much of the data these errors affect.

# Display the number of rows with these anomolies
nrow(ssRaw[(ssRaw$Satisfaction=="4.00.2.00"|ssRaw$Satisfaction=="4.00.5"),])

# Display the total number of rows
nrow(ssRaw)
nrow(ssRaw[(ssRaw$Satisfaction=="4.00.2.00"|ssRaw$Satisfaction=="4.00.5"),]) / nrow(ssRaw) * 100

# Remove the rows with non-numeric satisfaction ratings 
# Per the group's decision: the we can do this check as an automated, non-manual process for the final project, but I knew what they were and am just exploring)
# cleanSatisfactionSurvey <- satisfactionSurvey[(satisfactionSurvey$Satisfaction!="4.00.2.00"&satisfactionSurvey$Satisfaction!="4.00.5"),]