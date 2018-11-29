
##################################################################
# Use this block comment at the top of each R code file you submit
# IST 687 Homework 8 – Submitted by Ryan French on October 25, 2018
# Portions of this code came from Introduction to Data Science
# but the comments are all original.

#import necessary libraries
library(ggplot2)



#satisfactionSurvey$Airline.Status <- as.factor(satisfactionSurvey$Airline.Status)
statusBar <- ggplot(satisfactionSurvey,aes(x=Airline.Status, y=Satisfaction, group=1)) + geom_bar()
statusBar <- statusBar + theme(axis.text.x = element_text(angle = 90, hjust = 1))
statusBar



otherFlightsHist <- hist(satisfactionSurvey$X..of.Flight.with.other.Airlines)



codesBar <- ggplot(satisfactionSurvey,aes(x=Airline.Code, y=Satisfaction, group=1))
codesBar <- codesBar + geom_col()
codesBar <- codesBar + theme(axis.text.x = element_text(angle = 90, hjust = 1))
codesBar



cardsHist <- hist(satisfactionSurvey$No..of.other.Loyalty.Cards)



classBar <- ggplot(satisfactionSurvey,aes(x=Class, y=Satisfaction, group=1))
classBar <- classBar + geom_col()
classBar <- classBar + theme(axis.text.x = element_text(angle = 90, hjust = 1))
classBar



travelBar <- ggplot(satisfactionSurvey,aes(x=Type.of.Travel, y=Satisfaction, group=1))
travelBar <- travelBar + geom_col()
travelBar <- travelBar + theme(axis.text.x = element_text(angle = 90, hjust = 1))
travelBar
