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
# OR 
# Q1.1 How will you see what is the current working directory in R? (1 marks)
# Q1.2 How will you enlist the files in current directory in R? (1 marks)


# Q2. How will you change the current working directory in R?  Write the command which 
#     changes the current wD to a folder 'R_WD' on the desktop. 
#     You might have to create the folder on your desktop first    (4 marks) 

# OR 

# Q2.1 How will you change the current working directory in R?  Write the command which 
#     changes the current wD to a folder 'R_WD' on the desktop. 
#     You might have to create the folder on your desktop first         (2 marks) 
# Q2.2 How will you make the 'R_WD' as default working directory in R?  (2 marks)
# Q2.3  How will you install a package, install a package 'lubridate' (2) 
# Q 2.4 get help on lubridate package. (1) 


# Q3. Command to clear all items from the workspace                (2 marks)
# OR
# Q3. Write command to
# clear all items from the workspace                (1 marks)
# clear console of R studio                         (1 marks)


# Q4. Command to check the version of R you have on your system 
#     (you need to paste the output of that command in this file)  (2 marks)



# Q5. Nicely print: 1:A, 2:B, ... 26:Z (2 marks)

# Q6. Create a vector 'w' of 10 random numbers using the sample function. 
#      The random numbers should be between 10 to 200 and should be unique. (2 marks)


# Q7. Replace the sixth element of 'w' by 'NA' ( missing value)    (2 marks)


# Q8. Now find the mean, median and standard deviation of the vector 'w' 
#     (use appropriate argument to handle missing)                  (2 marks)



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


# Q11. Load the time series data Nile in R
#      Plot the time series on a graph    
#      also plot a histogram for the data series.
#      Check the autocorrelation plot of the time series using the acf() function.

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


# Q12.  Use the datasets 'master_part1.csv' and 'master_part2.csv' for this question
#      Get the structure of both the data set and summary 
#      using summary and describe functions                           (4 marks)



# Q13. Join the data frames to create 'modelling_raw' data frame.
#      Do an left outer join with part 1 as the left table
#      'Subscriber' id will be the join variable (use SQL) 
#    you have to convert one of the subscriber id to match it with the format in the other file 
#    Also explain how you have decided which join (inner-outer) is appropriate (6 marks)


# Q14. Repeat creation of the 'modelling_raw' data frame.
#      Use the merge data command - join identified in the above question should be leveraged (2 marks)

# Q15. Get the mean, median, standard dev, min, max, etc of the 
#     numeric columns 'income' 'age' 'credit_score' 
#     Use any form of apply (except vapply) for the same                 (4 marks)


# Q16. Repeat above question using vapply                                  (4 marks)


# Q17. Get the summary stats (mean,sd,min,max, etc) by education level, area type, etc
#      Use tapply to do the same
#                                                                       (4 marks)


# Q18. Use regular expression pattern matching to drop columns
#      Drop all the columns which have 'simpe_id' in the column name            (2 marks)

# Q19. Do an exploratory data analysis on the modelling_raw
#    Use pairs, plots, barplot, boxplot, histograms etc.
#      Make it colorful                                                        (10 marks)




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


rm(list=ls())
#### WISH YOU ALL THE BEST ###########
