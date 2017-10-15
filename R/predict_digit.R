#' Predicts the digit based on a gray-scale image
#'
#' @param image a 784 (28x28) length numeric vector with gray-scale values between 0-255.
#'
#' @return the predicted digit
predict_digit <- function(image) {
  if (!is.numeric(image) || length(image) != 784) {
    stop("wrong image format. Need a 784 numeric vector with values 0-255.")
  }

  predict(rf, image)
}
