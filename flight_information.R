
library(dplyr)
library(ggplot2)
DayofMonth <- raw_data[,c(1,14)]

# Group by day of the month, report average satisfcation per group, coerce vector into df
mean <- data.frame(tapply(as.numeric(DayofMonth$Satisfaction), DayofMonth$Day.of.Month, mean, na.rm = TRUE))
# Add titles, columns to df necessary for plotting
colnames(mean) <- "Satisfaction"
mean$Day.of.Month <- rownames(mean)
# Plot results
barMean <- ggplot(mean, aes(x=Day.of.Month, y=Satisfaction, group = 1)) + geom_col() 

median <- data.frame(tapply(as.numeric(DayofMonth$Satisfaction), DayofMonth$Day.of.Month, median, na.rm = TRUE))
colnames(median) <- "Satisfaction"
median$Day.of.Month <- rownames(median)
barMedian <- ggplot(median, aes(x=Day.of.Month, y=Satisfaction, group = 1)) + geom_col() 

sd <- data.frame(tapply(as.numeric(DayofMonth$Satisfaction), DayofMonth$Day.of.Month, sd, na.rm = TRUE))
colnames(sd) <- "Satisfaction"
sd$Day.of.Month <- rownames(sd)
barSd <- ggplot(sd, aes(x=Day.of.Month, y=Satisfaction, group = 1)) + geom_col() 
