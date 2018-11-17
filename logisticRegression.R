

#library Amelia is used for logistic regression
library(Amelia)
library(caTools)

#Dropping the Satisfaction table from df, as the binarySatisfaction column has already been created
df <- subset(df,select= -c(Satisfaction))
str(df)
df$binarySat <- as.numeric(df$binarySat=="High") #if this is TRUE, High=1, Low=0 in the binarySat column

set.seed(200)

#Spliting the data into training and test data
sample = sample.split(df, SplitRatio = 2/3, group = NULL)
train = subset(df, sample == TRUE)
test  = subset(df, sample == FALSE)
dim(train)
dim(test)

#Performing logistic rgression on the training data
logReg <- glm(binarySat ~. , data = train, family = binomial)
summary(logReg)

#Coefficients:
                                     # Estimate Std. Error  z value Pr(>|z|)    
# (Intercept)                       2.690e+00  7.141e-02   37.676  < 2e-16 ***
#   Airline.Status                    5.206e-01  7.982e-03   65.228  < 2e-16 ***
#   Age                              -9.616e-03  6.075e-04  -15.827  < 2e-16 ***
#   Gender                           -3.388e-01  1.760e-02  -19.253  < 2e-16 ***
#   Price.Sensitivity                -1.526e-01  1.588e-02   -9.611  < 2e-16 ***
#   No.of.Flights.p.a.               -1.128e-02  6.580e-04  -17.135  < 2e-16 ***
#   X..of.Flight.with.other.Airlines  3.408e-03  1.107e-03    3.077  0.00209 ** 
#   Type.of.Travel                   -1.379e+00  1.137e-02 -121.276  < 2e-16 ***
#   No..of.other.Loyalty.Cards       -6.163e-02  8.888e-03   -6.934 4.08e-12 ***
#   Class                            -1.264e-01  1.987e-02   -6.358 2.05e-10 ***
#   Day.of.Month                      2.231e-03  9.958e-04    2.240  0.02507 *  
#   Airline.Code                     -4.217e-03  1.936e-03   -2.178  0.02938 *  
#   Scheduled.Departure.Hour          1.073e-02  1.872e-03    5.733 9.88e-09 ***
#   Departure.Delay.in.Minutes        4.419e-03  9.069e-04    4.873 1.10e-06 ***
#   Flight.Distance                   3.757e-04  7.149e-05    5.255 1.48e-07 ***
#   Arrival.Delay.in.Minutes         -1.024e-02  8.979e-04  -11.406  < 2e-16 ***
#   Flight.time.in.minutes           -2.935e-03  5.899e-04   -4.976 6.49e-07 ***
#   Expenditure.at.Airport            1.935e-04  1.141e-04    1.696  0.08981 .  
# ---

#Through the logistic regression model, we found that the variables Airline Status, Age, Gender, Price Sensitivity
#No. of Flights p.a., Type of Travel and Arrival Delay in minutes are statistically significant variables 
#since they have the lowest p-value i.e. 2e-16


logProbs = predict(logReg, newdata = test, type = "response")

logPred = ifelse(logProbs > 0.5, "High", "Low")

confusionMatrix <- data.frame(test$binarySat,logPred)
CM<-table(confusionMatrix)
CM
#error rate
error <- ((CM[1,1]+CM[2,2])/sum(CM))
error

