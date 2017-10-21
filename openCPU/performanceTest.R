library(RCurl)
library(jsonlite)
library(digiter)

train <- read.csv("modelbuilder/train.csv")

get_prediction_from_openCPU <- function(image) {

  json <- postForm("http://localhost/ocpu/library/digiter/R/predict_digit/json",
                   .params = list(image=paste('c(', paste(image,collapse = ","), ')', sep = "")))

  as.numeric(fromJSON(json))

}

get_prediction_local <- function(image) {
  as.numeric(predict_digit(as.numeric(image)))
}

system.time({
  correct <- 0
  for(i in 1:10) {
    p <- get_prediction_local(train[i,2:785])
    if(p==train[i,1]) correct <- correct + 1
  }

  correct / 100}
)


system.time({
correct <- 0
for(i in 1:10) {
  p <- get_prediction_from_openCPU(train[i,2:785])
  if(p==train[i,1]) correct <- correct + 1
}

correct / 100}
)
