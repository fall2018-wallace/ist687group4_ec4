
 
df$Airline.Status <- factor(df$Airline.Status)
df$Gender <- factor(df$Gender)
df$Type.of.Travel <- factor(df$Type.of.Travel)
df$Class <- factor(df$Class)
df$Airline.Code <- factor(df$Airline.Code)
df$binarySat <- factor(df$binarySat)

str(df)
