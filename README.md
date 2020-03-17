[![Travis build status](https://travis-ci.org/dhruvrc/STAT302Package.svg?branch=master)](https://travis-ci.org/dhruvrc/STAT302Package)
[![Codecov test coverage](https://codecov.io/gh/dhruvrc/STAT302Package/branch/master/graph/badge.svg)](https://codecov.io/gh/dhruvrc/STAT302Package?branch=master)

Installation:
To download the STAT302Package, use the following code:
```{r, eval = FALSE}
# install.packages("devtools")
devtools::install_github("dhruvrc/STAT302Package")
library(STAT302Package)
```

Use:
To view the vignette, use the following code:
```{r, eval = FALSE}
# install.packages("devtools")
devtools::install_github("dhruvrc/STAT302Package", build_vignette = TRUE, build_opts = c())
library(STAT302Package)
# Use this to view the vignette in the STAT302Package HTML help
help(package = "STAT302Package", help_type = "html")
# Use this to view the vignette as an isolated HTML file
utils::browseVignettes(package = "STAT302Package")
```
