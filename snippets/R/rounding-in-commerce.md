## Rounding like you expect it

Note how R rounds numbers.

``` r
round(1.45, 1)
```

    ## [1] 1.4

``` r
round(1.55, 1)
```

    ## [1] 1.6

It rounds to the nearest even number (“statistician’s rounding”).

Here is a neat solution from
<http://alandgraf.blogspot.co.uk/2012/06/rounding-in-r.html> (now also
in the `janitor` package).

``` r
cround <- function(x, n) {
  vorz <- sign(x)
  z <- abs(x) * 10 ^ n
  z <- z + 0.5
  z <- trunc(z)
  z <- z / 10 ^ n
  z * vorz
}
```

``` r
cround(1.45, 1)
```

    ## [1] 1.5

``` r
cround(1.55, 1)
```

    ## [1] 1.6
