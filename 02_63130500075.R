# create variable
x <- 1
y <- 2
x+y
print(x + y)
z <- x+y
z
--------------------------------
# Numeric ex 1, 1.0
varA <- 100
class(varA)
?class
help(class)

# Logical: TRUE, FALSE
varB <- 1!=2
varB
class(varB)
class(1==2)

# Character
varC <- "Hello, My name is Safe"
class(varC)
--------------------------------
# Character Vectors
animals <- c("Ant","Bird","Cat")
class(animals)
length(animals)
animals[2]

# Logical Vectors
class(c(TRUE,FALSE,TRUE))

# Numeric Vectors
class(c(100,245,305,411,555))
--------------------------------
# Create Variable name
v1 <- c(1,2,3,4,5)
v2 <- c(2,3,4,5,6)
v1+v2

v3 <- c(1:5)
v4 <- c(1:10)
v3+v4

# Replicate
v3 <- rep(c(1,2,3),5)
v3

# Creating integer sequences
v4 <- c(1:100)
v4
--------------------------------
# Initial
name <- c("Antony,Boky,Caty")
age <- c(10,25,30)
club <- c("Sec A","Sec B","Sec A")
retired <- c(T,F,T)

# Create list
myList <- list
myList

# Or assign name
myList <- list(stdName = name,
               stdAge = age,
               stdClub = club,
               retired = retired)

myList[2] #get variable stdAge

View(myList)
--------------------------------
continent <- c("Africa","Asia","Europe","North America","Oceania","South America","Antarctica")
countries <- c(54,48,51,23,14,12,0)
world <- data.frame(continent,countries)
world
--------------------------------
x <- c(1:10)
x
mean(x)
sum(x)

# Summaries
summary(x)






