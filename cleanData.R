
# The Satisfaction variable is our dependent variable so it is important that it is 
# formatted correctly and that its values are measurable.

# Explore the data to discover any anomolies or unexpected values not equal to a number
# between 0 and 5.
unique(ssRaw$Satisfaction)

# Per the above analysis, we see that there are some Satisfaction ratings of 4.00.5 and 

# Remove the rows with non-numeric satisfaction ratings 
# Per the group's decision: the we can do this check as an automated, non-manual process for the final project, but I knew what they were and am just exploring)
cleanSatisfactionSurvey <- satisfactionSurvey[(satisfactionSurvey$Satisfaction!="4.00.2.00"&satisfactionSurvey$Satisfaction!="4.00.5"),]
