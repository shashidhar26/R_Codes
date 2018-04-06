#### WISH YOU ALL THE BEST ###########

# Final Exam in R
# This is an open laptop open website exam 
# (which means you can refer to any online/offline links to answer this exam
# The only constraint is that you should not get help from a 'person' 
# i.e. no communication from you trainer or group members)
# The maximum marks is 100 (95+5),
# Trainer will award 5 marks as per your performance in the class and 
## on the basis of other off-session interaction/assessment   
# You will need to write the codes in this particular file

# Once completed, please go the folder in which you have saved this file
# and rename it to 'TrainR_<your first name>_<Your last name>.R' format.
# for example, I would rename my file to 'TrainR_Shashidhar_Shenoy.R'

## Doing the above step fetches you                                (2 marks) 


# Q1. How will you see what is the current working directory in R? (2 marks)

getwd()

# OR 
# Q1.1 How will you see what is the current working directory in R? (1 marks)
getwd()
# Q1.2 How will you enlist the files in current directory in R? (1 marks)
dir()

# Q2. How will you change the current working directory in R?  Write the command which 
#     changes the current wD to a folder 'R_WD' on the desktop. 
#     You might have to create the folder on your desktop first    (4 marks) 
setwd("C:\\Users\\shashidhar.n.shenoy\\Desktop\\R_WD")
# OR 

# Q2.1 How will you change the current working directory in R?  Write the command which 
#     changes the current wD to a folder 'R_WD' on the desktop. 
#     You might have to create the folder on your desktop first         (2 marks) 
setwd("C:\\Users\\shashidhar.n.shenoy\\Desktop\\R_WD")
# Q2.2 How will you make the 'R_WD' as default working directory in R?  (2 marks)

#step 1 -> locate Rprofile.site file, it is located at C:\Program Files\R\R-3.0.2\etc\Rprofile.site
#step2 ->open the file with text editor say notepad
#step 3->Add the line below to the end of theRprofile.site file and add a new line.
#step 4-> write setwd("C:\\Users\\shashidhar.n.shenoy\\Desktop\\R_WD") in added line
#step 5->save and close teh file an reopen R gui and type getwd()



# Q2.3  How will you install a package, install a package 'lubridate' (2) 
install.packages("lubridate")
# Q 2.4 get help on lubridate package. (1) 
library(lubridate)
??lubridate
help(lubridate)
?lubridate

# Q3. Command to clear all items from the workspace                (2 marks)
rm(list=ls())
# OR
# Q3. Write command to
# clear all items from the workspace                (1 marks)
rm(list=ls())
# clear console of R studio                         (1 marks)
cat("\014") 


# Q4. Command to check the version of R you have on your system 
#     (you need to paste the output of that command in this file)  (2 marks)
sessionInfo()
R.Version()

# Q5. Nicely print: 1:A, 2:B, ... 26:Z (2 marks)
labs <- paste(1:26, letters,sep=":")

# Q6. Create a vector 'w' of 10 random numbers using the sample function. 
#      The random numbers should be between 10 to 200 and should be unique. (2 marks)
vector1<-c(10:200)
set.seed(1)
w<-vector1[sample(1:length(vector1),10,replace=T)]
set.seed(1)
w<-vector1[sample(1:length(vector1),10,replace=T)]


# Q7. Replace the sixth element of 'w' by 'NA' ( missing value)    (2 marks)
w[6]<-NA
w


# Q8. Now find the mean, median and standard deviation of the vector 'w' 
#     (use appropriate argument to handle missing)                  (2 marks)
mean_w<-mean(w,na.rm=TRUE)
sd_w<-sd(w,na.rm=TRUE)
median(w,na.rm=TRUE)




# Q9. Create a vector 'unif' using a combination of 'ceiling' and 'runif' functions.
#     This vector will have 15 elements, between 1 to 500
#     FYI: runif can be used to generate random numbers
#     Once this is done, create a data frame 'random_df' with 6 columns, such that
#     'unif' is the first column.
#     Columns 2 and 6 should be such that, mean of col 2 and col 6 should be col 1
#     Columns 3 and 5 should be such that, mean of col 3 and col 5 should be col 1
#     Column 4 should be an exact replica of column 1
#     Logic is given in the code below
#                                                                  (10 marks)

# col1<-ceiling(runif(1,1,500))
# random<-floor(rnorm(n=1,mean=100,sd=100))
# col2<- col1+random
# col6<-col1-random
# mean(col2,col6) # will be equal to col 1
# ..... and so on
set.seed(3)
unif<-ceiling(runif(15,1,500))
set.seed(3)
col4<-ceiling(runif(15,1,500))
set.seed(1) 
random1<-floor(rnorm(n=1,mean=100,sd=100))
set.seed(2) 
random2<-floor(rnorm(n=1,mean=100,sd=100))
col2<- col1+random1
col6<- col1-random1
col3<- col1+random2
col5<- col1-random2
df<-matrix(c(unif,col2,col3,col4,col5,col6),ncol=6,byrow=F)
random_df<-data.frame(df)
names(random_df)<-c('uinf','col2','col3','col4','col5','col6')


# Q10. CAT is an entrance test to the prestigious Indian Institutes of Management.
#      The test consists of multiple choice questions, each question having 5 choices
#      This year, the test had 75 such questions - each question is independent of the other.
#      A student does not prepare for the test and wants to test his luck.
#      What is the probability of the student
#      a) getting all 75 answers correct
#      b) None of the answers correct
#      c) 30 answers correct
#      d) 20 or more answers correct
#      d) Plot the binomial distribution of student's success and check
#         what is the number of questions where the prob of success peaks 
#         approximate answer is ok. Using which.max() will fetch you full marks!      (6 marks)

#sol - probability of getting correct answer is 1/5 = .2
#      a) getting all 75 answers correct
dbinom(x=75,size=75,prob=0.2)
3.777893e-53
#      b) None of the answers correct
dbinom(x=0,size=75,prob=0.2)

#      c) 30 answers correct
dbinom(x=30,size=75,prob=0.2)

#      d) 20 or more answers correct
sum(dbinom(20:75,size=75,prob=0.2))

#      d) Plot the binomial distribution of student's success and check
#         what is the number of questions where the prob of success peaks 
#         approximate answer is ok. Using which.max() will fetch you full marks!      (6 marks)

barplot(dbinom(x=0:75,size=75,prob=0.2))
which.max(dbinom(x=0:75,size=75,prob=0.2))



# Q11. Load the time series data Nile in R
#      Plot the time series on a graph    
#      also plot a histogram for the data series.
#      Check the autocorrelation plot of the time series using the acf() function.

Nile
plot(Nile)
hist(Nile)
acf(Nile)
# this is to s to examine the autocorrelations with lag, The blue lines indicated bounds for statistical significance.
##values between these lines and zero are not statistically significant, while those above and below the lines are significant.
## ie upto 8 lags all values are significant
#the series appears approximately stationary with no long-term trend



#      Once that is done, load the below vectors in R
#      Sales data refers the dollar values of sales from 1991 to 2010
#      Advertising refers to the advertising amount in the same time period
#      Run an OLS for sales versus advertising. Paste the result in this sheet
sales<-c(100,102,104,99,106,100,109,118,114,113,115,112,109,115,117,119,122,123,122,121)
advertising<-c(20,19,20,18,21,19,21,24,22,22,22,21,21,21,21,23,23,23,22,23)
#      Create a lag of the variable 'advertising'. Now, run the OLS 
#      of sales versus lag(advertising). Paste the result again. 
#      Also write what is the difference between the two. Which is better according to you?

#                                                                            (8 marks)

sales_ts <- ts(sales, start = c(1991,1), frequency = 1)
ad_ts<- ts(advertising, start = c(1991,1), frequency = 1)
ols_model1<-lm(formula=sales_ts~ad_ts)
summary(ols_model1)


#      Create a lag of the variable 'advertising'. Now, run the OLS 
#      of sales versus lag(advertising). Paste the result again. 
#      Also write what is the difference between the two. Which is better according to you?
df_lag<-data.frame(cbind(ad_ts,lag(ad_ts,-1)))
df_lag1<-df_lag[1:nrow(df_lag)-1,]
df_lag_final<-data.frame(sales_ts,df_lag1)
names(df_lag_final)<-c('sales_ts','ad_ts','ad_lag')
ols_model2<-lm(formula=df_lag_final$sales_ts~df_lag_final$ad_lag)
summary(ols_model2)

# Model 1  : adj rsq : 0.7851 
# Model 2  : adj rsq : 0.4051 
# model 1 better in terms of adj r sq.
# model 1 : f stat : 70.41
# Model 2: f stat : 13.26
# model 1 better in terms of f stats

### ALTERNATE ANSWER FOR  Q11
sales<-c(100,102,104,99,106,100,109,118,114,113,115,112,109,115,117,119,122,123,122,121)
advertising<-c(20,19,20,18,21,19,21,24,22,22,22,21,21,21,21,23,23,23,22,23)

sales=ts(sales,start=1991,freq=1)
advertising=ts(advertising,start=1991,freq=1)
advertising_1 <- lag(advertising)

plot(advertising,sales)


par(mfrow=c(3,1),mar=c(2,2,1,1))
plot(sales)
plot(advertising)
plot(lag(advertising))

m1<- lm(sales~advertising)
m2<- lm(sales[2:20]~advertising_1[2:20])

summary(m1)
summary(m2)

plot(m1)
plot(m2)

## R-squared for the second model is better than the first model, 
# it make sense in terms of advertisement affecting sales with a lag but I believe if we create a stock variable
# using both current and lag advertisement that model will give even better result



# Q12.  Use the datasets 'master_part1.csv' and 'master_part2.csv' for this question
#      Get the structure of both the data set and summary 
#      using summary and describe functions                           (4 marks)
df1<-data.frame(read.csv("C:\\Shilpa\\Training\\R\\Final Exam\\master_part1.csv"))
df2<-data.frame(read.csv("C:\\Shilpa\\Training\\R\\Final Exam\\master_part2.csv"))
str(df1)
str(df2)
summary(df1)
summary(df2)
install.packages("Hmisc")
library(Hmisc)
describe(df1)
describe(df2)



# Q13. Join the data frames to create 'modelling_raw' data frame.
#      Do an left outer join with part 1 as the left table
#      'Subscriber' id will be the join variable (use SQL) 
#    you have to convert one of the subscriber id to match it with the format in the other file 
#    Also explain how you have decided which join (inner-outer) is appropriate (6 marks)
install.packages("sqldf")
library(sqldf)
modelling_raw<-sqldf("select * from df1 as a inner join df2 as b on a.subscriber=b.subscriber")


# Q14. Repeat creation of the 'modelling_raw' data frame.
#      Use the merge data command - join identified in the above question should be leveraged (2 marks)
modelling_raw<-merge(master_part1, master_part2, by="subscriber")


# Q15. Get the mean, median, standard dev, min, max, etc of the 
#     numeric columns 'income' 'age' 'credit_score' 
#     Use any form of apply (except vapply) for the same                 (4 marks)

model_mean<-lapply(X=modelling_raw,FUN=function(x){ifelse(is.numeric(x),mean(x,na.rm=TRUE),NA)})
model_median<-lapply(X=modelling_raw,FUN=function(x){ifelse(is.numeric(x),median(x,na.rm=TRUE),NA)})
model_sd<-lapply(X=modelling_raw,FUN=function(x){ifelse(is.numeric(x),sd(x,na.rm=TRUE),NA)})
model_min<-lapply(X=modelling_raw,FUN=function(x){ifelse(is.numeric(x),min(x,na.RM=TRUE),NA)})
model_max<-lapply(X=modelling_raw,FUN=function(x){ifelse(is.numeric(x),max(x,na.rm=TRUE),NA)})



# Q16. Repeat above question using vapply                                  (4 marks)
simple_summary<-function(x){
  a<-c(mean(x,na.rm=T),sd(x,na.rm=T),median(x,na.rm=T),min(x,na.rm=T),max(x,na.rm=T))
  return(a)  
}
numeric_vars <- sapply(X=modelling_raw,FUN=function(x){ifelse(is.numeric(x),TRUE,FALSE)})
vapply(modelling_raw[,numeric_vars],simple_summary,c("Mean"=0,"Sd" =0,"Median "=0,"Min" =0,"Max"=0))



# Q17. Get the summary stats (mean,sd,min,max, etc) by education level, area type, etc
#      Use tapply to do the same
#                                                                       (4 marks)

mod_mean<-numeric(0)
mod_sd<-numeric(0)
mod_median<-numeric(0)
mod_min<-numeric(0)
mod_max<-numeric(0)

for(i in 1:ncol(modelling_raw)){
  if(is.numeric(modelling_raw[,i])){
    
    mod_mean<- rbind(mod_mean,(tapply( modelling_raw[,i],modelling_raw$education,FUN=mean,na.rm=TRUE)))
    mod_sd<- rbind(mod_sd,(tapply( modelling_raw[,i],modelling_raw$education,FUN=sd,na.rm=TRUE)))
    mod_median<- rbind(mod_median,(tapply( modelling_raw[,i],modelling_raw$education,FUN=median,na.rm=TRUE)))
    mod_min<- rbind(mod_min,(tapply( modelling_raw[,i],modelling_raw$education,FUN=min,na.rm=TRUE)))
    mod_max<- rbind(mod_max,(tapply( modelling_raw[,i],modelling_raw$education,FUN=max,na.rm=TRUE)))
  } 
}

rownames(mod_mean)<-names(modelling_raw[numeric_vars])
rownames(mod_sd)<-names(modelling_raw[numeric_vars])
rownames(mod_median)<-names(modelling_raw[numeric_vars])
rownames(mod_min)<-names(modelling_raw[numeric_vars])
rownames(mod_max)<-names(modelling_raw[numeric_vars])

# by area
mod_mean2<-numeric(0)
mod_sd2<-numeric(0)
mod_median2<-numeric(0)
mod_min2<-numeric(0)
mod_max2<-numeric(0)

for(i in 1:ncol(modelling_raw)){
  if(is.numeric(modelling_raw[,i])){
    
    mod_mean2<- rbind(mod_mean2,(tapply( modelling_raw[,i],modelling_raw$area,FUN=mean,na.rm=TRUE)))
    mod_sd2<- rbind(mod_sd2,(tapply( modelling_raw[,i],modelling_raw$area,FUN=sd,na.rm=TRUE)))
    mod_median2<- rbind(mod_median2,(tapply( modelling_raw[,i],modelling_raw$area,FUN=median,na.rm=TRUE)))
    mod_min2<- rbind(mod_min2,(tapply( modelling_raw[,i],modelling_raw$area,FUN=min,na.rm=TRUE)))
    mod_max2<- rbind(mod_max2,(tapply( modelling_raw[,i],modelling_raw$area,FUN=max,na.rm=TRUE)))
  } 
}

rownames(mod_mean2)<-names(modelling_raw[numeric_vars])
rownames(mod_sd2)<-names(modelling_raw[numeric_vars])
rownames(mod_median2)<-names(modelling_raw[numeric_vars])
rownames(mod_min2)<-names(modelling_raw[numeric_vars])
rownames(mod_max2)<-names(modelling_raw[numeric_vars])




# Q18. Use regular expression pattern matching to drop columns
#      Drop all the columns which have 'simpe_id' in the column name            (2 marks)
leng<-ncol(modelling_raw)
i<-1
x<-modelling_raw
drop<-data.frame(0)
while(i<=leng)
{
  if(grepl("simple_id+",colnames(modelling_raw[i]) )){drop=cbind(drop,x[which(colnames(x)==colnames(modelling_raw[i]))])} 
  i<-i+1
}
modelling_drop<-setdiff(modelling_raw,drop[2:4])




# Q19. Do an exploratory data analysis on the modelling_raw
#    Use pairs, plots, barplot, boxplot, histograms etc.
#      Make it colorful                                                        (10 marks)

levels(modelling_raw$education)
colors<-character(nrow(modelling_raw))
colors[]<-"black"

colors[ modelling_raw$education=="Diploma"]<-"deeppink3"
colors[ modelling_raw$education=="Doctorate"]<-"green"
colors[ modelling_raw$education=="Grad"]<-"red"
colors[ modelling_raw$education=="Metric"]<-"blue"
colors[ modelling_raw$education=="PostGrad"]<-"yellow"
pairs(modelling_raw[,c(2,3,9)],pch=19,col=colors)


#pairs colored wrt corelation
install.packages("gclus")
library(gclus)

mydata <- modelling_raw[c(2, 3)]
mydata.corr <- abs(cor(mydata))
mycolors <- dmat.color(mydata.corr)
myorder<- order.single(mydata.corr)

cpairs(mydata,
       myorder,
       panel.colors=mycolors,
       gap=.5,
       main="Variables Ordered and Colored by Correlation"
)

#histogram 
hist(modelling_raw$credit_score,col="red",breaks=15, xlab="Credit score")

#histogram with rug
hist(modelling_raw$income,col="yellow",breaks=10, xlab="Income")
rug(jitter(modelling_raw$income))
lines(density(modelling_raw$income), col="blue", lwd=2)

#pie chart
tab_edu<-table(modelling_raw$education)
tab_area<-table(modelling_raw$area)
lbls1 <- paste(names(tab_edu), "\n", tab_edu, sep="")
pie(tab_edu,labels=lbls1)

#3d pie chart
install.packages("plotrix")
library(plotrix)
pct <- round(tab_area/sum(tab_area)*100)
lbls2 <- paste(names(tab_area), "\n", pct,"%", sep="")
pie3D(tab_area,explode=.2,labels=lbls2)

#barplot
barplot(tab_edu)

#horizontal bar plot
barplot(tab_area,horiz=TRUE,xlab="Frequency",ylab="Area")

#stacked bar plot

barplot(mod_mean,
        xlab="Education", ylab="Frequency",
        col=c("red", "yellow","green","blue","pink"),
        legend=rownames(mod_mean))

barplot(modelling_raw$income)

#scatter plot
plot(modelling_raw$income)

# density plot
plot(density(modelling_raw$income))

#dotted line with points plot
plot(modelling_raw$income,modelling_raw$credit_score,type="b",pch=17,lty=2,lwd=2,cex=1.5,col="red"
     ,main="CreditScore V/s Income", xlab="Income", ylab="Credit Score")
#shapes plot
with(modelling_raw, plot(income, credit_score, col=education, pch=as.numeric(education)))



#boxplot
boxplot(income~education, data=modelling_raw,col="red")
boxplot(income~area, data=modelling_raw, col="yellow")



# Q20. Impute the missing values in your 'modelling_raw' data
#      For the age variable and the credit_score variable
#      Use lapply function or use normal codes as per your convenience
#      Store the output in a separate data frame called 'modelling_input'
#                                                                             
###    Run a logistic regression model on the modelling_input
#      to predict the dependent variable - 'bought'

### NOTE : This is an open ended question and you'll be awarded more marks for the
##   rigor you show in building and refining the model. 
##   Rigor in terms of model refinement - Lorenz curve, Concordance, decile tables,
##   and also in the selection of variables
### outline
## data-preparation (12 =4*1+2*4)
# 1. Missing value treatment (4)
# 2. Correlation analysis (2)
# 3. Outlier treatment (2)
# 4. Creating dummies (2)
# 5. Creating bins (2)
## Modeling and result presentation (8)
# 1. Summary Stats
# 2. KPI's that you've looked at while deciding the model e.g. concordance stats, gini, ks, pesudo R-square
# 3. Graphical representation of result e.g. 
# 3.1. Lorentz curve (auc)
# 3.2. Effects etc.
# 4. Decile table

#### assigned marking is just for outline , 
##  if you put lot of efforts doing one analysis that help you decide other steps
## or that makes some of the steps redundant 
## or without doing all the steps you can coherently produce the result
#  in a logical flow you will be awarded full marks

#first we are doing data preparation 
#missing value 
mv<-numeric(0)
for(i in 1:ncol(modelling_raw)){
  mv<-  cbind(mv,sum(is.na(modelling_raw[i])))
}
mv
#there are 4 missing values in credit_score
#listing rows which has missing value
modelling_raw[!complete.cases(modelling_raw),]
#missing value treatment using mean substitution
modelling_input<-modelling_raw
mean_cs<-mean(modelling_input$credit_score,na.rm=T)
for( i in 1:nrow(modelling_input))
{
  if(is.na(modelling_input$credit_score[i]))
  {
    
    modelling_input$credit_score[i]<-mean_cs
  }
}

# finding correlation
corr_vars<-names(modelling_input[numeric_vars])[-1]
# remove variable bought from correlation variables
correlations<-cor(modelling_input[,corr_vars],method='spearman')
#income and credit score has very high correlation

#outlier treatment
boxplot(modelling_input[numeric_vars])
# from boxplot we see that there is outlier in income variable
#lets verify by scatter plot income
plot(modelling_input$income)
#yes it has outliers
modelling_raw$income

# we will cap outlier to p25 and p75

remove_outliers <- function(x, na.rm = TRUE, ...) {
  qnt <- quantile(x, probs=c(.25, .75), na.rm = na.rm, ...)
  H <- 1.5 * IQR(x, na.rm = na.rm)
  y <- x
  y[x < (qnt[1] - H)] <- qnt[1]
  y[x > (qnt[2] + H)] <- qnt[2]
  y
}

modelling_input$income<-remove_outliers(modelling_input$income)

# bins
# creating bins for income and credit score
modelling_input$cs_bin<-cut(modelling_input$credit_score, br=c(225,250,275,325), label=c("low","medium","high"))
modelling_input$inc_bin<-cut(modelling_input$income, br=c(1000,5000,10000,18000,25000), label=c("very low","low","medium","high"))

# dummy variable
str(modelling_input)

# education , area and bins created are categorical varaibles , but thy are already in factor form
## no need for dummy 

# data preparation is done , now we move towards model building.

#model building
#for the first iteration we have taken all the variables
fit<-glm(bought~ income + area +education+ credit_score+cs_bin+
           inc_bin+simple_id3, data=modelling_input)

summary(fit)

#As the p-values of the education,credit_score, cs_bin, simple_id3 variables are more than .05 
##so  insignificant in the logistic regression model.
## we will build model by reducing variable one by one, 
##so by one by one  reduction , we got model with p values less than .05 in following model.

fit_red1<-glm(bought~ income + area +inc_bin+credit_score, data=modelling_input)
summary(fit_red1)
residuals(fit_red1) # gives residuals
coef(fit_red1) # gives coefficients for all variables
fit_red1$call  # this gives the equation of logistic regression 
par(mfrow=c(2,2))
plot(fit_red1)
# this gives 4 graphs 
# points on normal q-q curve flason 45 degree line , so normality condition is there.
# residual v/s fitted is almost linear, so lineraity is there.
#constant variance - Homoscedasticity is there.
crPlots(fit_red1)
# linera realtionship can be seen in graph


#lets check which model should we go ahead with 
#comapre 2 models
anova(fit, fit_red1, test="Chisq")

#The nonsignificant chi-square value (p=1.7829) suggests that the reduced model fits as well as 
##the full model , reinforcing belief that extra variables don't add significantly to the
##prediction above and beyond the other variables in the equation. 
##Therefore, we base interpretations on the simpler model.


#basic KPI to be tested
#VIF : first test is to check multicollineraity
library(car)
sqrt(vif(fit_red1))
#sqrt vif is less than 2 for all the variables , so there is no multicollinearity.
#due to lack of multicollineraty model is fine.

#Concordance: to check model fitness lets perfomr concordance test
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

fastConc(fit_red1)
# 91% concordance which is very high which mean model is excellent.


# Chi sq :goodness of fit test
sum(residuals(fit_red1, type = "pearson")^2)
deviance(fit_red1)
1 - pchisq(deviance(fit_red1), df.residual(fit_red1))
# value of .99999 is very large indicating no evidence of lack of fit.

#DW: for autocorrelation
durbinWatsonTest(fit_red1)
#The nonsignificant p-value (p=0.312) suggests a lack of autocorrelation, 
##and conversely an independence of errors.

#Outlier test 
outlierTest(fit_red1)
#No Studentized residuals with Bonferonni p < 0.05

#pseudo r square 
pseudorsq = 1-fit_red1$deviance/fit_red1$null.deviance
#pseudo r square is coming out to be .457 , though it is less but for other combination it is coming even lesser
## so if we comapre pseudo r sq of other models , it is highest.


# ks statistics 
install.packages("ROCR")
library(ROCR)
fitpreds = predict(fit_red1,newdata=modelling_input,type="response")
fitpred = prediction(fitpreds,modelling_input$bought)
fitperf = performance(fitpred,"tpr","fpr")
max(attr(fitperf,'y.values')[[1]]-attr(fitperf,'x.values')[[1]])
# it is .7272 which is very high

# graphs 
#roc curve or auc
#method 1 by using ROCR package
plot(fitperf,col="green",lwd=2,main="ROC Curve for Logistic")
abline(a=0,b=1,lwd=2,lty=2,col="gray")
# We can see that the performance of the model rises well above the diagonal line, indicating we are doing much better than random guesse

#method 2 by using pROC package
install.packages("pROC")
library(pROC)
fitpreds = predict(fit_red1,newdata=modelling_input,type="response")
roc(modelling_input$bought, fitpreds, plot=TRUE)
#Area under the curve: 0.9167 whhich is very high 


#effects graphs
install.packages("effects")
library(effects)
plot(effect("income", fit_red1,
            list(wt=c(2.2,3.2,4.2))),
     multiline=TRUE)
plot(effect("credit_score", fit_red1,
            list(wt=c(2.2,3.2,4.2))),
     multiline=TRUE)
plot(effect(c("income","inc_bin"), fit_red1,
            list(wt=c(2.2,3.2,4.2))),
     multiline=TRUE)

#lorenz curve
install.packages("ineq")
library(ineq)
ineq(fit_red1,type="Gini")
plot(Lc(modelling_input$bought),col="darkred",lwd=2)

#clasification table
Yhat<- fitted(fit_red1)
thresh  <- 0.5
YhatFac <- cut(Yhat, breaks=c(-Inf, thresh, Inf))
YhatFac <- levels(modelling_input$bought)[max.col(Yhat)]
cTab <- table(factors(modelling_input$bought), YhatFac)
addmargins(cTab)

sum(diag(cTab)) / sum(cTab) 
#77.5%




rm(list=ls())
#### WISH YOU ALL THE BEST ###########
