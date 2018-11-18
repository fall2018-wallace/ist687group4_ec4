
 
df$Airline.Status <- factor(df$Airline.Status)
df$Gender <- factor(df$Gender)
df$Type.of.Travel <- factor(df$Type.of.Travel)
df$Class <- factor(df$Class)
df$Airline.Code <- factor(df$Airline.Code)
df$binarySat <- factor(df$binarySat)

str(df)


set.seed(101)
samplerows <- sample(1:dim(df)[1])
trainrows <- floor(2 * dim(df)[1]/3)
train <- df[samplerows[1:trainrows],]
test <- df[samplerows[(trainrows+1):dim(df)[1]],]

library(tree)

tree.model <- tree(binarySat~.,data = train)
tree.model
summary(tree.model)

plot(tree.model)
text(tree.model, pretty=0);

tree.pred = predict(tree.model,test,type="class")

confusionMatrix <- function(target,prediction){
  confmatrix <- data.frame(target,prediction)
  cm <- table(confmatrix)
  return(cm) 
}

errorRate <- function(cm){
  return(((cm[1,2]+cm[2,1])/sum(cm)))
}

cm <- confusionMatrix(test[,17],tree.pred)
cm

error <- errorRate(cm)
error

cv.tree.model = cv.tree(tree.model, FUN = prune.misclass)
cv.tree.model
plot(cv.tree.model)
