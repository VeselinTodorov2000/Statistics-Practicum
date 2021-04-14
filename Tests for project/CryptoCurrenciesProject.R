rm(list = ls())

#Data from table export

library(readxl) #package that can read data from excel database

answers <- read_excel("C:/Users/vesel/Desktop/Statistics-Practicum/Tests for project/poll.xlsx")
colnames(answers) <- paste("Question", 0:ncol(answers), sep = "№") 
str(answers)
View(answers)

#Question 1 - До каква степен сте запознати с криптовалутите?

question1 <- answers$`Question№1`
schema1<- table(question1)

barplot(sort(schema1), col = c("yellow", "green", "blue", "purple"), main = "До каква степен сте запознати с криптовалутите?", xlab = "Компетенция", ylab = "Брой", ylim = c(0, 40))
legend("top",
       legend = c("Доста добри", "Добри познания", "Единствено съм чувал/ла", "Минимални познания"),
       fill = c("yellow", "green", "blue", "purple"),       # Color of the squares
       border = "black") # Color of the border of the squares

barplot(round(prop.table(sort(schema1))*100, 2), col = c("yellow", "green", "blue", "purple"), main = "До каква степен сте запознати с криптовалутите?", xlab = "Компетенция", ylab = "Процент от общия брой", ylim = c(0, 50))
legend("top",
       legend = c("Доста добри", "Добри познания", "Единствено съм чувал/ла", "Минимални познания"),
       fill = c("yellow", "green", "blue", "purple"),       # Color of the squares
       border = "black") # Color of the border of the squares

pie(round(prop.table(schema1)*100, 2), col = c("yellow", "green", "blue", "purple"), main = "До каква степен сте запознати с криптовалутите?")

shapiro.test(schema1) #test for normality

mean(schema1) #mathematical expectation
var(schema1) #variable


#Question 2 - Инвестирате ли в криптовалути?

question2 <- answers$`Question№2`
schema2 <- table(question2)
schema2

barplot(round(prop.table(schema2)*100, 2), col = "green", main = "Инвестирате ли в криптовалути?", xlab = "Отговор", ylab = "Проценти")

#Question 3 - В какви криптовалути инвестирате

question3 <- c("Никакви", "BITCOIN", "ETHEREUM", "MONERO", "Никакви", "BITCOIN", "Никакви", "ETHEREUM", "Никакви", 
               "BITCOIN", "ETHEREUM", "LITECOIN", "NEM", "RIPPLE", "DASH", "MONERO", "Никакви", "Никакви", "Никакви", "ETHEREUM",
               "LITECOIN", "Никакви", "Никакви", "Никакви", "Никакви", "Никакви", "Никакви", "DOGECOIN", "Никакви", "ETHEREUM", "LITECOIN",
               "BITCOIN", "Никакви", "Никакви", "ETHEREUM", "Никакви", "Никакви", "Никакви", "Никакви", "BITCOIN", "MONERO", "Raven", "BITCOIN",
               "LITECOIN", "Никакви", "BITCOIN", "Никакви", "Никакви", "Никакви", "Никакви", "Никакви", "Никакви","Никакви", "Никакви",
               "Никакви", "Никакви", "Никакви", "ETHEREUM")

schema3 <- table(question3)
schema3

barplot(schema3, col = "blue", main = "В какви криптовалути инвестирате", xlab = "Отговор", ylab = "Брой", ylim = c(0, 40))
barplot(round(prop.table(schema3)*100, 2), col = "blue", main = "В какви криптовалути инвестирате", xlab = "Отговор", ylab = "Проценти", ylim = c(0,70))
pie(round(prop.table(schema3)*100, 2), col = c("blue", "green", "yellow", "red", "pink", "purple", "brown", "grey", "black", "orange"), main = "В какви криптовалути инвестирате", ylim = c(0,70))
mean(schema3)
median(schema3)

