test_that("non-numeric input throws error", {
  expect_error(my_knn_cv("a string"))
})
