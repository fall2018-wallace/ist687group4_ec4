

library(dplyr)
library(ggplot2)

# Group by day of the month, report average satisfaction per group, coerce vector into df
mean <- data.frame(tapply(as.numeric(raw_data$Satisfaction), raw_data$Day.of.Month, mean, na.rm = TRUE))
# Add titles, columns to df necessary for plotting
colnames(mean) <- "Satisfaction"
mean$Day.of.Month <- rownames(mean)
# Plot results
barMeanDayOfMonth <- ggplot(mean, aes(x=Day.of.Month, y=Satisfaction, group = 1)) + geom_col() 

# Create a function to put the flight dates into buckets of one week
defineWeekBuckets <- function(inputVector) 
{
  vBuckets <- replicate(length(inputVector), "Error") # This will show in validation if anything is not categorized
  vBuckets[as.Date(inputVector, "%m/%d/%y") >= "2014-01-01" & as.Date(inputVector, "%m/%d/%y") <= "2014-01-07"] <- "Week_End_1/07/14"
  vBuckets[as.Date(inputVector, "%m/%d/%y") >= "2014-01-08" & as.Date(inputVector, "%m/%d/%y") <= "2014-01-14"] <- "Week_End_1/14/14"
  vBuckets[as.Date(inputVector, "%m/%d/%y") >= "2014-01-15" & as.Date(inputVector, "%m/%d/%y") <= "2014-01-21"] <- "Week_End_1/21/14"
  vBuckets[as.Date(inputVector, "%m/%d/%y") >= "2014-01-22" & as.Date(inputVector, "%m/%d/%y") <= "2014-01-28"] <- "Week_End_1/28/14"
  vBuckets[as.Date(inputVector, "%m/%d/%y") >= "2014-01-29" & as.Date(inputVector, "%m/%d/%y") <= "2014-02-04"] <- "Week_End_2/04/14"
  vBuckets[as.Date(inputVector, "%m/%d/%y") >= "2014-02-05" & as.Date(inputVector, "%m/%d/%y") <= "2014-02-11"] <- "Week_End_2/11/14"
  vBuckets[as.Date(inputVector, "%m/%d/%y") >= "2014-02-12" & as.Date(inputVector, "%m/%d/%y") <= "2014-02-18"] <- "Week_End_2/18/14"
  vBuckets[as.Date(inputVector, "%m/%d/%y") >= "2014-02-19" & as.Date(inputVector, "%m/%d/%y") <= "2014-02-25"] <- "Week_End_2/25/14"
  vBuckets[as.Date(inputVector, "%m/%d/%y") >= "2014-02-26" & as.Date(inputVector, "%m/%d/%y") <= "2014-03-04"] <- "Week_End_3/04/14"
  vBuckets[as.Date(inputVector, "%m/%d/%y") >= "2014-03-05" & as.Date(inputVector, "%m/%d/%y") <= "2014-03-11"] <- "Week_End_3/11/14"
  vBuckets[as.Date(inputVector, "%m/%d/%y") >= "2014-03-12" & as.Date(inputVector, "%m/%d/%y") <= "2014-03-18"] <- "Week_End_3/18/14"
  vBuckets[as.Date(inputVector, "%m/%d/%y") >= "2014-03-19" & as.Date(inputVector, "%m/%d/%y") <= "2014-03-25"] <- "Week_End_3/25/14"
  vBuckets[as.Date(inputVector, "%m/%d/%y") >= "2014-03-26" & as.Date(inputVector, "%m/%d/%y") <= "2014-03-31"] <- "Week_End_3/31/14"
  return (data.frame(vBuckets, inputVector))
}

# Store the function results in a variable and validate the results
Flight.date.bins <- defineWeekBuckets(raw_data$Flight.date)
Flight.date.bins

# Create a new column within the survey data with the new week buckets
raw_data$Flight.date.bins <- Flight.date.bins[,1]

# Group by week, report average satisfaction per group, coerce vector into df
mean <- data.frame(tapply(as.numeric(raw_data$Satisfaction), raw_data$Flight.date.bins, mean, na.rm = TRUE))
# Add titles, columns to df necessary for plotting
colnames(mean) <- "Satisfaction"
mean$WeekEndDate <- rownames(mean)
# Plot results
barMeanFlightDate <- ggplot(mean, aes(x=WeekEndDate, y=Satisfaction, group = 1)) + geom_col() + 
  theme(axis.text.x = element_text(angle=90, hjust=1))

# Create a function to put the flight time into buckets of 100 minute intervals
defineMinuteBuckets <- function(inputVector) 
{
  vBuckets <- replicate(length(inputVector), "Error") # This will show in validation if anything is not categorized
  vBuckets[inputVector >= 0 & inputVector < 100] <- "0 - 99"
  vBuckets[inputVector >= 100 & inputVector < 200] <- "100 - 199"
  vBuckets[inputVector >= 200 & inputVector < 300] <- "200 - 299"
  vBuckets[inputVector >= 300 & inputVector < 400] <- "300 - 399"
  vBuckets[inputVector >= 400 & inputVector < 500] <- "400 - 499"
  vBuckets[inputVector >= 500 & inputVector < 600] <- "500 - 599"
  vBuckets[inputVector >= 600 & inputVector < 700] <- "600 - 699"
  return (data.frame(vBuckets, inputVector))
}

# Store the function results in a variable and validate the results
Flight.minute.bins <- defineMinuteBuckets(raw_data$Flight.time.in.minutes)
Flight.minute.bins # There are some NA values which are coming up as "Error" (uncategorized)

# Create a new column within the survey data with the new minute buckets
raw_data$Flight.minute.bins <- Flight.minute.bins[,1]

# Group by week, report average satisfaction per group, coerce vector into df
mean <- data.frame(tapply(as.numeric(raw_data$Satisfaction), raw_data$Flight.minute.bins, mean, na.rm = TRUE))
# Add titles, columns to df necessary for plotting
colnames(mean) <- "Satisfaction"
mean$MinuteRange <- rownames(mean)
# Remove the "Error" bucket (these are the "NA" results and will interfere with the plot so we will remove them for
# the exploratory analysis and determine how to best address them at a later point)
mean <- mean[-8,]
# Plot results
barMeanFlightMinutes <- ggplot(mean, aes(x=MinuteRange, y=Satisfaction, group = 1)) + geom_col() 

# Create a function to put the flight distance into buckets of 500 mile intervals
defineMileBuckets <- function(inputVector) 
{
  vBuckets <- replicate(length(inputVector), "Error") # This will show in validation if anything is not categorized
  vBuckets[inputVector >= 0 & inputVector < 500] <- "0 - 499"
  vBuckets[inputVector >= 500 & inputVector < 1000] <- "500 - 999"
  vBuckets[inputVector >= 1000 & inputVector < 1500] <- "1000 - 1499"
  vBuckets[inputVector >= 1500 & inputVector < 2000] <- "1500 - 1999"
  vBuckets[inputVector >= 2000 & inputVector < 2500] <- "2000 - 2499"
  vBuckets[inputVector >= 2500 & inputVector < 3000] <- "2500 - 2999"
  vBuckets[inputVector >= 3000 & inputVector < 3500] <- "3000 - 3499"
  vBuckets[inputVector >= 3500 & inputVector < 4000] <- "3500 - 3999"
  vBuckets[inputVector >= 4000 & inputVector < 4500] <- "4000 - 4499"
  vBuckets[inputVector >= 4500 & inputVector < 5000] <- "4500 - 4999"
  return (data.frame(vBuckets, inputVector))
}

# Store the function results in a variable and validate the results
Flight.distance.bins <- defineMileBuckets(raw_data$Flight.Distance)
Flight.distance.bins

# Create a new column within the survey data with the new minute buckets
raw_data$Flight.distance.bins <- Flight.distance.bins[,1]

# Group by week, report average satisfaction per group, coerce vector into df
mean <- data.frame(tapply(as.numeric(raw_data$Satisfaction), raw_data$Flight.distance.bins, mean, na.rm = TRUE))
# Add titles, columns to df necessary for plotting
colnames(mean) <- "Satisfaction"
mean$DistanceRange <- rownames(mean)
# Plot results
barMeanFlightMiles <- ggplot(mean, aes(x=DistanceRange, y=Satisfaction, group = 1)) + geom_col() + 
  theme(axis.text.x = element_text(angle=90, hjust=1))

