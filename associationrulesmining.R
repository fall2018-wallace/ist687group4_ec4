

library(arules) 
library(arulesViz)
library(methods)
#Coerce the satisfaction data frame into a sparse transactions matrix 
dSatisfactionCategory[] <- lapply(dSatisfactionCategory, factor)
dSatisfactionX <- as(dSatisfactionCategory,"transactions")


#Here we use the inspect( ), itemFrequency( ), and itemFrequencyPlot( ) commands to explore the contents of dSatisfactionX
inspect(dSatisfactionX)
itemFrequency(dSatisfactionX)
itemFrequencyPlot(dSatisfactionX,cex.names=0.4)

#Then we use arules to discover patterns
#Run the apriori command to try and predict happy customers
rules <- apriori(dSatisfactionX,parameter = list(support=0.2,confidence=0.6),appearance = list(default="lhs",rhs="binarySat=High"))
summary(rules)
inspect(rules)

#Rank and comment
rules.new <- rules[order(-quality(rules)$lift),]
inspect(head(rules.new,5))  

 
#lhs                                 rhs                support confidence     lift count
#[1] {dArrDelay=Low,                                                                         
#Type.of.Travel=Business travel} => {binarySat=High} 0.2596739  0.7597252 1.488082 33728
#[2] {dEating=Average,                                                                       
#dArrDelay=Low,                                                                         
#Type.of.Travel=Business travel} => {binarySat=High} 0.2596739  0.7597252 1.488082 33728
#[3] {dDepDelay=Low,                                                                         
#dArrDelay=Low,                                                                         
#Type.of.Travel=Business travel} => {binarySat=High} 0.2111005  0.7564906 1.481746 27419
#[4] {dEating=Average,                                                                       
#dDepDelay=Low,                                                                         
#dArrDelay=Low,                                                                         
#Type.of.Travel=Business travel} => {binarySat=High} 0.2111005  0.7564906 1.481746 27419
#[5] {dArrDelay=Low,                                                                         
#Type.of.Travel=Business travel,                                                        
#Class=Eco}                      => {binarySat=High} 0.2090987  0.7545215 1.477889 27159
> 
