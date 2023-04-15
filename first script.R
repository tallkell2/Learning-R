installed.packages()

install.packages("tidyverse")
install.packages("dslabs")

# installed data objects in R
data()
data(Nile)

median(Nile)

library(tidyverse)
library(dslabs)
data(murders)
class(murders)
str(murders)
head(murders)
pop<-murders$population
length(pop)

# logical vector
z<-3==2
z
class(z)

# factor vector
class(murders$region)
levels(murders$region)


murders %>%
  ggplot(aes(population, total, label=abb, color=region)) +
  geom_label()

# assigning values to objects (aka: variables)
a <-2
b <--1
c <--4

ls()

# solving the quadratic equation
(-b + sqrt(b^2 - 4*a*c))/(2*a)
(-b - sqrt(b^2 - 4*a*c))/(2*a)

n <- 1000
x <- seq(1,n)
sum(x)

x<-23
log(10^x)
log10(x^10)
log(exp(x))
exp(log(x, base=2))


library(dslabs)
data(murders)
sort(murders$total)

x <- c(31, 4, 15, 92, 65)
x
sort(x)    # puts elements in order

index <- order(x)    # returns index that will put x in order
x[index]    # rearranging by this index puts elements in order
order(x)

murders$state[1:10]
murders$abb[1:10]

index <- order(murders$total)
murders$abb[index]    # order abbreviations by total murders

max(murders$total)    # highest number of total murders
i_max <- which.max(murders$total)    # index with highest number of murders
murders$state[i_max]    # state name with highest number of total murders

x <- c(31, 4, 15, 92, 65)
x
rank(x)    # returns ranks (smallest to largest)

# Section 2: Vectors, Sorting / 2.1 Vectors
# We may create vectors of class numeric or character with the concatenate function
codes <- c(380, 124, 818)
country <- c("italy", "canada", "egypt")
codes
country

# We can also name the elements of a numeric vector
# Note that the two lines of code below have the same result
codes <- c(italy = 380, canada = 124, egypt = 818)
codes <- c("italy" = 380, "canada" = 124, "egypt" = 818)
codes
# We can also name the elements of a numeric vector using the names() function
names(codes) <- country

# Using square brackets is useful for subsetting to access specific elements of a vector
codes[2]
codes[c(1,3)]
codes[1:2]

# If the entries of a vector are named, they may be accessed by referring to their name
codes["canada"]
codes[c("egypt","italy")]

seq(1:10)
1:10
conseq_intergers <-1:10

# Using square brackets is useful for subsetting to access specific elements of a vector
codes[2]
codes[c(1,3)]
codes[2:3]

# If the entries of a vector are named, they may be accessed by referring to their name
codes["canada"]
codes[c("canada","italy")]

#coercion
x <- 1:5
x
y <- as.character(x)
y
x <- as.numeric(y)
x


# Section 2: Vectors, Sorting / 2.2 Sorting
library(dslabs)
data(murders)
str(murders)
sort(murders$total)

x <- c(31, 4, 15, 92, 65)
x
sort(x)    # puts elements in order

index <- order(x)    # returns index that will put x in order
x[index]    # rearranging by this index puts elements in order
order(x)


murders$state[1:10]
murders$abb[1:10]

index <- order(murders$total)
murders$abb[index]    # order abbreviations by total murders

max(murders$total)    # highest number of total murders
i_max <- which.max(murders$total)    # index with highest number of murders
i_min <- which.min(murders$total)    # index with fewest number of murders
murders$state[i_max]    # state name with highest number of total murders
murders$state[i_min]    # state name with fewest number of total murders

# Access population from the dataset and store it in pop
pop <- murders$population
# Use the command order to find the vector of indexes that order pop and store in object ord
ord <- order(pop)
# Find the index number of the entry with the smallest population size
ord[1]

i_min <- which.min(murders$population)  # index with fewest number of murders
pop[i_min] 

# Find the index of the smallest value for variable total 
which.min(murders$total)

# Find the index of the smallest value for population
which.min(murders$population)

# Define the variable i to be the index of the smallest state
i <- which.min(murders$population)

# Define variable states to hold the states
states <- murders$state
# Use the index you just defined to find the state with the smallest population
states[i]


x <- c(31, 4, 15, 92, 65)
x
rank(x)    # returns ranks (smallest to largest)


#Section 2: Vectors, Sorting / 2.3 Vector Arithmetic

# The name of the state with the maximum population is found by doing the following
murders$state[which.max(murders$population)]

# how to obtain the murder rate
murder_rate <- murders$total / murders$population * 100000

# ordering the states by murder rate, in decreasing order
murders$state[order(murder_rate, decreasing=TRUE)]

mylist <- list(murder_rate, murders$population, murders$total)
mylist

# answer to first assignment

pop <- murders$population
pop <- sort(pop)
pop[1]


#2.2 Vector arithmetic
heights <- c(72,69,74,70,70,66,73,74,74,72,69,68,77,62)
mean(heights)
heights * 2.64
heights - mean(heights)

# The name of the state with the maximum population is found by doing the following
murders$state[which.max(murders$population)]


# how to obtain the murder rate
murder_rate <- murders$total / murders$population * 100000

# ordering the states by murder rate, in decreasing order
murders$state[order(murder_rate, decreasing=TRUE)]

# defining murder rate as before
murder_rate <- murders$total / murders$population * 100000
# creating a logical vector that specifies if the murder rate in that state is less than or equal to 0.71
index <- murder_rate <= 0.71
# determining which states have murder rates less than or equal to 0.71
murders$state[index]
# calculating how many states have a murder rate less than or equal to 0.71
sum(index)

# creating the two logical vectors representing our conditions
west <- murders$region == "West"
safe <- murder_rate <= 1
# defining an index and identifying states with both conditions true
index <- safe & west
murders$state[index]


x <- c(FALSE, TRUE, FALSE, TRUE, TRUE, FALSE)
which(x)    # returns indices that are TRUE

# to determine the murder rate in Massachusetts we may do the following
index <- which(murders$state == "Massachusetts")
index
murder_rate[index]

# to obtain the indices and subsequent murder rates of New York, Florida, Texas, we do:
index <- match(c("New York", "Florida", "Texas"), murders$state)
index
murders$state[index]
murder_rate[index]

x <- c("a", "b", "c", "d", "e")
y <- c("a", "d", "f")
y %in% x

# to see if Boston, Dakota, and Washington are states
c("Boston", "Dakota", "Washington") %in% murders$state


# installing and loading the dplyr package
install.packages("dplyr")
library(dplyr)

# adding a column with mutate
library(dslabs)
data("murders")
str(murders)
murders <- mutate(murders, rate = murders$total / murders$population * 100000)
head(murders)
# subsetting with filter
filter(murders, rate <= 0.71)

# selecting columns with select
new_table <- select(murders, state, region, rate)

# using the pipe
murders %>% select(state, region, rate) %>% filter(rate <= 0.71)

# creating a data frame with stringAsFactors = FALSE
grades <- data.frame(names = c("John", "Juan", "Jean", "Yao"), 
                     exam_1 = c(95, 80, 90, 85), 
                     exam_2 = c(90, 85, 85, 90),
                     stringsAsFactors = FALSE)
class(grades$names)


#Basic plots
library(dplyr)
library(dslabs)
data("murders")

# a simple scatterplot of total murders versus population
x <- murders$population /10^6
y <- murders$total
plot(x, y)

# a histogram of murder rates
murders <- mutate(murders, rate = total / population * 100000)
hist(murders$rate)
murders$state[which.max(murders$rate)]

# boxplots of murder rates by region
boxplot(rate~region, data = murders)



# an example showing the general structure of an if-else statement
a <- 5
if(a!=0){
  print(1/a)
} else{
  print("No reciprocal for 0.")
}

# an example that tells us which states, if any, have a murder rate less than 0.5
library(dslabs)
data(murders)
murder_rate <- murders$total / murders$population*100000
ind <- which.min(murder_rate)
if(murder_rate[ind] < 0.5){
  print(murders$state[ind]) 
} else{
  print("No state has murder rate that low")
}

# changing the condition to < 0.25 changes the result
if(murder_rate[ind] < 0.25){
  print(murders$state[ind]) 
} else{
  print("No state has a murder rate that low.")
}

# the ifelse() function works similarly to an if-else conditional
a <- 6
ifelse(a > 0, 1/a, NA)

# the ifelse() function is particularly useful on vectors
a <- c(0,1,2,-4,5)
result <- ifelse(a > 0, 1/a, NA)
result

# the ifelse() function is also helpful for replacing missing values
data(na_example)
no_nas <- ifelse(is.na(na_example), 0, na_example) 
sum(is.na(no_nas))

# the any() and all() functions evaluate logical vectors
z <- c(TRUE, TRUE, FALSE)
any(z)
all(z)


# example of defining a function to compute the average of a vector x
avg <- function(x){
  s <- sum(x)
  n <- length(x)
  s/n
}

# we see that the above function and the pre-built R mean() function are identical
x <- 1:100
identical(mean(x), avg(x))

# variables inside a function are not defined in the workspace
s <- 3
avg(1:10)
s


# the general form of a function
# my_function <- function(VARIABLE_NAME){
#   perform operations on VARIABLE_NAME and calculate VALUE
#   VALUE
# }

# functions can have multiple arguments as well as default values
avg <- function(x, arithmetic = TRUE){
  n <- length(x)
  ifelse(arithmetic, sum(x)/n, prod(x)^(1/n))
}
avg(25)

x <-c(125,122,102,156,100,98,156,132,105,108,106,107,100,101,95,103)
avg(x,FALSE)


# creating a function that computes the sum of integers 1 through n
compute_s_n <- function(n){
  x <- 1:n
  sum(x)
  }
compute_s_n(27)


# a very simple for-loop
for(i in 1:5){
  print(i)
}

# a for-loop for our summation
m <- 25
s_n <- vector(length = m) # create an empty vector
for(n in 1:m){
  s_n[n] <- compute_s_n(n)
}
s_n

# creating a plot for our summation function
n <- 1:m
plot(n, s_n)

# a table of values comparing our function to the summation formula
head(data.frame(s_n = s_n, formula = n*(n+1)/2))

# overlaying our function with the summation formula
plot(n, s_n)
lines(n, n*(n+1)/2)



dfex <- data.frame(AgeGroup=c("<5","5-11","12-17", "18-24", "25-34", "35-49", "50-64", "65-74", "75+"),
                   sort=seq(1:9))
