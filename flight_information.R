
library(ggplot2)
DayofMonth <- raw_data[,c(1,14)]

#df.GroupByDays <- group_by(DayofMonth, Day.of.Month)
#SatisfactionByDay <- summarize(df.GroupByDays, Satisfaction = sum(Satisfaction>=0, na.rm = TRUE))


#tapply <- tapply(raw_data$Satisfaction>=0, raw_data$Day.of.Month, sum, na.rm = TRUE)

mean <- data.frame(tapply(as.numeric(DayofMonth$Satisfaction), DayofMonth$Day.of.Month, mean, na.rm = TRUE))
#median <- tapply(as.numeric(DayofMonth$Satisfaction>=0), DayofMonth$Day.of.Month, median, na.rm = TRUE)
#sd <- tapply(as.numeric(DayofMonth$Satisfaction>=0), DayofMonth$Day.of.Month, sd, na.rm = TRUE)
colnames(mean) <- "Satisfaction"
mean$Day.of.Month <- rownames(mean)
barMean <- ggplot(mean, aes(x=reorder(Day.of.Month), y=Satisfaction, group = 1)) + geom_col() 

