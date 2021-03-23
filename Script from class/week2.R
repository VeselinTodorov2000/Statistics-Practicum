# remove everything
#rm(list = ls())

# number of whales in Texas in 1999
whales <- c(74, 122, 235, 111, 292, 11, 211, 133, 156, 79)

# average
mean(whales)
# mean(whales) == sum(whales) / length(whales)
sum(whales) / length(whales)

# ambulances
hip_cost <- c(10500, 45000, 74100, NA, 83500, 38200, NA, 44300, 12500, 55700, 43900, 71900, NA, 6200)

#NA - no information
#NaN - non existing value
#INF - +/- infinity

sum(hip_cost, na.rm = TRUE) #sum everything without NA elements

mean(hip_cost, na.rm = TRUE) #average of everything without NA

#sort the data
sort(whales, decreasing = TRUE) # sorts the data in descending order
sort(whales, decreasing = TRUE) # sorts the data in ascending order

#turn on library UsingR 
library(UsingR)

head(names(precip)) #names of first coordinates of vector precip(R database vector) 
names(precip) #names of all coordinates

#give names to coordinates of vector
test_scores <- c(Alice = 87, Bob = 72, Shirley = 99) #example name: Alice, value = 87
test_scores #show vector

test_scores1 <- setNames(c(87, 72, 99), c("Alice", "Bob", "Shirley")) #another way to name coordinates of vector

#third way
test_scores2 <- c(87, 72, 99)
names(test_scores2) <- c("Alice", "Bob", "Shirley")
test_scores2

names(test_scores)

#vector can hold different type of data
x <- c(1, "two", "III") #everything will convert to string

as.numeric(x) #can't convert to int because "two" and "III" are inconvertible to int
as.numeric(x[1]) #convert 1 to 1
as.character(x[1]) #convert 1 to "1"

y <- scan() #no need of commas input
1
2
3
5 # values 

z <- scan(file.choose()) #read vector from file (I created file week2_data.txt)

y <- 0 : 10 # create vector with digits from 1 to 10 and set it to y

x <- seq(1, 100, 10) #create vector as arithmetic progression from 1 to 100 with difference of 10

#repetition values
rep(3,5) # 3 3 3 3 3
rep(1:4, 3) # 1 2 3 4 1 2 3 4 1 2 3 4
rep(c(1,3,5), c(2,4,6)) # 1 1 3 3 3 3 5 5 5 5 5 5
rep(1:3, 3:1) # 1 1 1 2 2 3

#item indexing
x[3] <- 3 #element on index 3 becomes 3
x[c(1,2,3)] #elements on index 1,2 and 3
x[-2] #all elements except on index 2

#access through coordinate names
precip[c("Seattle Tacoma", "New York")] #gives values on elements with names "Seattle Tacoma" and "New York"
test_scores1["Bob"] #gives value on element with name "Bob"

match(c("Seattle Tacoma", "New York"), names(precip)) #gives the index of "Seattle Tacoma" and "New York"'s values

#non precisible maths
sqrt(2)*sqrt(2) - 2 # result is not 0

#sentence
paste("x", 1:20, sep="") #creates x1 x2 x3 x4 ... x20
paste("x", 1:10, sep="-") #creates x-1 x-2 .. x-10

paste(c("Four", "The"), c("Score", "quick"), c("and", "fox"), sep = "_") #Four_Score_and, The_quick_fox

m <- factor(Cars93)
levels(m)
head(m)

# compare
3 < pi #check if 3 < 3,1428...
is.numeric("one") #check if "one" is Integer
"one" == 1 #check for equality
sqrt(2)*sqrt(2) == 2 #false
isTRUE(all.equal(sqrt(2)*sqrt(2), 2)) #right way to compare doubles
whales > 100 #shows a list of values of whales bigger than 100
100 < whales | whales > 200 #gives all values of whales bigger than 200 or lower than 100
# | - logical or
# & - logical and
