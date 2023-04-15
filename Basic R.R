# installing the dslabs package
install.packages("dslabs")

# loading the dslabs package into the R session
install.packages("dslabs")  # to install a single package
install.packages(c("tidyverse", "dslabs", "tmap"))
# to install two packages at the same time installed.pcackages() # to see the list of all installed packages

library(tidyverse)
library(dslabs)

data(murders)

## Data types
class(murders)
str(murders)
head(murders)
names(murders)

varnames <- names(murders)
class(varnames)

# determining that the murders dataset is of the "data frame" class
class(murders)
# finding out more about the structure of the object
str(murders)
# showing the first 6 lines of the dataset
head(murders)

# using the accessor operator to obtain the population column
murders$population
# displaying the variable names in the murders dataset
names(murders)
# determining how many entries are in a vector
pop <- murders$population
length(pop)
# vectors can be of class numeric and character
class(pop)
class(murders$state)

# logical vectors are either TRUE or FALSE
z <- 3 == 2
z
class(z)

# factors are another type of class
class(murders$region)
# obtaining the levels of a factor
levels(murders$region)


murders %>%
  ggplot(aes(population, total, label=abb, color=region)) +
  geom_label()


# Section 1: OBJECTS
# To define a variable, we may use the assignment symbol, <-.
# There are two ways to see the value stored in a variable: (1) type the variable name into the console and hit Return, or 
# (2) use the print() function by typing print(variable_name) and hitting Return.
# Objects are things that are stored in named containers in R.  They can be variables, functions, etc.
# The ls() function shows the names of the objects saved in your workspace.

ls()
print(a)

# assigning values to variables
a <-2
b <--1
c <--4

print(c)
ls()

# solving the quadratic equation
(-b + sqrt(b^2 - 4*a*c))/(2*a)
(-b - sqrt(b^2 - 4*a*c))/(2*a)

# FUNCTIONS

# In general, to evaluate a function we need to use parentheses. If we type a
# function without parenthesis, R shows us the code for the function.
# Most functions also require an argument, that is, something to be written 
# inside the parenthesis.

# To access help files, we may use the help function, help(function_name),
# or write the question mark followed by the function name, ?function_name.

# The help file shows you the arguments the function is expecting,
# some of which are required and some are optional. If an argument is optional,
# a default value is assigned with the equal sign. The args() function also shows
# the arguments a function needs.

# To specify arguments, we use the equals sign. If no argument name is used,
# R assumes you’re entering arguments in the order shown in the help file.
# Creating and saving a script makes code much easier to execute.

# To make your code more readable, use intuitive variable names and include
# comments (using the “#” symbol) to remind yourself why you wrote a particular
# line of code.

log(8)
log(a)
args(log)
log(8)

data()
co2
pi

# Nesting functions: evaluate nesting inside out
log(exp(1.23))

log(1024, base=4)

## Assessment 1-3: Using variables 1 & 2, Functions

# Here is how you compute the sum for the first 20 integers
20*(20+1)/2

# However, we can define a variable to use the formula for other values of n
n <- 20
n*(n+1)/2

n <- 25
n*(n+1)/2

# Below, write code to calculate the sum of the first 100 integers 
n <- 100
n*(n+1)/2

# Below, write code to calculate the sum of the first 1000 integers 
n <- 1000
n*(n+1)/2

## Run the following code in the R console:
n <- 1000
x <- seq(1,n)
sum(x)

## Nested function calls

# log to the base 2 
log2(16)

# sqrt of the log to the base 2 of 16:
sqrt(log2(16))

# Compute log to the base 10 (log10) of the sqrt of 100. Do not use variables.
log10(sqrt(100))

## Always returns x
x <- 23.3

log(10^x)
log10(x^10)
log(exp(x))
exp(log(x, base = 2))

## Examining Variables
# There are also multiple ways to access variables in a data frame. 
# For example we can use the square brackets [[ instead of the accessor $. 
# Example code is included in the editor.

# To access the population variable from the murders dataset use this code:
m <- murders$population 
# To determine the class of object m we use this code:
class(m)
# Use the accessor to extract state abbreviations and assign it to a
a <- murders$abb 
# Determine the class of a
class(a)  

# We extract the population like this:
p <- murders$population
# This is how we do the same with the square brackets:
o <- murders[["population"]] 
# We can confirm these two are the same
identical(o, p)
# Use square brackets to extract `abb` from `murders` and assign it to 
b <- murders[["abb"]]
# Check if `a` and `b` are identical 
identical(a,b)


## Factors
# We can see the class of the region variable using class
class(murders$region)

# Determine the number of regions included in this variable 
length(levels(murders$region))

## Tables
# The "c" in `c()` is short for "concatenate," which is the action of connecting items into a chain
# The function `c()` connects all of the strings within it into a single vector, which we can assign to `x`
x <- c("a", "a", "b", "b", "b", "c")
# Here is an example of what the table function does
table(x)
str(murders)
# Write one line of code to show the number of states per region
table(murders$region)


## Vectors
# We may create vectors of class numeric or character with the concatenate function
codes <- c(380, 124, 818)
country <- c("italy", "canada", "egypt")
codes 
country

class(codes)
class(country)

# We can also name the elements of a numeric vector
# Note that the two lines of code below have the same result
codes <- c(italy = 380, canada = 124, egypt = 818)
codes <- c("italy" = 380, "canada" = 124, "egypt" = 818)
codes
class(codes)

# We can also name the elements of a numeric vector using the names() function
codes <- c(380, 124, 818)
country <- c("italy","canada","egypt")
names(codes) <- country
codes

# Using square brackets is useful for sub-setting to access specific elements of a vector
codes[2]
codes[c(1,3)]
codes[1:2]

# If the entries of a vector are named, they may be accessed by referring to their name
codes["canada"]
codes[c("egypt","italy")]

## coercion
x <- c(1, "canada", 3)
class(x)
x


a <- 1:45
class(a)
b <- as.character(a)
class(b)
b
y <- as.numeric(x)
y

# sorting
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
print(i_max)
murders$state[i_max]    # state name with highest number of total murders

min(murders$total)    # lowest number of total murders
i_min <- which.min(murders$total)    # index with lowest number of murders
print(i_min)
murders$state[i_min]    # state name with lowest number of total murders

x <- c(31, 4, 15, 92, 65)
x
rank(x)    # returns ranks (smallest to largest)

print(murders$total)

## Vector Arithmetic
# The name of the state with the maximum population is found by doing the following
murders$state[which.max(murders$population)]
#list(murders$state, murders$total, murders$population)

# how to obtain the murder rate
murder_rate <- (murders$total / murders$population) * 100000
murder_rate

# ordering the states by murder rate, in decreasing order
murders$state[order(murder_rate, decreasing=TRUE)]
murders$state[order(murder_rate)]

murder_rate[murders$state == "Wyoming"]

## Indexing
# defining murder rate as before
murder_rate <- murders$total / murders$population * 100000
#Alternative
murders$state[murder_rate <= 0.71]

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
## Alternative
murders$state[murders$region == "West" & murder_rate <= 1]

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

# Store the murder rate per 100,000 for each state, in `murder_rate`
murder_rate <- murders$total / murders$population * 100000

# Store the `murder_rate < 1` in `low` 
low <- murder_rate<1
low

# Get the indices of entries that are below 1
which(low)

## Ordering vectors
small <- murders$population < 1000000
murders$state[small]

# Names of states with murder rates lower than 1
low <- murder_rate < 1
murders$state[murder_rate<1]
# alternative
murders$state[low]

## Filtering
# Store the murder rate per 100,000 for each state, in `murder_rate`
murder_rate <- murders$total/murders$population*100000

# Store the `murder_rate < 1` in `low` 
low <- murder_rate < 1
str(murders)
# Create a vector ind for states in the Northeast and with murder rates lower than 1. 
ind <- murders$region == "Northeast" & low

# Names of states in `ind` 
murders$state[ind]

# Compute the average murder rate using `mean` and store it in object named `avg`
avg <- mean(murder_rate)
avg
# How many states have murder rates below avg ? Check using sum 
sum(murder_rate < avg)

# Store the 3 abbreviations in a vector called `abbs` (remember that they are character vectors and need quotes)
abbs <- c("AK", "MI", "IA")
abbs

# Match the abbs to the murders$abb and store in ind
ind <- match(abbs, murders$abb)
ind
# Print state names from ind
murders$state[ind]

## %in% operator
# Store the 5 abbreviations in `abbs`. (remember that they are character vectors)
abbs <- c("MA", "ME", "MI", "MO", "MU")

# Use the %in% command to check if the entries of abbs are abbreviations in the the murders data frame
murders$abb%in%abbs
abbs%in%murders$abb


## Logical operator
# Store the 5 abbreviations in abbs. (remember that they are character vectors)
abbs <- c("MA", "ME", "MI", "MO", "MU") 

# Use the `which` command and `!` operator to find out which index abbreviations are not actually part of the dataset and store in `ind`
ind <- which(!abbs%in%murders$abb)
# Names of abbreviations in `ind`
abbs[ind]


## 3.2 Basic Data Wrangling
# installing and loading the dplyr package
install.packages("dplyr")
library(dplyr)

# adding a column with mutate
library(dslabs)
data("murders")
murders <- mutate(murders, rate = total / population * 100000)

# sub-setting with filter
filter(murders, rate <= 0.71)

# selecting columns with select
new_table <- select(murders, state, region, rate)

# using the pipe
murders %>% mutate(murders, rate = total / population * 100000) %>% 
  select(state, region, rate) %>% filter(rate <= 0.71)

## Creating data frames
# creating a data frame with stringAsFactors = FALSE
grades <- data.frame(names = c("John", "Juan", "Jean", "Yao"), 
                     exam_1 = c(95, 80, 90, 85), 
                     exam_2 = c(90, 85, 85, 90),
                     stringsAsFactors = FALSE)

## Basic plots
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

# Transform population (not population in millions) using the log10 transformation and save to object log10_population
log10_population <- log10(murders$population)
View(log10_population, murders$population)

# boxplots of murder rates by region
boxplot(rate~region, data = murders)


## Basic conditionals
# an example showing the general structure of an if-else statement
a <- .0235689
if(a!=0){
  print(1/a*10000)
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
# ifelse() works on vectors
a <- 0
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

## Functions
# example of defining a function to compute the average of a vector x
# functions are objects
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
# provide logical decision TRUE v FALSE
# Determines arithmetic or geometric mean
x <- 1:10
avg <- function(x, arithmetic = TRUE){
  n <- length(x)
  ifelse(arithmetic, sum(x)/n, prod(x)^(1/n))
}


## For loops
# creating a function that computes the sum of integers 1 through n
compute_s_n <- function(n){
  x <- 1:n
  sum(x)
}
compute_s_n(1421)

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

# creating a plot for our summation function
n <- 1:m
plot(n, s_n)

# a table of values comparing our function to the summation formula
head(data.frame(s_n = s_n, formula = n*(n+1)/2))

# overlaying our function with the summation formula
plot(n, s_n)
lines(n, n*(n+1)/2)

## apply family of functions: apply, sapply, tapply, mapply
## other functions: split, cut, quantile, reduce, identical, unique

##----------------------------------------------------------------------
## assessment questions scratch pad
##----------------------------------------------------------------------
log(1024, base=4)

data(movielens)
str(movielens)
nlevels(movielens$genres)

# Here is an example creating a numeric vector named cost
cost <- c(50, 75, 90, 100, 150)
# Create a numeric vector to store the temperatures listed in the instructions into a vector named temp
# Make sure to follow the same order in the instructions
temp <- c(35, 88, 42, 84, 81, 30)

## Connecting Numeric and Character Vectors
# Create a character vector called city to store the city names
# Make sure to follow the same order as in the instructions
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
city
# Associate each temperature value with its corresponding city
names(temp) <- city
temp


## Sub-setting vectors
# cost of the last 3 items in our food list:
cost[3:5]
# temperatures of the first three cities in the list:
temp[1:3]

cost[c(1,5)]
# Define temp
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
names(temp) <- city
# Access the temperatures of Paris and San Juan
temp[c(3,5)]
temp[c("Paris", "San Juan")]

## Sequences
# Create a vector m of integers that starts at 32 and ends at 99.
m <- 32:99
# Determine the length of object m.
length(m)
# Create a vector x of integers that starts at 12 and ends at 73.
x <- 12:73
# Determine the length of object x.
length(x)

# Create a vector with the multiples of 7, smaller than 50. 
seq(7, 49, 7) 
# Create a vector containing all the positive odd numbers smaller than 100.
# The numbers should be in ascending order
seq(1, 100, 2)

## Sequences and length
# Create a sequence of numbers from 6 to 55, with 4/7 increments and determine its length
length(seq(6, 55, 4/7))
a <- seq(6,55,4/7)
length(a)

## Sequences of certain length
# Store the sequence in the object a
x <- seq(0, 100, length.out = 5)
print(x)

a <- seq(1, 10, length.out = 100)
a
# Determine the class of a
class(a)


## Integers
# Store the sequence in the object a
a <- seq(1, 10)
# Determine the class of a
class(a)

class(3L)

## Integers and Numerics

# Check the class of 1, assigned to the object a
class(1)
# Confirm the class of 1L is integer
class(1L)

## Coercion
# Define the vector x
x <- c(1, 3, 5,"a")
# Note that the x is character vector
x
# Use `as.numeric` to coerce `x` to a numeric vector. Be sure to reassign the new vector as `x`.
x <- as.numeric(x)


## sorting
# Access population values from the dataset and store it in pop
pop <- murders$population
# Sort the object and save it in the same object 
pop <- sort(pop)
# Report the smallest population size 
min(murders$population)

# Access population from the dataset and store it in pop
pop <-murders$population
# Use the command order to find the vector of indexes that order pop and store in object ord
ord <- order(pop)
# Find the index number of the entry with the smallest population size
ord[1]

# Define the variable i to be the index of the smallest state
i <- which.min(murders$population)

# Define variable states to hold the states
states <- murders$state
# Use the index you just defined to find the state with the smallest population
murders$state[i]


# Define a variable states to be the state names 
states <-murders$state
# Define a variable ranks to determine the population size ranks 
ranks <-rank(murders$population)
# Create a data frame my_df with the state name and its rank
my_df <- data.frame(states = states, ranks = ranks)
my_df 


# Define a variable states to be the state names from the murders data frame
states <- murders$state
# Define a variable ranks to determine the population size ranks 
ranks <- rank(murders$population)
# Define a variable ind to store the indexes needed to order the population values
ind <- order(murders$population)
# Create a data frame my_df with the state name and its rank and ordered from least populous to most 
my_df <-data.frame(state = states[ind], rank = ranks[ind])
my_df


## NA management
# Using new dataset 
library(dslabs)
data(na_example)

# Checking the structure 
str(na_example)

# Find out the mean of the entire dataset 
mean(na_example)

# Use is.na to create a logical index ind that tells which entries are NA
ind <- is.na(na_example)
ind
head(na_example, 12)
# Determine how many NA ind has using the sum function
sum(ind)

# Compute the average, for entries of na_example that are not NA 
mean(na_example[!ind])

# Assign city names to `city` 
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")

# Store temperature values in `temp`
temp <- c(35, 88, 42, 84, 81, 30)

## vectorized operations

# Convert temperature into Celsius and overwrite the original values of 'temp' with these Celsius values
temp <- 5/9 * (temp-32)
temp
# Create a data frame `city_temps` 
city_temps <- data.frame(city = city, temp = temp)
city_temps

# Define an object `x` with the numbers 1 through 100
x <- 1:100
# Compute the sum 
sum(1/x^2) 

# Load the data
library(dslabs)
data(murders)

# Store the per 100,000 murder rate for each state in murder_rate
murder_rate <- murders$total/murders$population * 100000
# Calculate the average murder rate in the US 
mean(murder_rate)

x <- c(2, 43, 27, 96, 18)
sort(x)
order(x)
rank(x)

min(x)
which.min(x)
max(x)
which.max(x)

name <- c("Mandi", "Amy", "Nicole", "Olivia")
distance <- c(0.8, 3.1, 2.8, 4.0)
time <- c(10, 30, 40, 50)

time <- time/60
time
speed <- distance/time
speed[name == "Olivia"]
data <- data.frame(speed = speed, name = name)
data


## dplyr package
# Loading data
library(dslabs)
data(murders)

# Loading dplyr
library(dplyr)

# Redefine murders so that it includes a column named rate with the per 100,000 murder rates
murders <- mutate(murders, rate = total/population * 100000)
str(murders)


# Redefine murders to include a column named rank
# with the ranks of rate from highest to lowest
murders <- mutate(murders, rank = rank(-rate))

# Use select to only show state names and abbreviations from murders
select(murders, state, abb)

# Filter to show the top 5 states with the highest murder rates
filter(murders, rank<=5)

# Use filter to create a new data frame no_south
no_south <- filter(murders, region!="South")
no_south

# Use nrow() to calculate the number of rows
nrow(no_south)

# Create a new data frame called murders_nw with only the states from the northeast and the west
murders_nw <- filter(murders, region %in% c("Northeast", "West"))
# Number of states (rows) in this category 
nrow(murders_nw)
# add the rate column
murders <- mutate(murders, rate =  total / population * 100000, rank = rank(-rate))

# Create a table, call it my_states, that satisfies both the conditions 
my_states <- filter(murders, region %in% c("Northeast", "West") & rate <1)
# Use select to show only the state name, the murder rate and the rank
select(my_states, state, rate, rank)

# show the result and only include the state, rate, and rank columns, all in one line, in that order
my_states <- filter(murders, region %in% c("Northeast", "West") & rate <1) %>% select(state, rate, rank)
my_states

# Create new data frame called my_states (with specifications in the instructions)
my_states <- murders %>% 
  mutate(rate = total/population * 100000, rank = rank(-rate)) %>% 
  filter(region %in% c("Northeast", "West") & rate < 1) %>% 
  select(state, rate, rank)
my_states


# Transform population (not population in millions) using the log10 transformation and save to object log10_population
log10_population <- log10(murders$population)

# Transform total gun murders using log10 transformation and save to object log10_total_gun_murders
log10_total_gun_murders <- log10(murders$total)

# Create a scatterplot with the log scale transformed population and murders 
plot(log10_population, log10_total_gun_murders)

# Store the population in millions and save to population_in_millions 
population_in_millions <- murders$population/10^6

# Create a histogram of this variable
hist(population_in_millions)

# Create a boxplot of state populations by region for the murders dataset
boxplot(population~region, data = murders)

library(dslabs)
data(heights)
options(digits = 3)    # report 3 significant digits for all answers

## Determining the sum of those above the height mean
str(heights)
mean(heights$height)
ind <- heights$height > mean(heights$height)
sum(ind)

sum(ind & heights$sex == "Female")
## proportion of heights dataset
female <- heights$sex == "Female"                           
mean(female)
## Alternatively
mean(heights$sex == "Female")

## frequency table
table(heights$sex)

## minimum height
min(heights$height)
## alternatively
i_min <- which.min(heights$height)
heights$height[i_min]

## determine the index
match(50,heights$height)
## Alternatively
match(min(heights$height),heights$height)

## What is the sex
heights$sex[1032]

## Maximum height
min(heights$height)
max(heights$height)
x <- 50:82
x <- min(heights$height):max(heights$height)
x

## How may obs in heights database between min-max integers (50:82) are NOT
## actually in the database
sum(!x%in%heights$height)

## adding a new column ht_cm
heights2 <- mutate(heights, ht_cm = height * 2.54)
heights2$ht_cm[18]
mean(heights2$ht_cm)

## creating a new data frame with only females
females<- filter(heights2, sex =="Female")
nrow(females)
mean(females$ht_cm)

library(dslabs)
data(olive)
head(olive)

## plot these two vectors
str(olive) 
plot(olive$palmitic,olive$palmitoleic)

## histogram these two vectors
hist(olive$eicosenoic)

## boxplot these two vectors
boxplot(palmitic~region, data = olive)

## What will the conditional expression return?
x <- c(1,2,-3,4,0)
if(all(x>0)){
  print("All Positives")
} else{
  print("Not All Positives")
}

## Which is always FALSE?
x <- c(TRUE, TRUE, TRUE)
all(x)
any(x)
any(!x)
all(!x)

##ifelse
char_len <- nchar(murders$state)
head(char_len)

x <- c(2, 3, -999, 1, 4, 5, -999, 3, 2, 9)
x<- ifelse(x == -999, NA, x)

# Assign the state abbreviation when the state name is longer than 8 characters 
# using nchar
library(dslabs)
data(murders)
new_names <- ifelse(nchar(murders$state)>8, murders$abb, murders$state)
new_names

## defining functions
my_func <- function(x){
  y <- x + 1
  y
}
my_func(10)

# Create function called `sum_n`
sum_n <- function(n){
  x <- 1:n 
  sum(x)
}
# Use the function to determine the sum of integers from 1 to 5000
sum_n(5000)

# Create `altman_plot`

x <- c(12.2, 18.8, 15.4, 25.0, 20.6)
y <- c(13.0, 16.1, 15.8, 19.4, 24.3)

altman_plot <- function(x, y){
  plot(x+y, y-x)
}
altman_plot(x, y)


# Lexical scoping is a convention used by many languages that determine when an
# object is available by its name. When you run the code below you will see
# which x is available at different points in the code.

x <- 8
my_func <- function(y){
  x <- 9
  print(x)
  y + x
}
my_func(x)
print(x)

##For Loops
# Here is an example of a function that adds numbers from 1 to n
example_func <- function(n){
  x <- 1:n
  sum(x)
}

# Here is the sum of the first 100 numbers
example_func(100)

# Write a function compute_s_n with argument n that for any given n computes the sum of 1 + 2^2 + ...+ n^2
compute_s_n <- function(n){
  x <- 1:n 
  sum(x^2)
}
# Report the value of the sum when n=10
compute_s_n(10)

results <- vector("numeric", 10)
n <- 10
for(i in 1:n){
  x <- 1:i
  results[i] <- sum(x)
}
results

## More for loops
# Define a function and store it in `compute_s_n`
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Create a vector for storing results
s_n <- vector("numeric", 25)

# write a for-loop to store the results in s_n
for(i in 1:25){
  s_n[i] <- compute_s_n(i)
}
s_n

# checking math with a plot
plot(n, s_n)

# Check that s_n is identical to the formula given in the instructions.
identical(s_n,n*(n+1)*(2*n+1)/6)

# Section 4: assessment
library(dslabs)
data(heights)
str(heights)

sum(ifelse(heights$sex =="Female", 1, 2))
mean(ifelse(heights$height > 72, heights$height, 0))

inches_to_ft <- function(x){x/12}
inches_to_ft(144)
sum(inches_to_ft(heights$height) < 5)

all(FALSE,FALSE,FALSE)


# define a vector of length m
m <- 10
f_n <- vector(length = m)

# make a vector of factorials
for(n in 1:m){
  f_n[n] <- factorial(n)
}

# inspect f_n
f_n
