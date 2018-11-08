
#Create a new data frame based on three different parts of discretized data (Need to add part 2)
dSatisfactionCategory <- data.frame(cbind(part1,part2,part3,part4))
discretizeddata <- write.csv(dSatisfactionCategory)
head(dSatisfactionCategory)
