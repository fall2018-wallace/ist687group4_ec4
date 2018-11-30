
library(arules) 
library(arulesViz)
library(methods)
#Coerce the satisfaction data frame into a sparse transactions matrix 
dSatisfactionCategory[] <- lapply(dSatisfactionCategory, factor)
dSatisfactionX <- as(dSatisfactionCategory,"transactions")


#Here we use the inspect( ), itemFrequency( ), and itemFrequencyPlot( ) commands to explore the contents of dSatisfactionX
#inspect(dSatisfactionX)
itemFrequency(dSatisfactionX)
itemFrequencyPlot(dSatisfactionX,cex.names=0.4)

#Then we use arules to discover patterns
#Run the apriori command to try and predict happy customers
rules <- apriori(dSatisfactionX,parameter = list(support=0.3,confidence=0.5),appearance = list(default="lhs",rhs="binarySat=High"))
summary(rules)
inspect(rules)

#Rank and comment
rules.new <- rules[order(-quality(rules)$lift),]
inspect(head(rules.new,5))  
print('done')

 #lhs                                                       rhs             support   confidence lift    
#[1] {Airline.Status=Blue,Class=Eco}                        => {binarySat=Low} 0.3263631 0.5885456  1.202439
#[2] {dEating=Average,Airline.Status=Blue,Class=Eco}        => {binarySat=Low} 0.3263631 0.5885456  1.202439
#[3] {dDayOfMonth=High,Airline.Status=Blue}                 => {binarySat=Low} 0.3081086 0.5840570  1.193268
#[4] {dEating=Average,dDayOfMonth=High,Airline.Status=Blue} => {binarySat=Low} 0.3081086 0.5840570  1.193268
#[5] {Airline.Status=Blue}                                  => {binarySat=Low} 0.3991500 0.5831131  1.191340
