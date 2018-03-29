
# This session is to demonstrate some extra procedures and getting additional
# help in R
# 1. Var reduction/bin creation using Rpart
# 2. Output format/excel export using R and VBA
# 3. Connecting to various data sources

setwd("C:\\Drives\\_G\\Learning\\R_code\\LearnR")
library(rpart)
library(partykit)
library(Hmisc)
input<-read.csv('rpart.csv',header=T,sep=',',fill=T)
describe(input)
dep<-input$dep
indep<-input$indep
# http://www.statmethods.net/advstats/cart.html
rpart_result<-rpart(formula=dep~indep,method='class',
                    control=rpart.control(minsplit=10,minbucket=10,cp=-1))
plot(as.party(rpart_result))
rpart_result$cptable
optimal_split<-which.min(rpart_result$cptable[,"xerror"])
optimal_cp<-rpart_result$cptable[ optimal_split,"CP"]
rpart_prune<-prune(tree=rpart_result,cp=optimal_cp)
plot(as.party(rpart_prune))

### To create bins, we use the following code
cat_var<-rpart_result$where
rpart_result
bins<-unique(rpart_result$where)

for(i in 1:length(bins)){
  name_of_binned_var<-paste("indep_var","bin",i,sep="_")
  input[name_of_binned_var]<- ifelse(cat_var==bins[i],1,0)
}


## if you want to plot and see the result
input$bin_value<-rpart_result$where
library(sqldf)
temp<-sqldf("
select bin_value,
sum(dep) as deps,
count(*) as Number_of_records
from input
group by bin_value          
             ")
# plot it 
b<-barplot(height=(temp$deps/temp$Number_of_records * 100),
           main='Number of deps by bucket',
           ylab='Pecentage of deps',
           space=2,xlab='R graph',
           col='brown')
axis(1,at=b)

# Interfacing R with Excel VBA:
# http://shashiasrblog.blogspot.in/2013/10/vba-front-end-for-r.html

## Getting help in R

# stack overflow - http://stackoverflow.com/tags/r/info
# r-bloggers - http://www.r-bloggers.com/
# My blog on R too :) - bit.ly/R_blog_Shashi


# ODBC connections using R
install.packages('RODBC')
library(RODBC)
mycon<-odbcConnect(dsn = "",uid = "",pwd = "")
table<-sqlQuery(channel = mycon,query = "select * from my_table")


# POST GRE SQL example
library(RPostgreSQL)
rm(list=ls())
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, "<SERVER_IP>", user="un", pass="pw", dbname="db")



