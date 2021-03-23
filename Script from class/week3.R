library(UsingR)

#weight of kids vector
wts <- c(38, 43, 48, 61, 47, 24, 29, 48, 59, 24, 40, 27)
sort(wts) #sort data ascending

#center 

mean(wts) #average
sum(wts) / length(wts) #average

median(wts) #median

head(Macdonell)
weights <- Macdonell$frequency / sum(Macdonell$frequency) #compute frequency of every criminal
y <- Macdonell$height #heights of criminals vector
sum(weights*y) #average height of all criminals in Macdonell database (sum(XiYi), i = 1..n)

quantile(wts) #give info about intervals of 25% 50% 75% 100% (разпределенията от лекция 3)
quantile(wts, 0.30) #give our own interval

table(wts) #give frequency of data
range(wts) #give min and max value of data

diff(range(wts)) #difference of the min and max 61 - 24
var(wts) # дисперсия
sd(wts)

#we use hip_cost from previous week
range(hip_cost, na.rm = TRUE)
sd(hip_cost, na.rm = TRUE)

#graphical data representation
x <- c(2, 3, 16, 23, 14, 12, 4, 13, 2, 0, 0, 0, 6, 28, 31, 14, 4, 8, 2, 5)
stem(x)
head(bumpers)
stem(bumpers)

#histogram
hist(faithful$waiting) #shows histogram on plots
bins <- seq(40, 100, by=5) 
x <- faithful$waiting
out <- cut(x, breaks = bins) #cuts into levels with interval bins
table(out) #показва разпределението

hist(x, breaks = bins) #разпределението показано в хистограма
hist(x, breaks = seq(40, 100, by = 2))
hist(x, probability = TRUE) #хистограма на вероятностите
hist(x, main = "Хистограма") #name out histogram
hist(x, main = "Histogram", xlab = "ValueInX", ylab = "ValueInY") #give name to aces

#lty = "blank", "solid", "dashed"
hist(x, lty = "dashed", col = "green")

density(x) #function of variable
plot(density(x)) #shows diagram on plots
lines(density(x))     

boxplot(bumpers) # диаграма показваща в кой интервал данните са с най високи стойности
boxplot(bumpers, horizontal = TRUE) #rotates boxplot
boxplot(kid.weights$weight, horizontal = TRUE)
hist(kid.weights$weight)

#task 1
#В ChestSizes (HistData) се съдържат данни за гръдна обиколка на 5738 шотландски
#войници. Данните са във таблица.
#Намерете средното

library(HistData)
sizes <- rep(ChestSizes$chest, ChestSizes$count)
mean(sizes)
sum(sizes) / length(sizes)
