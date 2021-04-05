
# Chapter 4.2

# Medicorp example

# The following code shows how to plot a simple linear regression line
library(readxl)

# Import data from an Excel workbook
MEDDICORP <- read_excel("C:\\Users\\Zack\\Documents\\Spring 2021\\MATH 212\\Data Sets\\MEDDICORP4.xlsx", sheet=1)

# View Data
head(MEDDICORP)

# Create a variable called SALES
SALES <- MEDDICORP$SALES 

# Create a variable called ADV
ADV <- MEDDICORP$ADV

# Create a variable called BONUS
BONUS <- MEDDICORP$BONUS

# Building a regression line

Model <- lm(SALES ~ ADV + BONUS)

summary(Model)

# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
#(Intercept) -516.4443   189.8757  -2.720   0.0125 *  
# ADV            2.4732     0.2753   8.983 8.18e-09 ***
# BONUS          1.8562     0.7157   2.593   0.0166 *  

#################################################################
# Example 4.2 Meddicorp
# Question1 
# Testing for advertising coeffcinets
# calculating pvalues

2*(1-pt(8.98,22))
############
# Question 2 
# Testing for advertising coeffcinets
# calculating pvalues

2*(1-pt(2.59,22))
############
# Question 3 
# Testing for advertising coeffcinets
# calculating pvalues

(1-pt(2.59,22))
############
# Question 4 
# Testing for advertising coeffcinets
# calculating pvalues
 qt(0.975,22)

# finding 95% confidence intervals for coefficients
confint(Model, level =0.95)
############
# Question 5 
# Testing for advertising coeffcinets
# calculating pvalues
 qt(0.975,22)

# finding 95% confidence intervals for coefficients
confint(Model, level =0.95)
##########################################################################
# Question 4 Admission rate
# Question 14 Graduation Rate

library(readxl)

# Import data from an Excel workbook
COLLEGE <- read_excel("C:\\Users\\dassanayakes\\Desktop\\Toshiba\\Rhodes MATH 212\\COLLEGE4.xlsx", sheet=1)

# View Data
head(COLLEGE)

# Create a variable called EPS
GRADRATE <- COLLEGE$GRADRATE4 

# Create a variable called BONUS
ADMISRATE <- COLLEGE$ADMISRATE

# Create a variable called BONUS
SFACRATIO <- COLLEGE$SFACRATIO

# Create a variable called BONUS
AVGDEBT <- COLLEGE$AVGDEBT

# Building a regression line

Model <- lm(GRADRATE ~ ADMISRATE + SFACRATIO + AVGDEBT)

summary(Model)

#                Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  1.110e+00  5.141e-02  21.580  < 2e-16 ***
# ADMISRATE   -3.798e-01  6.898e-02  -5.505 1.18e-07 ***
#SFACRATIO   -2.789e-02  3.404e-03  -8.194 3.57e-14 ***
# AVGDEBT      5.169e-07  2.399e-06   0.215     0.83 
######
#Question 1

2*(1-pt(5.51,191))
######
#Question 2

2*(pt(-8.176,191))
######
#Question 3

qt(0.975, 191)

# finding 95% confidence intervals for coefficients
confint(Model, level =0.95)
#########################



