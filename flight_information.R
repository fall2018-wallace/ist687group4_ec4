
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
