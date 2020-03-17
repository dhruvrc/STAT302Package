#' k-Nearest Neighbors Cross-Validation function
#'
#' This function predicts output class using covariates within the input data
#'
#' @param train Input data frame.
#' @param cl True class value of the training data.
#' @param k_nn Integer representing the number of neighbors.
#' @param k_cv Integer representing the number of folds.
#' @keywords prediction
#'
#' @return A list containing a vector of the predicted class for all observations, and
#' a numeric with the cross-validation misclassification error.
#'
#' @examples
#'
#'
#' @import class
#' @export
my_knn_cv <- function(train, cl, k_nn, k_cv) {
  # split data into k folds randomly
  fold <- sample(rep(1:k_cv, length = n))
  data <- data.frame("x" = train, "y" = cl, "split" = fold)
  # empty matrix for predictions
  pred_mat <- matrix(NA, n, 2)
  for (i in 1:k_cv) {
    data_train <- data %>% filter(split != i)
    data_test <- data %>% filter(split == i)
    # predicting class of ith fold using all the other folds as training data
    class_pred <- knn(train = data_train, test = data_test, k = k_nn)
    # training models
    lm_1_cv <- lm(y ~ x, data = data_train)
    lm_10_cv <- lm(y ~ poly(x, 10), data = data_train)
    # record predictions
    pred_mat[inds == i, 1] = predict(lm_1_cv, data.frame(x = data_test$x))
    pred_mat[inds == i, 2] = predict(lm_10_cv, data.frame(x = data_test$x))
  }
  cv_err <- colMeans((pred_mat - data$y)^2)
  class <- knn(train = train, cl = cl, test = train, k = k_nn)
  my_list <- list("class" = class, "cv_err" = cv_err)
  return(my_list)
}
