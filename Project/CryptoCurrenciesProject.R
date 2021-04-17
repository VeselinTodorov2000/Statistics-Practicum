rm(list = ls())

#Data from table export

library(readxl) #package that can read data from excel database

#read table poll_bg.xlsx to analyse poll answers
answers <- read_excel("C:/Users/vesel/Desktop/Statistics-Practicum/Project/poll_bg.xlsx")
colnames(answers) <- paste("Question", 0:ncol(answers), sep = "№") 
str(answers)
View(answers)







#Question 1 - До каква степен сте запознати с криптовалутите?

question1 <- c(rep("I've only heard, but never been interested", 16), rep("Little knowledge about their application", 17), rep("Good knowledge, but not in details", 13), rep("Very good knowledge in details", 2))
schema1<- table(question1)
schema1
prop.table(schema1)

barplot(sort(schema1), col = c("yellow", "green", "blue", "purple"), main = "До каква степен сте запознати с криптовалутите?", xlab = "Компетенция", ylab = "Брой", ylim = c(0, 40))
legend("top", legend = c("Доста добри", "Добри познания", "Единствено съм чувал/ла", "Минимални познания"),
                fill = c("yellow", "green", "blue", "purple"),       # Color of the squares
                        border = "black") # Color of the border of the squares

barplot(round(prop.table(sort(schema1))*100, 2), col = c("yellow", "green", "blue", "purple"), main = "До каква степен сте запознати с криптовалутите?", xlab = "Компетенция", ylab = "Процент от общия брой", ylim = c(0, 50))
legend("top",
       legend = c("Доста добри", "Добри познания", "Единствено съм чувал/ла", "Минимални познания"),
       fill = c("yellow", "green", "blue", "purple"),       # Color of the squares
       border = "black") # Color of the border of the squares

pie(round(prop.table(schema1)*100, 2), col = c("yellow", "green", "blue", "purple"), main = "До каква степен сте запознати с криптовалутите?")
#legend("bottom",
#       legend = c("Доста добри", "Добри познания", "Единствено съм чувал/ла", "Минимални познания"),
#       fill = c("yellow", "green", "blue", "purple"),       # Color of the squares
#       border = "black") # Color of the border of the squares

shapiro.test(schema1) #test for normality

mean(prop.table(schema1)) #mathematical expectation
var(prop.table(schema1)) #variable








#Question 2 - Инвестирате ли в криптовалути?

question2 <- c(rep("Yes", 9), rep("No", 31), rep("No, but I will", 8))
schema2 <- table(question2)
schema2
prop.table(schema2)

barplot(round(prop.table(schema2)*100, 2), col = c("yellow", "green", "blue"), main = "Инвестирате ли в криптовалути?", xlab = "Отговор", ylab ="Проценти", ylim = c(0,80))
legend("topright",
       legend = c("Не", "Не, но смятам в бъдеще", "Да"),
       fill = c("yellow", "green", "blue", "purple"),       # Color of the squares
       border = "black") # Color of the border of the squares

barplot(schema2, col = c("yellow", "green", "blue"), main = "Инвестирате ли в криптовалути?", xlab = "Отговор", ylab ="Брой", ylim = c(0,40))
legend("topright",
       legend = c("Не", "Не, но смятам в бъдеще", "Да"),
       fill = c("yellow", "green", "blue", "purple"),       # Color of the squares
       border = "black") # Color of the border of the squares

pie(round(prop.table(schema2)*100, 2), col = c("yellow", "green", "blue"), main = "Инвестирате ли в криптовалути?")
factor(schema2)





#Question 3 - В какви криптовалути инвестирате

question3 <- c("None", "BITCOIN", "ETHEREUM", "MONERO", "None", "BITCOIN", "None", "ETHEREUM", "None", 
               "BITCOIN", "ETHEREUM", "LITECOIN", "NEM", "RIPPLE", "DASH", "MONERO", "None", "None", "None", "ETHEREUM",
               "LITECOIN", "None", "None", "None", "None", "None", "None", "DOGECOIN", "None", "ETHEREUM", "LITECOIN",
               "BITCOIN", "None", "None", "ETHEREUM", "None", "None", "None", "None", "BITCOIN", "MONERO", "Raven", "BITCOIN",
               "LITECOIN", "None", "BITCOIN", "None", "None", "None", "None", "None", "None","None", "None", "None", "None",
               "None", "None", "None", "ETHEREUM")

schema3 <- table(question3)
schema3
prop.table(schema3)

barplot(schema3, col = c("blue", "green", "yellow", "red", "pink", "purple", "brown", "grey", "black", "orange"), main = "В какви криптовалути инвестирате", xlab = "Отговор", ylab = "Брой", ylim = c(0, 50))
barplot(round(prop.table(schema3)*100, 2), col = c("blue", "green", "yellow", "red", "pink", "purple", "brown", "grey", "black", "orange"), main = "В какви криптовалути инвестирате", xlab = "Отговор", ylab = "Проценти", ylim = c(0,70))
pie(round(prop.table(schema3)*100, 2), col = c("blue", "green", "yellow", "red", "pink", "purple", "brown", "grey", "black", "orange"), main = "В какви криптовалути инвестирате", ylim = c(0,70))

mean(schema3) #mathematical expectation

var(schema3) #dispersion

cryptoPerAnswer <- c(0,3,0,1,0,1,0,7,0,0,0,2,0,0,0,0,0,0,1,0,2,1,0,0,1,0,0,0,0,3,2,0,1,0,0,0,0,0,0,0,0,0,0,0,2)
length(cryptoPerAnswer) #number of answers

mean(cryptoPerAnswer) #mathematical expectation

var(cryptoPerAnswer) #dispersion

sd(cryptoPerAnswer) #standart difference

median(cryptoPerAnswer) #median

summary(cryptoPerAnswer) #summary of answers

quantile(cryptoPerAnswer, prob = seq(0.1, 1, by = 0.01)) #quantiles



hist(cryptoPerAnswer, col = c("blue", "green", "yellow", "grey", "grey", "grey","red"), main = "В колко криптовалути инвестират анкетираните?", xlab = "Разпределение", ylab = "Брой", ylim = c(0,50))

d1 <- rnorm(n = 10^2, mean = mean(cryptoPerAnswer), sd = sd(cryptoPerAnswer))
qqplot(cryptoPerAnswer, d1, main = "Проверка за нормално разпределение")
abline(a = 0, b = 1) # чертае линия



#Question 5 - Има ли криптовалута, в която желаете да инвестирате, но нямате възможност?
question5 <- c(rep("Yes", 14), rep("No", 22), rep("I can't say", 12))
schema5 <- table(question5)
schema5

barplot(schema5, col = c("blue", "green", "yellow"), main = "Има ли криптовалута, в която желаете да инвестирате, но нямате възможност?", xlab = "Отговор", ylab = "Брой", ylim = c(0,30))
legend("top", legend = c("Не мога да преценя", "Не", "Да"), fill = c("blue", "green", "yellow"), border = "black")

prop.table(schema5)

barplot(round(prop.table(schema5)*100, 2), col = c("blue", "green", "yellow"), main = "Има ли криптовалута, в която желаете да инвестирате, но нямате възможност?", xlab = "Отговор", ylab = "Проценти", ylim = c(0,60))
legend("top", legend = c("Не мога да преценя", "Не", "Да"), fill = c("blue", "green", "yellow"), border = "black")

pie(round(prop.table(schema5)*100, 2), col = c("blue", "green", "yellow"), main = "Има ли криптовалута, в която желаете да инвестирате, но нямате възможност?")





#Question 6 - Мислите ли, че криптовалутите ще изместят хартиените пари?
question6 <- c(rep("Yes, they are future of money", 5), rep("Yes, but not soon", 26), rep("No", 10), rep("I can't say", 7))
schema6 <- table(question6)
schema6

barplot(schema6, col = c("blue", "green", "yellow", "red"), main = "Мислите ли, че криптовалутите ще изместят хартиените пари?", xlab = "Отговор", ylab = "Брой", ylim = c(0,50))
legend("top", legend = c("Не мога да преценя", "Не", "Да, но не скоро", "Да. Те са бъдещето на парите"), fill = c("blue", "green", "yellow", "red"), border = "black")

prop.table(schema6)

barplot(round(prop.table(schema6)*100, 2), col = c("blue", "green", "yellow", "red"), main = "Мислите ли, че криптовалутите ще изместят хартиените пари?", xlab = "Отговор", ylab = "Проценти", ylim = c(0,100))
legend("top", legend = c("Не мога да преценя", "Не", "Да, но не скоро", "Да. Те са бъдещето на парите"), fill = c("blue", "green", "yellow", "red"), border = "black")


pie(round(prop.table(schema6)*100, 2), col = c("blue", "green", "yellow", "red"), main = "Мислите ли, че криптовалутите ще изместят хартиените пари?")



#Question 7 - 



#Question 8 - Смятате ли че България трябва да има национална криптовалута?
question8 <- c(rep("Yes", 13), rep("Yes, but if Bulgaria has all rights", 6), rep("No", 26))
schema8 <- table(question8)
schema8

barplot(schema8, col = c("blue", "green", "yellow"), main = "Смятате ли че България трябва да има национална криптовалута?", xlab = "Отговор", ylab = "Брой", ylim = c(0,60))
legend("top", legend = c("Не", "Да", "Да, но ако България е емитент"), fill = c("blue", "green", "yellow"), border = "black")

prop.table(schema8)

barplot(round(prop.table(schema8)*100, 2), col = c("blue", "green", "yellow"), main = "Смятате ли че България трябва да има национална криптовалута?", xlab = "Отговор", ylab = "Проценти", ylim = c(0,100))
legend("top", legend = c("Не", "Да", "Да, но ако България е емитент"), fill = c("blue", "green", "yellow"), border = "black")


pie(round(prop.table(schema8)*100, 2), col = c("blue", "green", "yellow"), main = "Смятате ли че България трябва да има национална криптовалута?")

