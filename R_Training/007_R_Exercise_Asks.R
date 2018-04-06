# Along with this file, are 2 csv files df1.csv and df2.csv which would be used for the assignment.
# 
# 1. Import df1.csv into a dataframe df1
# 2. Conduct all the EDA steps that were demonstrated in session 2 including summary statistics. You will find that there are a few missing values in some rows. To handle them use the na.rm option.
# 3. You would find that the column "Class" is a character vector. Change its type to factor. Also change the variable type of "ID" column from numeric to character.
# 4. Create a derived variable "adj_ht" which is equal to [square of Height] if Height > 75; else is equal to [square root of the Height]
# 5. Change the column name from "Height" to "Length".
# 6. Import the file df2.csv into a dataframe df2.
# 7. Using ID as the key, we can join the 2 dataframes. One way to do an inner join is using the sqldf package as : 
# 	sqldf("select * from df1 inner join df2 on df1.ID = df2.ID")
# 	Try to do other kinds of joins on the 2 dataframes. Also try to achieve the same using the merge() function.
# 8. Lastly export the merged dataframes to a file "merged_df.csv"



# Iris is a very popular dataset
# Load that dataset in R - use the '?' or '??' to find out where it is



## Once done try to summarise the data here: (use summary, str, etc)
## Get the mean, standard deviation, median, minimum and maximum values of all the columns first - 
# use a for loop and tapply


## Get the mean, standard deviation, median, minimum and maximum values of all the columns first - 
# write a function and one more form of apply called 'vapply'- try this!


## Use correct form of apply to get correlations between the 'sepal.length' and other 3 numerics


## There is an error when we pass output of lapply to sapply
# There is an error when we pass output of lapply to subscript operator [] as well
# So, be careful when you use lapply and the output format it returns

## Now use a while loop to iteratively eliminate the values where correlations 
# are less than 0.4 


# Now achieve the same result without a 'while' loop - can try booleans, which, etc

## Get the pairs to see what columns are correlated



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
}


# Use the data from this link:
# http://www.ats.ucla.edu/stat/data/binary.csv
# and pass the data frame to your function above, passing rank as the categorical predictor


# Load the library (car) into R
# Check out the prestige data set

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
# Explore substr, regex, grep,etc for string manipulation
