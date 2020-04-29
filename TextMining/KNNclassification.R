TrainDTM <- DTM[DTM$dimnames$Docs[1:200],]
TestDTM <- DTM[DTM$dimnames$Docs[201:400],]

Sci <- rep("Sci", 100)
Rec <- rep("Rec", 100)
Classification <- factor(c(Sci,Rec))

library(class)
set.seed(123)
prob.test <- knn(TrainDTM, TestDTM, Classification, k = 2, prob = TRUE)

a <- 1:length(prob.test)
b <- levels(prob.test)[prob.test]
c <- attributes(prob.test)$prob
result <- data.frame(Doc=a, Predict=b,Prob=c)
result$Correct <- ifelse(result$Predict == Classification, TRUE, FALSE)
