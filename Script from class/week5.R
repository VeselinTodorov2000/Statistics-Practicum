#perimeter of neck plot

plot(neck~wrist, data = fat) #x->wrist, y->neck
plot(neck~wrist,data=fat, subset=20<=age & age<30) #only between 20 and 30 years old
names(fat) #columns
plot(fat$height, fat$weight, subset = fat$height > 50)#where height is > 50

x <- fat$wrist[1:30] #take first 30 wrist records
y <- fat$neck[1:30] #take first 30 neck records

plot(x, y, main="Neck by wrist")
abline(v=mean(x), lty = 2) #horizontal line on the mean
abline(h=mean(y), lty = 2) #vertical line on the mean
points(mean(x), mean(y), pch=16, cex=4) #point on coord

cor(fat$wrist,fat$neck)
cor(fat$wrist,fat$ankle)

plot(fat$age, fat$ankle)
cor(ToothGrowth$dose, ToothGrowth$len)

l <- split(ToothGrowth$len, ToothGrowth$dose)
group_means <-c(mean(l[1]), mean(l[2]), mean(l[3]))
