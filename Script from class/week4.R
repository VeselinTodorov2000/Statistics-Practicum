beets <- c(41, 40, 41, 42, 44, 35, 41, 36, 47, 45) #guys that have eaten beats
no_beets <- c(51, 51, 50, 42, 40, 31, 48, 45) #guys that haven't eaten beats

c(xbar1 = mean(beets), xbar2 = mean(no_beets), sd1 = sd(beets), sd2 = sd(no_beets)) # mean time compared

stem.leaf.backback(beets, no_beets, rule.line = "Sturges") #table representation

boxplot(no_beets, beets, names = c("no beets", "beets"), horizontal = TRUE) #boxplot representation

hist(no_beets, col = c("yellow", "green")) #shows that diagram cols can be with different color

#density on two data
library(MASS)
speed <- michelson$Speed
expt <- michelson$Expt

fourthExperiment <- speed[expt == 4] 
fifthExperiment <- speed[expt == 5]

d_4 <- density(fourthExperiment)
d_5 <- density(fifthExperiment) #calculations

#calculate interval
xrange <- range(c(d_4$x, d_5$x))
yrange <- range(c(d_4$y, d_5$y))

plot(d_4, xlim = xrange, ylim = yrange, xlab = "densities", main = "")
lines(d_5, lty = 2)
legend(600, 0.008, legend = c("Fourth", "Fifth"), lty = c(1,2))

qqplot(fourthExperiment, fifthExperiment)


#lists and data frames

b <- list(beets = beets, "no beets" = no_beets)
"no_beets"

student <- c("Ivan", "Maria")
grade <- c(6, 5)
attendance <- c("Excellent", "V. good")
data.frame(student, grade, attendance)

boxplot(Speed~Expt, data = michelson)
mean(Speed~Expt, data = michelson) 

stacked <- stack(b)
headtail(stacked)
