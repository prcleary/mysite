# knit_all.R

for (i in list.files(pattern = '*.Rmd', recursive = TRUE, full.names = TRUE)) {
  rmarkdown::render(i)
}
shell.exec('http://127.0.0.1:8000')
