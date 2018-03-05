# This is the material for the second R session
# You'll learn about data frames in this session
# 1. Reading csv - other data sources
# 2. Data frames
# 3. subsets and subscripts
# 4. summary statistics
# 5. SQL in R


## get current working directory
getwd()

## set current working directory
setwd("G:\\Learning\\R_code\\LearnR")

rm(list=ls())
#### Some basic functions in R
# http://www.statmethods.net/management/functions.html

# Vectors can be subsetted
# http://www.statmethods.net/management/subset.html
# select variables v1, v2, v3
vector_1<-c(1,2,seq(3,30,by=3),4,35)

# positive subscripts
subset_1<-vector_1[1:5]
# functions as subscripts
subset_2<-vector_1[seq(2,length(vector_1),by=2)]
# negative numbers as subscripts
subset_3<-vector_1[-1:-5]
# random sample
subset_4<-vector_1[sample(1:length(vector_1),8,replace=T)]




## import a csv file to a data frame
wine <- read.csv("wine.csv")

seq(from=1,to=nrow(wine),by=2)
## write a csv file
write.csv(wine, "wine.csv", row.names = F)

## check dimensions of data frame
dim(wine)

## check number of rows
nrow(wine)

## check number of columns
ncol(wine)
## another way -- length() function

## check column names
colnames(wine)<-c("1type",colnames(wine)[2:14])
summary(wine[,2:5])
median(x=wine$Alcohol[which(wine$Alcohol>0)],na.rm=T)

## check the data frame structure
str(wine)

## check first few records
head(wine, n= 10)

## similarly tail() function is used to check last records
# Explore this yourself

## data frames are subsettable too!
## access individual row
wine[3,]

## access group of rows
wine[2:5,]

## access individual columns
wine[,c(2,3,5)]

## columns (and rows) can also be accesssed by their names
#names(wine)
wine[,c("Type", "Dilution")]


## another way to access columns ($ operator)
wine$Alcohol



## EDA analysis
install.packages('raster')
library(raster)
summary(wine$Alcohol)

## mean
mean(wine$Alcohol)
## median
median(wine$Alcohol)
## mode
modal(wine[,2])
## variance
var(wine$Alcohol)
## standard deviation
sd(wine$Alcohol)

## histogram
hist(wine$Alcalinity, breaks=50, col = "Blue")


## create derived variable
wine$strength <- ifelse(wine$Alcohol > 13, "Strong", "Weak")

names(wine)



## changing variable type
wine$strength <- as.factor(wine$Type)

str(wine)

wine$Type <- as.factor(wine$Type)

## check levels of a factor
levels(wine$strength)

## table function
table(wine$Type, wine$strength)

## find sum of a column
sum(wine$Ash)

## find maximum -- max() or minimum -- min() value
max(wine$Ash)



## SQL like functions
library(sqldf)
# If you dont have this package, it will complain
# so, install it. you should know how by now :) 

sqldf("select Type, avg(Alcohol) from wine group by Type")


# If you want to parametrise some variables, you can use nested function paste
type<-"Type"
alcohol<-"Alcohol"
m<-paste("select ",type,", avg(",alcohol,") from wine group by",type)
sqldf(m)

## sqldf can be used to join 2 dataframes

## another function to join dataframes is merge() -- explore this function
data2<-read.csv('data_2.csv')
data3<-read.csv('data_3.csv')
data4<-data2[,1:2]
data5<-data2[, c(1,3,4)]
merge(x=)

row.names(cars)
row.names(mtcars)<-c(1:32)
nrow(mtcars)
mtcars
View(mtcars)
rm(mtcars)
View(mtcars)

sample(1:100,5,replace=F)

