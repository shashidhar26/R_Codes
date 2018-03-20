## This code was created by Shashidhar for the purpose of training 'R enthusiasts'
## You can contact the developer at : shashidhar26@gmail.com

# Statistics in R - that's what we were waiting for :)
# In today's session, you'll learn about:
# 1. Basic hypothesis testing in R: binomial and normal distribution
# 2. Anova tests - between groups and within groups
# 3. Linear model - OLS in R (online course material)
# 4. Logistic regression model (online course material)
# 5. Other techniques - mention only (CART, kmeans, chaid, etc)

rm(list=ls())
getwd()
setwd("C:\\Drives\\_G\\Learning\\R_code\\LearnR")

### Hypothesis testing
# Basic hypothesis testing problems involve comparison of samples
# Student's t test

orchid<-data.frame(open=c(3,5,6,7,6,8,8,4,7,6),closed=c(7,8,6,9,10,11,7,8,10,9))
t.test(orchid$open,orchid$closed)
# Open orchids and closed orchids are different


# Try it with equal variance, 
t.test(orchid$open,orchid$closed,var.equal=T)

# Can also try with one sample
t.test(x=orchid$closed,mu=10)
# Understand the NULL and ALTERNATE hypothesis very clearly to interpret your result
# Also, understand p-value


## Binomial distribution
# when there are 'n' trials and each one has a probability of 'p' for success
# The probability can be measured using binomial distribution

# Example 1: I toss 8 coins one after the other, 
# each having a probability of 0.5 for heads
# What is the probability of getting
# a) greater than equal to 4 heads
# b) only 2 heads

# Answer:
# Let us first plot the binomial distribution
barplot(dbinom(x=0:8,size=8,prob=0.5))
# Now, check if all probabilities add to 1
sum(dbinom(x=0:8,size=8,prob=0.5))
# It does :) 
# 1 a) more than four heads - 4,5,6,7,8
sum(dbinom(x=4:8,size=8,prob=0.5))
# Answer : 63.7%
# 1 b) exactly two heads
dbinom(x=2,size=8,prob=0.5)
# Answer: 10.9%


# Example 2: The classic airline problem
# Airlines often overbook because they know that some people don't turn up!
# Indigo flies from New Delhi to Mumbai and knows (from history) that the probability 
# that a passenger won't turn up after booking a ticket is 0.1
# The aircraft is Airbus, (which can accommodate 180 seats)
# It issues 190 tickets
# a) What is the probability that exactly 180 people turn up ?
# b) In spite of this, what is the probability that flight departs with empty seats?
# c) What is the probability of greater  than equal to 10 empty seats?
# d) In how many cases, will the airline have to compensate?

# Let us just have a look at the plot
plot(dbinom(0:190,size=190,prob=0.9),col='red')

# 2 a) Prob that exactly 180 turn up
dbinom(x=180,size=190,prob=0.9)
# very less

# 2 b) Airline will have empty seats when any number less than 180 show up
sum(dbinom(0:179,size=190,prob=0.9))
# 98.5% chance of flying with empty seats, even after overbooking!

# 2 c) >=10 seats remain empty when <=170 people turn up
sum(dbinom(x=0:170,size=190,prob=0.9))
# 44% chance of having >10 empty seats!

# 2 d) Airline will have to compensate when more than 180 people come
sum(dbinom(181:190,size=190,prob=0.9))
# 0.7% of the times
# No wonder analytics can help you increase your profits!!! 
# Let us show this to Indigo :)


## Normal distribtion
# In a group there are 500 people. The IQ of the people is distributed 
# normally with a mean IQ of 98 and a s.d of 10. 
# How many people in that group have
# a) an IQ of more than 110
# b) an IQ of less than 80
# c) Plot this distribution using a red line

# a) More than 110
(1-pnorm(q=110,mean=98,sd=10))*500
# 57 people approximately

# b) less than 80
pnorm(q=80,mean=98,sd=10) * 500
# 18 people

# c) to plot it, we need to understand that 99.5% of the values lie
# within +/- 3 sigma limit (68,128)
# So axis labels should be 68,128
x<-seq(68,128)
y<-dnorm(x=x,mean=98,sd=10)
plot(x,y,col="red",pch=21)
# You get a normal distribution

# Anova on R
# Refer to the link:
# http://www.r-bloggers.com/anova-and-tukeys-test-on-r/

# OLS modelling on R
# Let us take a simple bivariate example:

x<-1:24
y<-as.numeric(c('2', '5', '9', '11', '14', '13', '17', '17', '21', '30', '25', '26', '37', '33', '30', '42', '39', '40', '39', '40', '45', '52', '48', '56'))
plot(x,y)
a<-lm(formula=y~x)
summary(a)

# Good example course for linear regression here:
# http://dss.princeton.edu/training/Regression101R.pdf
# http://www.ats.ucla.edu/stat/r/dae/rreg.htm

library(car)
data(Prestige)
summary(Prestige)
pairs(Prestige)

regression_result<-lm(prestige ~ education + log2(income) + 
                        women, data=Prestige)
summary(regression_result)
# Accessing individual elements of the regression result
Prestige$prestige-regression_result$fitted.values
regression_result$fitted.values
regression_result$model

# explore all possible options here
regression_result$call

# Logistic regression binary
# http://www.ats.ucla.edu/stat/r/dae/logit.htm

# Can read data directly from an URL in R like this
logit_data<-read.csv("http://www.ats.ucla.edu/stat/data/binary.csv")
sapply(logit_data, mean)

# Using factor variables in the model
logit_data$rank <- factor(logit_data$rank)
mylogit <- glm(admit ~ gre + gpa + rank, data = logit_data, family = "binomial")
summary(mylogit)
# See how rank has been used as a dummy variable

# No function to get Concordance
# Refer to the blog here to see  about Concordance
# http://shashiasrblog.blogspot.in/2014/02/binary-logistic-regression-fast.html
fastConc(mylogit)
# 69% concordance! Good 
sum(logit_data$admit) * (400- sum(logit_data$admit))


###########################################################
# Function fastConc : for concordance, discordance, ties
# The function returns Concordance, discordance, and ties
# by taking a glm binomial model result as input.
# It uses optimisation through subsetting
###########################################################
fastConc<-function(model){
  # Get all actual observations and their fitted values into a frame
  fitted<-data.frame(cbind(model$y,model$fitted.values))
  colnames(fitted)<-c('respvar','score')
  # Subset only ones
  ones<-fitted[fitted[,1]==1,]
  # Subset only zeros
  zeros<-fitted[fitted[,1]==0,]
  
  # Initialise all the values
  pairs_tested<-nrow(ones)*nrow(zeros)
  conc<-0
  disc<-0
  
  # Get the values in a for-loop
  for(i in 1:nrow(ones))
  {
    conc<-conc + sum(ones[i,"score"]>zeros[,"score"])
    disc<-disc + sum(ones[i,"score"]<zeros[,"score"])
  }
  # Calculate concordance, discordance and ties
  concordance<-conc/pairs_tested
  discordance<-disc/pairs_tested
  ties_perc<-(1-concordance-discordance)
  return(list("Concordance"=concordance,
              "Discordance"=discordance,
              "Tied"=ties_perc,
              "Pairs"=pairs_tested))
}
library(ROCR)

logit_scores<-prediction(predictions=mylogit$fitted.values,labels=mylogit$y)
logit_perf<-performance(logit_scores, "tpr", "fpr")
plot(logit_perf,col = "darkblue",lwd=2,xaxs="i",yaxs="i",tck=NA,
     main="Lorenz curve for the logistic model")
box()
abline(0,1, lty = 300, col = "green")
grid(col="aquamarine")

### AREA UNDER THE CURVE
logit_auc <- performance(logit_scores, "auc")
### GINI SCORE
gini_score<- (2*  logit_auc@y.values[[1]]) -1
### K S STATISTIC
logit_ks<-max(logit_perf@y.values[[1]]-logit_perf@x.values[[1]])


### Cluster analysis
# Not tried yet.
# But can refer to this online link
# http://www.r-statistics.com/2013/08/k-means-clustering-from-r-in-action/

