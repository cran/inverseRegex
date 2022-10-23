## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo = FALSE------------------------------------------------------------

library(inverseRegex)


## ---- echo = TRUE-------------------------------------------------------------
inverseRegex('1aA')
inverseRegex('1aA', combineCases = TRUE)
inverseRegex('1aA', combineAlphanumeric = TRUE)
inverseRegex('Hello World!')
inverseRegex('Hello World!', combineSpace = TRUE, combinePunctuation = TRUE)


## ---- echo = TRUE-------------------------------------------------------------
inverseRegex('abcd1234567')
inverseRegex('abcd1234567', numbersToKeep = NULL)
inverseRegex('abcd1234567', numbersToKeep = 1:10)

## ---- echo = TRUE-------------------------------------------------------------
vapply(c(1, 1.0, 1.10, 1.12, 1.123), format, character(1), nsmall = 1)
inverseRegex(c(1, 1.0, 1.10, 1.12, 1.123), numbersToKeep = 2:10)

## Vectors of class integer are just converted using as.character.
inverseRegex(1L)


## ---- echo = TRUE-------------------------------------------------------------
inverseRegex(c(1, 1.0, 1.10, 1.12, 1.123))
inverseRegex(data.frame(a = c(1, 1.0, 1.10, 1.12, 1.123)))


## ---- echo = TRUE-------------------------------------------------------------
unique(inverseRegex(iris, numbersToKeep = 2:10))


## ---- echo = TRUE-------------------------------------------------------------
occurrencesLessThan(c(LETTERS, 1))

## When called on a data frame occurrencesLessThan will assess each column individually.
x <- iris
x$Species <- as.character(x$Species)
x[27, 'Species'] <- 'set0sa'
unique(occurrencesLessThan(x))

