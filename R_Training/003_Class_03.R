# Today's session is about the programming capabilities of R
# We will learn, not only about R's built in fucntions (some of them)
# but also about writing custom fucntions

# Following are the key topics which we will cover in this session
# 1. Importing data frames (col classes)
# 2. Changing formats - the cumbersome 'Date' format
# 3. Loops in R 
# 4. Custom functions in R
# 5. Apply functions - if else, which, etc in more detail - simplifying the loops
# 6. Sorting and arranging data - plyr library

getwd()
setwd("C:/Drives/_G/Learning/R_code/LearnR")

# First import the data and change the factors into characters
data_2<-read.csv(file='data_2.csv',header=T,sep=',',fill=T)
str(data_2)
# data_2$Name is read by default as a factor. So, let us make it character
# This is harmless!
data_2$Name<-as.character(data_2$Name)
data_2$ID<-as.character(data_2$ID)


data_3<-read.csv(file='data_3.csv',header=T,sep=',',fill=T)
str(data_3)
# Look at how number after 100 did not get truncated (like in SAS)
# This is taken care of automatically by R
# However, like Excel, it automatically converted character to numbers

# Now let us see if changing to character takes 
# care of trailing zeroes properly
data_3$ID<-as.character(data_3$ID)
str(data_3)
# Sadly, it does not - leading to a loss of information

# Now, let us try colClasses option
data_3<-read.csv(file='data_3.csv',header=T,sep=',',fill=T,
                 colClasses = c("ID"="character"))
# Yipee it worked!

# If you are purist doing doing data import, 
# this is what you would do
all_columns<-c("Name"="character","ID"="character","Num_Id"="numeric")
data_3<-read.csv(file='data_3.csv',header=T,sep=',',fill=T,
                 colClasses = all_columns)
str(data_3)
# More information on ColClasses : http://stackoverflow.com/questions/2805357/specifying-colclasses-in-the-read-csv



# Now actually, Name is a date. How do we deal with it?
# Let us see if as.Date works
data_3$Name<-as.Date(data_3$Name,format="%b-%y")
data_3$Name
# No it doesn't :(

# Let us try something new
# create a helper column
data_3$Date<-paste("28",data_3$Name,sep="-")
data_3$Date<-as.Date(x=data_3$Date,format="%d-%b-%y")



# Of course, this could have been achieved in one line by nesting
# Try this!
# Read up more on date formats at the above link:
# http://www.statmethods.net/input/dates.html


# Creating columns Example: 

# dummy dataset
mydata <- data.frame(cbind(x1=c(1,2,3,4),x2=c(2,3,4,7)))

# Three ways for doing the same computations
# Method 1 : Specify everything in a detailed manner
mydata$sum <- mydata$x1 + mydata$x2
mydata$mean <- (mydata$x1 + mydata$x2)/2

# Method 2 : use attach and detach
attach(mydata)
mydata$sum1 <- x1 + x2
mydata$mean1 <- (x1 + x2)/2
detach(mydata)

# Method 3: use transform function
mydata <- transform( mydata,
                     sum2 = x1 + x2,
                     mean2 = (x1 + x2)/2) 



# Loops in R
# Like any programming language,
# R supports if, else, ifelse conditionals
# and also loops like 'for, while, etc

# Illustrating while loop
while(min(data_3$Num_Id)<100)
{
  data_3<-data_3[-which.min(data_3$Num_Id),]
}
which.min(data_3$Num_Id)
min(data_3$Num_Id)

# Simple functions
compare<-function(a,b){
  # Do some error handling and then write the below
  if(a>b) cat("a is greater than b")
  else cat("b is greater than a")
}
compare(10,15)
# Try writing your own functions

# Let us first write something using 'for' loops:
# Let us import some data set into R
motor_cars<-read.csv('mt_cars.csv',header=T,sep=',',fill=T)
str(motor_cars)
is.numeric(motor_cars$mpg)

# Need to initialise in case you need to use something in 'for' loop
numerics<-numeric(0)

# Now run the loop to populate the numerics
for(i in 1:ncol(motor_cars)){
  numerics[i]<-ifelse(is.numeric(motor_cars[,i]),TRUE,FALSE)
}
# check if numerics has populated properly
numerics


# apply functions in R - Native functions which will reduce your effort
# and are lot faster than for loops
# So, use apply in case you are confused if you should use a loop/ use apply

# Simple illustration of apply
matrix_reloaded<-matrix(data=seq(1,to=160,by=8),nrow=10)
row_means<-apply(X=matrix_reloaded,MARGIN=1,FUN=mean)
col_means<-apply(X=matrix_reloaded,MARGIN=2,FUN=mean)
#all_means<-apply(X=matrix_reloaded,MARGIN=c(1,2),FUN=mean)

# There are a lot of apply functions:
# Most widely used would be the sapply, lapply and tapply
# Read the documentation of each of these and use them 

str(motor_cars)
# Get only the numeric predictors in a vector
numeric_vars<-sapply(X=motor_cars,FUN=function(x){ifelse(is.numeric(x),TRUE,FALSE)})

?sapply
# Get the means of only numeric predictors
means<-sapply(X=motor_cars[numeric_vars],function(x){ifelse(is.numeric(x),mean(x),NA)})

# Get names of only those which have NA
na_vars<-sapply(X=motor_cars,FUN=function(x){ifelse(sum(is.na(x)!=0),TRUE,FALSE)})

sum(is.na(motor_cars$hp))
# lapply to impute all missing values with the mean
x<-motor_cars$hp
na_rm_df<-as.data.frame(lapply(motor_cars[numeric_vars],FUN = myfunction))

myfunction<-function(x){
  x[is.na(x)]<-mean(x,na.rm=T)
  x
}
a<-myfunction(motor_cars$hp)
# reconstruct by keeping columns together - explore rbind as well
motor_cars=cbind(na_rm_df,motor_cars[!numeric_vars])

# to find out the mpg by country, we can use tapply
a<-tapply(X=motor_cars$mpg,INDEX=motor_cars$country_of_manf,FUN=mean)
# and create a chart then and there
barplot(a,col="blue")

# Nice links which explains everything in detail
# http://nsaunders.wordpress.com/2010/08/20/a-brief-introduction-to-apply-in-r/
# http://www.r-bloggers.com/the-r-apply-function-a-tutorial-with-examples/

# Delete China from further analysis
# First find out which are the indices
China_indices<-which(motor_cars$country_of_manf=="China")
# then drop them
# motor_cars<-motor_cars[-which(motor_cars$country_of_manf=="China"),]
motor_cars<-motor_cars[-China_indices,]
motor_cars
# Of course, there a lot of ways to do the same thing - try it!


# Some easy functions to get idea
pairs(motor_cars[c("mpg","cyl","wt","gear","carb")])
# Now, let us take only the independent numeric variables
predcitors<-names(motor_cars[numeric_vars])[-1]
# Dependent variable is mpg - miles per gallon
respvar<-"mpg"
corr<-sapply(X=motor_cars[predcitors],
             FUN=function(x){cor(x=x,y=motor_cars[respvar],method='s')})

# Sorting/arranging data
motor_cars<-motor_cars[order(-motor_cars$mpg),]

# better way (faster way) - is to use the plyr
install.packages('plyr')
library(plyr)
motor_cars<-arrange(motor_cars,motor_cars$mpg)
# use the c() function to do sorting one column after another
# Try it out

rm(list=ls())

# Some hints for the exercises
# iris
# tapply(X=iris[,1],INDEX=iris$Species,FUN=mean)
# pairs(iris)


