#' Random Forest Cross-Validation function
#'
#' This function predicts output using covariates within the data.
#'
#' @param k Number of folds.
#' @keywords prediction
#'
#' @return A numeric with the cross validation error.
#'
#' @examples
#'
#' @import randomForest class
#' @export
my_rf_cv <- function(k) {
  sepal_mse <- vector()
  # split data into k folds randomly
  fold <- sample(rep(1:k, length = 150))
  data <- data.frame("x" = my_iris, "y" = class(my_iris), "split" = fold)
  for (i in 1:k) {
    # splitting into train and test data based on i
    data_train <- data %>% filter(split != i)
    data_test <- data %>% filter(split == i)
    # training randomForest model with 100 trees
    forest_model <- randomForest(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = data_train, ntree = 100)
    # predicting Sepal.Length using above model and test data
    prediction <- predict(forest_model, data_test[, -1])
    # evaluating MSE
    sepal_mse[i] <- colMeans((prediction - my_iris$Sepal.Length)^2)
  }
  return(mean(sepal_mse))
}
