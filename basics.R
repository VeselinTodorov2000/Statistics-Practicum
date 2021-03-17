#comment - #

#define variables
x <- 5
integerVariable <- 2 
doubleVariable <- 2.0
charVariable <- 'a'

#delete variables

rm(x)

#define vector

x = c(10,15,20,25,30)
y = c(1,2,3)

#vector operations
x[2] #indexing
x[2:4] #subset
x[-3] #excepted subset
x[-(2:4)] #excepted subset

z = c(x,y) #vector concatenation

which(x == 25) #find index where x = 25 (at this point)

seq(10) #from 1 to 10
rep(3,4) # sequence from 3 4-times

length(z) #number of elems

m = z + y #sum elem by elem (if length is different the shorted starts again)

#vector manipulation
sum(x) #collect all elements
mean(z) #average
sort(m) #shows vector sorted 
min(x) #finds minimal element
max(y) #finds maximal element

#variable types identificators
a <- NULL
b <- 10

is.null(a) #TRUE, checks for nullptr
is.na(a) #logical value
is.numeric(b) #TRUE, checks if b is numeric variable

rm(m)
#matrix declaration
m = matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = TRUE) 
  # 1 2 3
  # 4 5 6   <-   m

#matrix operations

m[2][1] #indexing
m[2,] #col
m[,2] #row
m[c(2,5)]
dim(m) #size
nrow(m) #number of rows
ncol(m) #number of cols
#dimnames() - adds names to the columns and rows

mat = matrix(c(1,2,3,4), nrow = 2, ncol = 2, byrow = TRUE)
matSolved = solve(mat) #solve system of equasions
t(mat) #rotates matrix
diag(mat) #main diagonal

#strings
"hello"
'hello'
#both '' and "" works

#wrong notations
#"He said "Help me""
#'He said 'Help me''
str <- "hello world!"
print(str)
cat(str, str) #concatenate two strings
nchar(str) #count characters in string
tolower(str) #makes everything lowercase
toupper(str) #makes everything uppercase

#substring, substr - substring methods

sort(str) #sorts

#loops
a = 5
#b = 10
while(a < b)
{
  print("Increase")
  a = a+1
}

for(p in 1:10)
{
  print(p)
}

#functions
multiply <- function(number, times)
{
  return (number*times)
}

multiply(10,2)


#task 1
v<-matrix(c(a,b,c,2,2,3), TRUE) #creates list

#task 2
mat1 <- matrix(1:6, 2)
mat2 <- matrix(c(rep(1,3),rep(2,3)), 2, byrow = F)

#task 3
x <- c(8,3,8,7,15,9,12,4,9,10,5,1)
[]