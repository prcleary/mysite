## Create .gitignore file from R

Amend with your own files/directories.

``` r
fileConn <- file('.gitignore')
writeLines(
  c(
    'data',
    'tmpdata',
    'outputs',
    'gislookup',
    '*.Rhistory',
    '~$*.*',
    '.Rproj.user'
  ),
  fileConn
)
close(fileConn)
```
