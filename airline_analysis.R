
##################################################################
# Use this block comment at the top of each R code file you submit
# IST 687 Homework 8 – Submitted by Ryan French on October 25, 2018
# Portions of this code came from Introduction to Data Science
# but the comments are all original.

#import necessary libraries
library(ggplot2)



#satisfactionSurvey$Airline.Status <- as.factor(satisfactionSurvey$Airline.Status)
statusBar <- ggplot(satisfactionSurvey,aes(x=Airline.Status)) + geom_bar(color="blue", fill="light blue")
statusBar <- statusBar + theme(axis.text.x = element_text(angle = 90, hjust = 1))
statusBar



otherFlightsHist <- hist(satisfactionSurvey$X..of.Flight.with.other.Airlines, color="blue", fill="light blue" )



codesBar <- ggplot(satisfactionSurvey,aes(x=Airline.Code)) + geom_bar(color="blue", fill="light blue")
codesBar <- codesBar + theme(axis.text.x = element_text(angle = 90, hjust = 1))
codesBar



cardsHist <- hist(satisfactionSurvey$No..of.other.Loyalty.Cards, color="blue", fill="light blue")



classBar <- ggplot(satisfactionSurvey,aes(x=Class)) + geom_bar(color="blue", fill="light blue")
classBar <- classBar + theme(axis.text.x = element_text(angle = 90, hjust = 1))
classBar


travelBar <- ggplot(satisfactionSurvey,aes(x=Type.of.Travel)) + geom_bar(color="blue", fill="light blue")
travelBar <- travelBar + theme(axis.text.x = element_text(angle = 90, hjust = 1))
travelBar

