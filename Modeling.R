
library("arules")
library("arulesViz")

#Create a new data frame based on  different parts of discretized data 
dSatisfactionCategory <- data.frame(cbind(dSatisfactionSurveyPart1,dSatisfactionSurveyPart2,dSatisfactionSurveyPart3,dSatisfactionSurveyPart4))
dSatisfactionCategory
#Coerce the satisfaction data frame into a sparse transactions matrix 
dSatisfactionX <- as(dSatisfactionCategory,"transactions")
dSatisfactionX

#Here we use the inspect( ), itemFrequency( ), and itemFrequencyPlot( ) commands to explore the contents of dSatisfactionX
inspect(dSatisfactionX)
itemFrequency(dSatisfactionX)
itemFrequencyPlot(dSatisfactionX,cex.names=0.4)

#Then we use arules to discover patterns
#Run the apriori command to try and predict happy customers
rules <- apriori(dSatisfactionX,parameter = list(support=0.2,confidence=0.6),appearance = list(default="lhs",rhs="dSatisfactionLevel=High"))
summary(rules)
inspect(rules)

#Rank and comment
rules.new <- rules[order(-quality(rules)$lift),]
inspect(head(rules.new,5))  
