
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
rules <- apriori(dSatisfactionX,parameter = list(support=0.2,confidence=0.6),appearance = list(default="lhs",rhs="binarySat=High"))
summary(rules)
inspect(rules)

#Rank and comment
rules.new <- rules[order(-quality(rules)$lift),]
inspect(head(rules.new,5))  


#lhs                                  rhs                support confidence     lift count
#[1] {dPrice.Sensitivity=Average,                                                             
#Type.of.Travel=Business travel,                                                         
#Flight.cancelled=No,                                                                    
#Arrival.Delay.greater.5.Mins=no} => {binarySat=High} 0.2168363  0.7718702 1.511870 28164
#[2] {dPrice.Sensitivity=Average,                                                             
#dEating=Average,                                                                        
#Type.of.Travel=Business travel,                                                         
#Flight.cancelled=No,                                                                    
#Arrival.Delay.greater.5.Mins=no} => {binarySat=High} 0.2168363  0.7718702 1.511870 28164
#[3] {dPrice.Sensitivity=Average,                                                             
#Type.of.Travel=Business travel,                                                         
#Arrival.Delay.greater.5.Mins=no} => {binarySat=High} 0.2196619  0.7668799 1.502096 28531
#[4] {dPrice.Sensitivity=Average,                                                             
#dEating=Average,                                                                        
#Type.of.Travel=Business travel,                                                         
#Arrival.Delay.greater.5.Mins=no} => {binarySat=High} 0.2196619  0.7668799 1.502096 28531
#[5] {Type.of.Travel=Business travel,                                                         
#Flight.cancelled=No,                                                                    
#Arrival.Delay.greater.5.Mins=no} => {binarySat=High} 0.3008253  0.7653119 1.499024 39073
