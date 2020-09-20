## Read Stata labels in R

This is a function to read Stata labels from data imported by `haven`.
It returns a data.table if `data.table=TRUE` and a data.frame if
`data.table=FALSE`.

``` r
withstatalabels <- function(dt, return.data.table = FALSE) {
  if (!require(data.table) | !require(haven))
    stop('`withstatalabels` requires `data.table` and `haven` packages')
  dt <- data.table(dt)
  dtclass <- sapply(dt, class)
  dtlabelled <- names(dt)[dtclass %in% 'labelled']
  dt[, (dtlabelled) := lapply(.SD, as_factor),
     .SDcols = dtlabelled]
  # dt[] <- lapply(dt, unclass)  # Fix for haven bug
  if (!return.data.table)
    as.data.frame(dt)
  else
    dt[]
}
```
