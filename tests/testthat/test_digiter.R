context("Prediction")

test_that("prediction return reasonable value", {
  testthat::expect_length(predict_digit(rep.int(0,784)), 1)
})
