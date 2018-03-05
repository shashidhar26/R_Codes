# This is the material for the first R session
# You'll learn the basics of R in this session
# 0. Overview of R base, Rstudio IDE - installation. Basic input output
#     
# 1. Working directory
# 2. Workspaces, R data, Rhistory files
# 3. IDEs available - extensibility of R through libraries
# 4. Libraries - loading, unloading, list all libraries
# 5. Comparisons to SAS
# 6. R as a calculator
# 7. Data types in R - numeric, integer, character(string), logical, complex 
# 8. Objects stored in R - vector, matrix, list and data.frame
# 9. Categorical variables in R - factors
# 10. Some basic functions - seq, cat, rep, etc

# If you have reached till here, you would have already installed R
# You might already have an IDE for R as well (RStudio is what I like)
 
# First set your WD to where you have your files
# BEST PRACTICE: Keep your code and data in the same root structure

# Working directory
getwd ()
# backslashes dont work- use double or forward
setwd('C:\\Drives\\_G\\Learning\\R_code\\LearnR')

 
# Installing packages
install.packages('car')
# When installing packages, if there are any dependencies,
# they'll be automatically installed
 
# Loading the library
library(car)
# More ways to do the same thing in R
require(car)
# Unloading a library
detach(package:car,unload=T)

# See what all packages are loaded into the memory
search()

# The assignment operator
a<-3
# Looking at what value is stored
a

pie<-3.14
secondpie<-22/7
# R is a case sensitive language
# 'Strongly typed' - in progamming paradigm

# what objects/functions are in workspace
ls()
# remove items from the workspace
rm(a)

# Cannot remove in-built objects which are given to you as part of
# some package
# Here 'pi' belongs to the base-R package and cannot be removed
rm(pi)
rm(list=ls())


# Programming 101 : Hello world :)
cat('Hello world')
cat(pi)
cat('hello pi')
cat('hello',pi)
cat('Value of pi is',pi)
# Functions can be nested among one another

cat('Value of pi is',round(pi,digits=2))

# R is a calculator
5+3

7^3

# this will give an error - why?
8(4)

# correct way
8*4

# Use things one at a time
# Up arrow and console thing
(8*4)^2

# Any such calculations can be done

##### R objects
# If you overwrite something, there is no warning or error!
# Be careful of what you have named your objects, 
# as it might be overwritten inadvertently
a<-7^3

class(a)
# Should get the answer as 'numeric'
mode(a)
# same answer! 
# Find out the difference between mode and class
# w


## R basic data types
# 1. Numeric 
# is the basic data type in R

# Let us 'c' now :) 
# c() or concatenate is a very powerful operator in R

num_var <-c(1,2,3,4,3.5,7.82)

mode(num_var)
class(num_var)

# 2. Integer 
intvar <-c(1:100)

mode(intvar)
class(intvar)


# All variables in R are stored as a vector

# can use bulk option on vectors
two_into_vector<-2*num_var

# 3. Character
mystring<-"Logistic"

# extending the same array
mystring<-c(mystring, "Multinomial")

mystring<-rep(mystring,3)
mode(mystring)
class(mystring)

# character is the third data type

# Categorical variables
cities<-c('Bangalore')

cities<-c(cities,'Mumbai')
cities<-c(cities,'Delhi')
cities<-rep(x=cities, 2)
cities<-c(cities,"Delhi")

factor_cities<-factor(x=cities)

levels(factor_cities)

mode(cities)
class(cities)

mode(factor_cities)
class(factor_cities)
table(factor_cities)
# Just change it to numeric
x<-as.numeric(factor_cities)


## and for the sake of completion
# 4. Logical
logic_var <- as.logical(c(1, 0, 2, 5, 0, 0))
## try it yourself
class(logic_var)
mode(logic_var)

# 5. Complex
cmplx_var <- 2 + 6i

class(cmplx_var)
mode(cmplx_var)

## R objects - list, matrix and data frame

## define a matrix
x<-matrix(seq(1,100,by=5),nrow=10,byrow=F)

class(x)
mode(x)
## define a list
list_var <- list(name="Fred", mynumbers=1:5, mymatrix=x, age=5.3)

class(list_var)
mode(list_var)

## define a data frame
df<-data.frame(x)
names(df)

# Data frame is equivalent to SAS dataset.

# Naming columns
names(df)<-c('below 50','above 50')

# Lets see more on data frames in further sessions

# Getting help in R
# If you know the function for something, use '?' to know more

?cat

# If you are not sure if a function exists, use '??'
??rep

# Full 'getting started' documentation is available here:
# http://cran.r-project.org/doc/manuals/R-intro.pdf

# One more nice link to explore R
# http://www.statmethods.net/index.html

# Link to read about data-types in R:
# http://www.r-tutor.com/r-introduction/basic-data-types

# Google is definitely your friend
# Also, try 'stack overflow' and 'R-bloggers' for 
# advanced queries

# After today's session practice some code here:
# http://tryr.codeschool.com/


# Type q() to quit R
q()

# To clear workspace you have the following command
rm(list=ls())


# Thank you 
# Save your workspace if needed

# PS: Mode versus Class
# Explained at https://stat.ethz.ch/pipermail/r-help/2008-April/158990.html
arr <- c(1:16)
mode(arr)
class(arr)
dim(arr)<-c(4,4)

rm(list=ls())

# Create two arrays 
m1<-c(1,2,3,4)
m2<-c(5,6,7,8)
mode(m1)
class(m1)
mode(m2)
class(m2)
# convert to matrices 
dim(m1)<-c(2,2)
dim(m2)<-c(2,2)

m3<-m1*m2
rm(m3)

# Now change the mode of the underlying values
mode(m1)<-"character"
mode(m2)<-"character"

is.numeric(m1)
is.numeric(m2)
m1<-factor(m1)
m2<-factor(m2)

