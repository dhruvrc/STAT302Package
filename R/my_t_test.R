#' T-test function
#'
#' This function performs a one sample t-test in R.
#'
#' @param x Numeric vector of data.
#' @param alternative Character string specifying the alternative hypothesis. This should only accept `
#' "two.sided"`, `"less"`, or `"greater".
#' @param mu Number indicating the null hypothesis value of the mean.
#' @keywords inference
#'
#' @return A list containing the numeric test statistic, degrees of freedom, value of the \code{alternative}
#' parameter, and the numeric p-value.
#'
#' @examples
#' my_t.test(1:10, "two-sided", 5)
#'
#' @import stats
#' @export
my_t.test <- function(x, alternative, mu) {
  if (alternative != "two-sided" && alternative != "less" && alternative != "greater") {
    stop("alternative needs to be input as 'two-sided', 'less', or 'greater'")
  }
  sample_size <- length(x)
  df <- sample_size - 1
  standard_error <- sd(x) / sqrt(sample_size)
  sample_mean <- mean(x)
  test_stat <- (mean(x) - mu) / standard_error
  results <- list("test_stat" = test_stat, "df" = df, "alternative" = alternative, "p_val")
  return(results)
}
