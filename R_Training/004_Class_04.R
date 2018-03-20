## This code was created by Shashidhar for the purpose of training 'R enthusiasts'
## You can contact the developer at : shashidhar26@gmail.com

# Today's session is about visualisations in R
# We will continue our work on data frames and see what all visualisations 
# possible in R
# We will also see how to do EDA in R using rank, percentiles, cut, etc


# Following are the key topics which we will cover in this session
# 1. Exploratory data analysis in R
# 2. Scatter plots, histograms, box plots
# 3. Binning, quantiles, rank, etc
# 4. Maps
rm(list=ls())

getwd()
setwd('C:\\Drives\\_G\\Learning\\R_code\\LearnR')

# Quickly get some data into a dataframe
us_geo<-as.data.frame(state.x77[,1:5])
us_geo$Name<-row.names(us_geo)
# cbind it with one more dataset to get the region names
us_geo<-cbind(us_geo,state.region)
str(us_geo)

# Now, we know that there the 'North Central' region in USA is called 'Midwest'
# Let us rename it - Renaming a factor in R 
levels(us_geo$state.region)[levels(us_geo$state.region)=="North Central"]<-"Midwest"

# Can also do it efficiently using package plyr - check how
# http://www.cookbook-r.com/Manipulating_data/Renaming_levels_of_a_factor/

# asked by Deepak:
# doing it using ifelse
us_geo$state.region<-ifelse(us_geo$state.region=="North Central",
                            "Midwest",
                            as.character(us_geo$state.region))

# Now, let us check pairs for Population, Income, Illiteracy and Life Expectancy
pairs(us_geo[,1:5])
plot(us_geo$Population,us_geo$Income)

# Correlations check
correlations<-cor(us_geo[,1:5],method='spearman')
# Keep only the lower diagonal elements
correlations[upper.tri(x=correlations,diag=T)]<-0


# Now let us do the pairing by regions
# Initialise to black
colors<-character(nrow(us_geo))
colors[]<-"black"

# Play with a variety of colors in R
# http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

colors[ us_geo$state.region=="Midwest"]<-"deeppink3"
colors[ us_geo$state.region=="Northeast"]<-"green"
colors[ us_geo$state.region=="West"]<-"yellow"
colors[ us_geo$state.region=="South"]<-"blue"
# Do the pairing again, now in color (true color!)
# pch will give different dot-types
# https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/points.html
pairs(us_geo[,1:4],pch=22,bg=colors,cex=1.5)
# this kind of coloring comes in handy if we are doing cluster/segmentation
iris

# Further analysis on moviezz! 
setwd("C:/Drives/_G/Learning/R_code/LearnR/Day 4 Material")
movies_data <- read.table("004_movies.tab", sep="\t", header=TRUE, quote="", comment="")

set.seed(2609)
movies_data_1 <- movies_data[sample(nrow(movies_data),5000),]
write.table(movies_data_1,'movies.tab',sep = "\t",row.names = F)
library(Hmisc)

# To output to a file nicely we can use describeBy
# http://stackoverflow.com/questions/16279668/export-describe-by-package-psych-as-csv-file-in-r
a<-describe(movies_data)
describe
class(a)
a$budget

str(sink)
sink('output.txt')
sink(NULL)
names(movies_data)

# Get number of animation movies by year
# How? 
# Think for a moment

# Can we do histogram?
hist(movies_data$year)
# No, that would give all genres

# Can we do table?
x<-table(movies_data$Animation,movies_data$year)
str(x)
plot(x)
# It might give the result, but not exactly

# What else, are you thinking SQL?
library(sqldf)
yearwise_anime<-sqldf("select year, count(*) as Num_movies 
                      from movies_data where Animation=1
                      group by year")
sum(movies_data$Animation)
sum(yearwise_anime$Num_movies)
barplot(height=yearwise_anime$Num_movies,col='deeppink4',
        names.arg=yearwise_anime$year)
# It works!
# But why dint they make animated movies in 1970's? Any hypothesis ?


# Is there a faster way to do this? Let us see if there is!
a<-table(movies_data$year[ movies_data$Animation==1])
barplot(a)
# Perfect!


names(movies_data)
# Do high budget movies get high rating?
plot(movies_data$budget,movies_data$rating, col='blue')
# No idea

# Are long movies boring?
plot(movies_data$length,movies_data$rating,col='red')
movies_data[movies_data$title=="The Lion King",]

# Searching if a particular movie is there or not in my data base
sqldf("select * from movies_data 
      where title like ('%Kaho Naa..%')")

# Other nice EDA methods can be found here:
# http://wiener.math.csi.cuny.edu/Statistics/R/simpleR/stat009.html
install.packages("UsingR")
library(UsingR)
data(ewr)
names(ewr)
ewr.numerics<-ewr[,3:10]
boxplot(ewr.numerics,col='green',main="Taxiing times for major Airlines - Newark")

## Box plot by factor
boxplot(ewr.numerics[,3]~ as.factor(ewr$inorout))

library(plyr)
# Arrange by year
# So that we can have bins by percentile
movies_data<-arrange(df=movies_data, (movies_data$year))

movies_data$bins<-cut(movies_data$year,labels = 1:10,
                      breaks=quantile(movies_data$year,probs=seq(0,1,by=0.1)),
                      include.lowest=T)

barplot(table(movies_data$bins))

# Now arrange by rating


movies_data<-arrange(df=movies_data, (movies_data$rating))
# Lets see the distribution by rating first
hist(movies_data$rating)
# We expected that dint we? Most movies are average 
quantile(x=movies_data$rating,probs=c(0,0.01,0.1,seq(0.2,0.8,0.1),0.85,0.9,0.95,0.99,0.995,0.999))

movies_data$rating_bins<-cut(movies_data$rating
                      breaks=quantile(movies_data$rating,probs=seq(0,1,by=0.1)),
                      include.lowest=T)
# Equal distribtion results. however, the width of the ratings is more in the extreme buckets

# If we want only five buckets
movies_data$rating_bins<-cut(movies_data$rating,breaks=c(0,2,4,6,8,10),
                             labels=c("<2","2-4","4-6","6-8","8-10"),include.lowest=T)

table(movies_data$rating_bins)
barplot(table(movies_data$rating_bins))
# Can come up with nice insights by doing this


# Maps 
library(ggmap)
library(mapproj)
map<-get_map(location='Bangalore',zoom=15,maptype='roadmap')
ggmap(map)

# Plot a point on the map - 
# Where do Chris Gayle's power hits land when he hits those massive sixes?
# Get the latitude and longitude of that place!
ggmap(map) + geom_point(aes(x=77.599427,y=12.978496,col='red',size=5))
                        
# x and y could be vectors as well


# If we want to plot the statewise info from the earlier example - USA
map(database="state",)

state_df<-map_data(map="state")
library(Hmisc)
# This code is 'under test' for now!
# state_df$region<-capitalize(state_df$region)
# state_df<-merge(x=state_df,y=us_geo,by.x="region",by.y="Name")
# hist(us_geo$Population)
# quantile(us_geo$Population,probs=c(0,0.2,0.4,0.6,0.8,1))
# state_df$bins<-cut(state_df$Population,breaks=c(365,857,2283,3691,5515,22000),
#                    labels=c("red","maroon","yellow","green","darkgreen"),
#                    include.lowest=T)
# table(state_df$bins)

names(state_df)
map(database="state",fill=T,col=colors)
a<-map(database="state",namesonly=T)


?map
# Main question in stack overflow:
# http://stackoverflow.com/questions/7747991/geographical-heat-map-in-r
# http://blog.revolutionanalytics.com/2009/11/choropleth-challenge-result.html
# http://blog.revolutionanalytics.com/2009/10/geographic-maps-in-r.html

