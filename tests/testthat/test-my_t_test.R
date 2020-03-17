test_that("incorrect string throws error", {
  expect_error(my_t.test(1:10, "a string", 5))
})
