
#Modeling 

library(arules)
library(arulesViz)

#Create a new data frame based on three different parts of discretized data (Need to add part 2)
dSatisfactionCategory <- data.frame(cbind(part1,part2,part3,part4))
#View(dSatisfactionCategory) 

#Coerce the satisfaction data frame into a sparse transactions matrix 
dSatisfactionX <- as(dSatisfactionCategory,"transactions")
dSatisfactionX

#Here we use the inspect( ), itemFrequency( ), and itemFrequencyPlot( ) commands to explore the contents of dSatisfactionX
inspect(dSatisfactionX)
itemFrequency(dSatisfactionX)
itemFrequencyPlot(dSatisfactionX,cex.names=0.4)

#Then we use arules to discover patterns
#Run the apriori command to try and predict happy customers
rules <- apriori(dSatisfactionX,parameter = list(support=0.2,confidence=0.6),
appearance = list(default="lhs",rhs="binarySat=High"))
summary(rules)
inspect(rules)

#Show to five ranks
rules.new <- rules[order(-quality(rules)$lift),]
inspect(head(rules.new,5))

