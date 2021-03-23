rm(list = ls())
#BGN to USD course from 1991 to 2001
levQuantity <- c(28.25, 28.18, 28.82, 24.75, 21.56, 21.459, 20.735)
dateStrings <- c("19/02/1991", "20/02/1991", "21/02/1991", "22/02/1991", "23/02/1991", "24/02/1991", "25/02/1991")
dates <- as.Date(dateStrings, "%d/%m/%Y")

names(levQuantity) <- dates
plot(levQuantity, xlab = "Date", ylab = "Price of 1 USD", xaxt = "n")

