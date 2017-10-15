library(devtools)
library(randomForest)

train <- read.csv("modelbuilder/train.csv")
y <- as.factor(train$label)
X <- train[ , 2:785]
rf <- randomForest(X, y, ntree = 100)
use_data(rf, internal = TRUE, overwrite = TRUE)
