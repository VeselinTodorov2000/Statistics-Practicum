rm(list = ls())
#BGN to USD course from 1991 to 2001
Lev <- c(28.25, 28.18, 28.82, 24.75, 21.56, 21.459, 20.735)
Date <- seq(as.Date("1991-02-19"), as.Date("1991-02-25"), by="days")

course <- data.frame(Date, Lev)
course
