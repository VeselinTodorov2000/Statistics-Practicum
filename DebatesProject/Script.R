rm(list = ls())
library(readxl)
library(utf8)


#Добавяне на данните от таблицата
answers <- read_excel("C:\\Users\\vesel\\Desktop\\Statistics-Practicum\\DebatesProject\\Answers.xlsx")
colnames(answers) <- paste("Question", 0:ncol(answers), sep="")
str(answers)
View(answers)

#tibble [43 x 6] (S3: tbl_df/tbl/data.frame)
#$ Question0: POSIXct[1:43], format: "2021-05-10 22:45:45" "2021-05-10 22:47:03" "2021-05-10 22:48:39" "2021-05-10 22:52:12" ...
#$ Question1: chr [1:43] "Да" "Да" "Да" "Да" ...
#$ Question2: num [1:43] 30 0 1 63 33 1 40 0 20 69 ...
#$ Question3: num [1:43] 0 0 1 47 33 0 50 0 20 69 ...
#$ Question4: num [1:43] 60 0 25 10 51 20 60 0 40 95 ...
#$ Question5: chr [1:43] "Да" "Не" "Да" "Да" ...

# Част 1 - Едномерен анализ

##################################################################################################################################

# Въпрос 1: Ще гласувате ли на предсрочните избори през лятото на 2021? - Категорийна променлива

utf8_print(answers$Question1)
#[1] "Да"           "Да"           "Да"           "Да"           "Да"           "Да"           "Да"           "Да"           "Да"          
#[10] "Да"           "Да"           "Не съм решил" "Да"           "Да"           "Да"           "Да"           "Да"           "Не"          
#[19] "Да"           "Не"           "Да"           "Да"           "Да"           "Да"           "Да"           "Да"           "Да"          
#[28] "Да"           "Да"           "Да"           "Да"           "Да"           "Не"           "Да"           "Да"           "Да"          
#[37] "Да"           "Да"           "Не съм решил" "Да"           "Да"           "Да"           "Да"          

table_q1 <- table(answers$Question1)
table_q1
prop.table(table_q1)
#Да    Не    Не съм решил 
#38    3     2

# Графично представяне
barplot(round(prop.table(table_q1)*100, 2), col = c("green", "red", "red"), main = "Ще гласувате ли на предсрочните избори?", xlab = "Отговор",
        ylab = "Проценти", ylim = c(0, 100))

#Тест за нормално разпределение
shapiro.test(table_q1)
#Shapiro-Wilk normality test

#data:  table_q1
#W = 0.77082, p-value = 0.04658

##################################################################################################################################

#Въпрос 2: Колко процента смятате че избрания на 04.04.2021 парламент е достатъчно добър, за да съществува? (0-100) - Дискретна променлива
percent_acceptance_q2 <- c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                           50, 50, 50, 50, 50, 30, 30, 30, 30, 30, 40, 40, 40, 40, 20, 20, 20,
                           10, 10, 1, 1, 69, 69, 60, 49, 40, 50, 80, 70, 100, 12, 33, 63, 51)

percent_acceptance_q2 <- sort(percent_acceptance_q2)
length(percent_acceptance_q2)
#[1] 43

mean(percent_acceptance_q2) # средна стойност
# [1] 32.27907
median(percent_acceptance_q2) # медиана
# [1] 30
table_q2 <- table(percent_acceptance_q2)        # мода - най - често срещана стойност
names(table_q2)[table_q2 == max(table_q2)]
# [1] "0"

# Следващите две функции описват центъра на разпределение
summary(percent_acceptance_q2)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#    0.00    5.50   30.00   32.28   50.00  100.00 

quantile(percent_acceptance_q2, prob = seq(0.1, 0.9, by = 0.1))
# 10%  20%  30%  40%  50%  60%  70%  80%  90% 
# 0.0  0.4 11.2 28.0 30.0 40.0 50.0 50.0 67.8 


# Вариация (дисперсия) на разпределението

range(percent_acceptance_q2)   # range - показва най - голямата и най - малката стойност
# [1]  0 100
var(percent_acceptance_q2)     # дисперсия
# [1] 683.9203
sd(percent_acceptance_q2)      # стандартно отклонение
# [1] 26.15187
fivenum(percent_acceptance_q2)
# [1]   0.0   5.5  30.0  50.0 100.0

# Графично представяне
hist(table_q2, main = "Колко процента смятате че избрания на 04.04.2021 парламент е достатъчно добър, за да съществува? (0-100)", 
     xlab = "Проценти /Нормално разпределение/",ylab = "Брой хора /Честота/", col = "purple")

# Проверка за нормално разпределение
d1 <- rnorm(n = 10^2, mean = mean(percent_acceptance_q2), sd = sd(percent_acceptance_q2))
qqplot(percent_acceptance_q2, d1, main = "Проверка за нормално разпределение")
abline(a = 0, b = 1) # чертае линия

#Тест за нормално разпределение
shapiro.test(table_q2)

#Shapiro-Wilk normality test

#data:  table_q2
#W = 0.71548, p-value = 0.0001741


##################################################################################################################################


#Въпрос 3: Колко процента имате доверие на сегашния парламент? (0-100) - Дискретна променлива
percent_acceptance_q3 <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                           1, 10, 10, 10, 10, 20, 20, 20, 20, 20, 20, 20,
                           25, 30, 30, 33, 40, 40, 40, 47, 50, 50, 50, 50, 50,
                           50, 53, 60, 69, 69)

percent_acceptance_q3 <- sort(percent_acceptance_q3)
length(percent_acceptance_q3)
#[1] 43

mean(percent_acceptance_q3) # средна стойност
# [1] 23.65116
median(percent_acceptance_q3) # медиана
# [1] 20
table_q3 <- table(percent_acceptance_q3)        # мода - най - често срещана стойност
names(table_q3)[table_q3 == max(table_q3)]
# [1] "0"

# Следващите две функции описват центъра на разпределение
summary(percent_acceptance_q3)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#    0.00    5.50   30.00   32.28   50.00  100.00 

quantile(percent_acceptance_q3, prob = seq(0.1, 0.9, by = 0.1))
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   0.00    0.00   20.00   23.65   43.50   69.00 

# Вариация (дисперсия) на разпределението
range(percent_acceptance_q3)   # range - показва най - голямата и най - малката стойност
# [1]  0 69
var(percent_acceptance_q3)     # дисперсия
# [1] 490.5183
sd(percent_acceptance_q3)      # стандартно отклонение
# [1] 22.14765
fivenum(percent_acceptance_q3)
# [1]   0.0   0.0  20.0  43.5 69.0

# Графично представяне
hist(table_q3, main = "Колко процента имате доверие на сегашния парламент? (0-100)", xlab = "Проценти /Нормално разпределение/",
     ylab = "Брой хора /Честота/", col = "blue", xlim = c(0,10))

# Проверка за нормално разпределение
d1 <- rnorm(n = 10^2, mean = mean(percent_acceptance_q3), sd = sd(percent_acceptance_q3))
qqplot(percent_acceptance_q3, d1, main = "Проверка за нормално разпределение")
abline(a = 0, b = 1) # чертае линия

#Тест за нормално разпределение
shapiro.test(table_q3)

#Shapiro-Wilk normality test

#data:  table_q3
#W = 0.7197, p-value = 0.0008798


##################################################################################################################################


#Въпрос 4: Колко процента имате доверие на президентът Румен Радев? (0-100) - Дискретна променлива
percent_acceptance_q4 <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 10,
                           20, 20, 25, 30, 40, 40, 40, 40, 50, 50, 50, 51,
                           60, 60, 65, 65, 70, 70, 70, 70, 70, 75, 80, 80, 80,
                           90, 95, 100, 100, 100)

percent_acceptance_q4 <- sort(percent_acceptance_q4)
length(percent_acceptance_q4)
#[1] 43

mean(percent_acceptance_q4) # средна стойност
# [1] 44.09302
median(percent_acceptance_q4) # медиана
# [1] 50
table_q4 <- table(percent_acceptance_q4)        # мода - най - често срещана стойност
names(table_q4)[table_q4 == max(table_q4)]
# [1] "0"

# Следващите две функции описват центъра на разпределение
summary(percent_acceptance_q4)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.00   10.00   50.00   44.09   70.00  100.00 

quantile(percent_acceptance_q4, prob = seq(0.1, 0.9, by = 0.1))
# 10% 20% 30% 40% 50% 60% 70% 80% 90% 
# 0   4  16  38  50  60  70  73  88 

# Вариация (дисперсия) на разпределението
range(percent_acceptance_q4)   # range - показва най - голямата и най - малката стойност
# [1]  0 100
var(percent_acceptance_q4)     # дисперсия
# [1] 1136.324
sd(percent_acceptance_q4)      # стандартно отклонение
# [1] 33.70941
fivenum(percent_acceptance_q4)
# [1]   0  10  50  70 100

# Графично представяне
hist(table_q4, main = "Колко процента имате доверие на президентът Румен Радев? (0-100)", xlab = "Проценти /Нормално разпределение/",
     ylab = "Брой хора /Честота/", col = "blue", xlim = c(0,15))

# Проверка за нормално разпределение
d1 <- rnorm(n = 10^2, mean = mean(percent_acceptance_q4), sd = sd(percent_acceptance_q4))
qqplot(percent_acceptance_q4, d1, main = "Проверка за нормално разпределение")
abline(a = 0, b = 1) # чертае линия

#Тест за нормално разпределение
shapiro.test(table_q4)

#Shapiro-Wilk normality test

#data:  table_q4
#W = 0.77919, p-value = 0.001461

##################################################################################################################################

# Въпрос 5: Смятате ли, че трябва да се увеличи броят на секциите за гласуване в чужбина? - Категорийна променлива

utf8_print(answers$Question5)
#[1] "Да"           "Да"           "Да"           "Да"           "Да"           "Да"           "Да"           "Да"           "Да"          
#[10] "Да"           "Да"           "Не съм решил" "Да"           "Да"           "Да"           "Да"           "Да"           "Не"          
#[19] "Да"           "Не"           "Да"           "Да"           "Да"           "Да"           "Да"           "Да"           "Да"          
#[28] "Да"           "Да"           "Да"           "Да"           "Да"           "Не"           "Да"           "Да"           "Да"          
#[37] "Да"           "Да"           "Не съм решил" "Да"           "Да"           "Да"           "Да"          

table_q5 <- table(answers$Question5)
table_q5

#Да    Не    Не мога да преценя 
#28    12    3

# Графично представяне
barplot(round(prop.table(table_q5)*100, 2), col = c("green", "red", "red"), main = "Смятате ли, че трябва да се увеличи броят на секциите за гласуване в чужбина?", 
        xlab = "Отговор", ylab = "Проценти", ylim = c(0, 100))

#Тест за нормално разпределение
shapiro.test(table_q5)
#Shapiro-Wilk normality test

#data:  table_q5
#W = 0.97453, p-value = 0.6939


##################################################################################################################################

# Част 2 - Многомерен анализ

#Категорийна vs Числова
#1. Въпрос 1 - Въпрос 2
question_1 <- c(rep("Да", 38), rep("Не", 3), rep("Не съм решил", 2))
sample_q2 <- sample(x = percent_acceptance_q2)
boxplot(sample_q2 ~ question_1)

##################################################################################################################################

#Числова vs Числова
#2. Въпрос 2 - Въпрос 3

# Корелационен анализ
rho <- round(cor(percent_acceptance_q2, percent_acceptance_q3), 3) #коефициент на корелация
par(mfrow = c(1, 1))
plot(percent_acceptance_q2, percent_acceptance_q3, main = "Correlation analysis")
abline(a = 0, b = 0.7, col = "red", lwd = 2)
cor(percent_acceptance_q2, percent_acceptance_q3)
#[1] 0.9675945

cor.test(percent_acceptance_q2, percent_acceptance_q3, method = "spearman")
#Spearman's rank correlation rho

#data:  percent_acceptance_q2 and percent_acceptance_q3
#S = 244.52, p-value < 2.2e-16
#alternative hypothesis: true rho is not equal to 0
#sample estimates:
#      rho 
#0.9815369 


#3. Въпрос 3 - Въпрос 4
# Линейна регресия
DF <- data.frame(percent_acceptance_q3, percent_acceptance_q4)
model <- lm(percent_acceptance_q3~percent_acceptance_q4)
model
#Call:
#        lm(formula = percent_acceptance_q3 ~ percent_acceptance_q4)
#
#Coefficients:
#        (Intercept)  percent_acceptance_q4  
#-4.4510                 0.6373  

summary(model)

#Call:
#        lm(formula = percent_acceptance_q3 ~ percent_acceptance_q4)
#
#Residuals:
#        Min       1Q   Median       3Q      Max 
#-11.0425  -3.4427  -0.1627   4.4510   9.8373 
#
#Coefficients:
#        Estimate Std. Error t value Pr(>|t|)    
#(Intercept)           -4.45103    1.37742  -3.231  0.00243 ** 
#        percent_acceptance_q4  0.63734    0.02492  25.571  < 2e-16 ***
#        ---
#        Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#Residual standard error: 5.445 on 41 degrees of freedom
#Multiple R-squared:  0.941,	Adjusted R-squared:  0.9396 
#F-statistic: 653.9 on 1 and 41 DF,  p-value: < 2.2e-16


resid(lm(percent_acceptance_q3~percent_acceptance_q4))

par(mfrow = c(1, 1))
plot(lm(percent_acceptance_q3~percent_acceptance_q4))

# Липса на автокорелация на грешките
install.packages("lmtest")
library(lmtest)
dwtest(model)
#Durbin-Watson test

#data:  model
#DW = 0.51514, p-value = 4.928e-10
#alternative hypothesis: true autocorrelation is greater than 0

