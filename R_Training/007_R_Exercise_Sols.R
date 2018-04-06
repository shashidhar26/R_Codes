# This is the exercise for classes 3,4,5
rm(list=ls())
cat("\014")
getwd()
setwd("C:\Users\chinmay.jha\Desktop\Rtraining\coursera")
# Iris is a very popular dataset
# Load that dataset in R - use the '?' or '??' to find out where it is
my_iris<-iris

## Once done try to summarise the data here: (use summary, str, etc)
summary(my_iris)
str(my_iris)

## Get the mean, standard deviation, median, minimum and maximum values of all the columns first - 
# use a for loop and tapply

# Solution using for loop
iris_min<-numeric(0)
iris_max<-numeric(0)
iris_mean<-numeric(0)
iris_median<-numeric(0)
for(i in 1:ncol(my_iris)){
  if(is.numeric(my_iris[,i])){
    iris_mean[i]<-mean(my_iris[,i])
    iris_median[i]<-median(my_iris[,i])
    iris_min[i]<-min(my_iris[,i])
    iris_max[i]<-max(my_iris[,i])
  }
}
iris_mean

# Solution using apply
iris_mean<-lapply(X=my_iris,FUN=function(x){ifelse(is.numeric(x),mean(x),NA)})
iris_median<-lapply(X=my_iris,FUN=function(x){ifelse(is.numeric(x),median(x),NA)})
iris_min<-lapply(X=my_iris,FUN=function(x){ifelse(is.numeric(x),min(x),NA)})
iris_max<-lapply(X=my_iris,FUN=function(x){ifelse(is.numeric(x),max(x),NA)})


## Get the mean, standard deviation, median, minimum and maximum values of all the columns first - 
# write a function and one more form of apply called 'vapply'- try this!
simple_summary<-function(x){
  a<-c(mean(x,na.rm=T),sd(x,na.rm=T),median(x,na.rm=T),min(x,na.rm=T),max(x,na.rm=T))
  return(a)  
}
simple_summary(my_iris[,1])
vapply(my_iris[,1:4],simple_summary,c("Mean"=0,"Sd" =0,"Median "=0,"Min" =0,"Max"=0))

tapply(my_iris$Sepal.Length,my_iris$Species,simple_summary)


my_summary<- function(data){
  numeric_vars <- sapply(X=data,FUN=function(x){ifelse(is.numeric(x),TRUE,FALSE)})
  min_val<-sapply(data[numeric_vars],min,na.rm=T)
  max_val<-sapply(data[numeric_vars],max,na.rm=T)
  median_val<-sapply(data[numeric_vars],median,na.rm=T)
  mean_val<-sapply(data[numeric_vars],mean,na.rm=T)
  sd_val<-sapply(data[numeric_vars],sd,na.rm=T)
  stats <-rbind(min=min_val,max=max_val,median=median_val,mean=mean_val,sd=sd_val)
  return(stats)
}
my_summary(my_iris)

## Use correct form of apply to get correlations between the 'sepal.length' and other 3 numerics


dep_var<-my_iris[,"Sepal.Length"]
corr<-sapply(X=my_iris[,2:4],FUN=function(x){
  cor(x=x,y=dep_var)
})

cor()
numeric_vars<-sapply(X=iris,FUN=function(x){ifelse(is.numeric(x),TRUE,FALSE)})
cor(iris$Sepal.Length,iris[numeric_vars])
cor_val

numeric_vars<-sapply(X=iris,FUN=function(x){ifelse(is.numeric(x),TRUE,FALSE)})
cor_val <- sapply(X=iris[numeric_vars],cor,iris$Sepal.Length)
cor_val


## There is an error when we pass output of lapply to sapply
# There is an error when we pass output of lapply to subscript operator [] as well
# So, be careful when you use lapply and the output format it returns

## Now use a while loop to iteratively eliminate the values where correlations 
# are less than 0.4 

while(corr[which.min(corr)]<0.4){
  my_iris_2<-my_iris[,-(1+which.min(corr))]
  corr <- corr[-which.min(corr)]
}

corr
# Now achieve the same result without a 'while' loop - can try booleans, which, etc
drops<-which(corr<0.4)
my_iris_2<-my_iris[,-(1+drops)]

## Get the pairs to see what columns are correlated



categorical_preds<-c("Species")

## Write a custom function to create dummy variables for the categorical variable 'species'
## The function name is create_dummies
## It should take in the data frame as a parameter
## It should also take the indices/names of the categorical variables
## It should return the data frame with new dummy variables created

## Begin like this:

create_dummies<-function(data, categorical_preds){
# In a loop, do this:
# BEGIN LOOP
# Get the first categorical predictor
# Then create bins for that categorical predictor
# append these dummy variables to the data
# END LOOP
# Return the data
  for(i in 1:length(categorical_preds)){
    catvar<-as.character(data[,categorical_preds[i]])
    
    bins<-unique(catvar)
    for(j in 1:length(bins)){
      bin_name<-bins[j]
      data[bin_name]<-ifelse(catvar==bins[j],1,0)
    }
    
  }
  data
}


my_iris_3<-create_dummies(my_iris,categorical_preds="Species")

mydataframe<-data.frame(Names=c("Bangalore","Mumbai","Bangalore","Mumbai"),rates=c(1,5,6,8))
mydataframe_2<-create_dummies(mydataframe,categorical_preds=c("Names","Items"))

# Use the data from this link:
# http://www.ats.ucla.edu/stat/data/binary.csv
# and pass the data frame to your function above, passing rank as the categorical predictor


# Load the library (car) into R
# Check out the prestige data set
Prestige
rm(Prestige)

# plot pairs of Prestige data set - first four columns only
# some of the code has been written for you!
# plot(Prestige[,1:4])

# Treat all missing values in the 'Type' column as 'bc'

# Colour the points on the plot based on the 'Type'

# bc - blue collar workers - NAVY BLUE
# wc - white collar workers - DARK GRAY
# prof - professional - MAGENTA

# colors<-character(nrow(Prestige))
# colors[ Prestige$type=="prof"]<-"magenta"
# colors[ Prestige$type=="wc"]<-"darkgray"
# colors[ Prestige$type=="bc"]<-"blue"

# Export the colored graph as a *.png file 
# Write what you find as the insights in the commments


# Build a linear regression model with the Prestige data
# The model equation should be
# prestige ~ education + income + women

# Type the multiple R-Squared value and the adj-R-Sq value of the regression model in
# the comments

# Date functions
date<-as.Date("2010-01-01")
install.packages("lubridate")
require(lubridate)
date<-date+years(1)
date<-date+months(2)
diff.Date

library(stringr)
# Explore substr, regex, grep,etc for string manipulation
substr(x="Shashidhar",start=1,stop=6)
??stringr

vector<-c("shashi","Manhas","Himavarsha","him","Nor","Hymanshu")
grep("Hi",x=vector,ignore.case=F)
rm(list=ls())
