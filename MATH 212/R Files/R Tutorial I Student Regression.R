
# R Tutorial I
##################################################################################
# Import data from statistical packages

# Install the package
install.packages("carData")

# Load the package into R
library(carData)

# Access the Salaries data set in carData package
data(Salaries, package="carData")

# Salaries is the name of the data set

#################################################################################
# Importing data from an excel spread sheet

#The readxl package can import data from Excel workbooks. Both xls and xlsx formats are supported.

install.packages("readxl")
library(readxl)

# If you are using a data from the text book, make sure to save it as a "xlsx" file before reading it using R
# Import data from an Excel workbook
Salaries <- read_excel("C:\\Users\\Zack\\Documents\\Spring 2021\\MATH 212\\Data Sets\\Salaries.xlsx", sheet=1)
#################################################################################
# Exercise: The CPS85 dataset from the mosaicData package, 
# contains 1985 data on wages and other characteristics of workers.  Write code to 
# access this data set.
install.packages("mosaicData")
library(mosaicData)
data(CPS85, package="mosaicData")

###########################Answer################################################
#################################################################################
# Exercise: Write a code to access the COMNODE3 data set (on Canvas)
library(readxl)
read_excel("C:\\Users\\Zack\\Documents\\Spring 2021\\MATH 212\\Data Sets\\COMNODE3.xlsx", sheet=1)
#####################Answer############################################################
##############################################################################
# Exercise: Write a code to access the COLLEGE4 data set (on Canvas)
read_excel("C:\\Users\\Zack\\Documents\\Spring 2021\\MATH 212\\Data Sets\\COLLEGE4.xlsx", sheet=1)

#################Answer################################################################
#################################################################################
# Working with data frames

# To view the names of the variables 
names(Salaries)

# Rename all columns
names(Salaries) <- c("RANK", "DESCIPLINE", "YRS.SINCE.PHD", "YRS.SERVICE", "SEX", "SALARY")

# To view the names of the new variables 
names(Salaries)

# Rename a single column
names(Salaries)[4] <- "Years.Service"

# To view the names of the new variables 
names(Salaries)

# To view the first part of the data, use the head command
head(Salaries)

# To check the size (dimension) of the data frame
dim(Salaries)

# Select a single variable
Salaries$RANK

# Save the RANK variable in Salaries data set as MYRANK
MYRANK <- Salaries$RANK

# View the data in the new variable MYRANK
MYRANK

# Learn about the abstract type
class(Salaries)


###########################Question###############################################################
# Exercise
# Use CPS85 Data set to do the following:
data(CPS85, package="mosaicData")

# To view the names of the variables 
names(CPS85)
# Rename all columns with the following variable names
# WAGE, EDUC, RACE, SEX, HISPANIC, SOUTH,  MARRIED, EXPERIENCE, UNION, AGE, SECTOR
names(CPS85)<-c("WAGE", "EDUC", "RACE", "SEX", "HISPANIC"
                , "SOUTH",  "MARRIED", "EXPERIENCE", "UNION", "AGE", "SECTOR")
# To view the names of the new variables 
names(CPS85)
# Rename the column EDUC to EDUCATION
names(CPS85)[2] <- "EDUCATION"
# To view the names of the new variables 
names(CPS85)
# To view the ?rst part of the data, use the head command
head(CPS85)
# To check the size (dimension) of the data frame
dim(CPS85)
# How many rows?
# How many columns?


# Select the variable RACE
CPS85$RACE

# Save the RACE variable in data set as MYRACE
MYRACE <- CPS85$RACE
# Learn about the abstract type
class(CPS85)

############################################Answers########################################
###########################################################################################
# Data Structures
# 1. Vectors 2. Matrices 3. Scalars  4. Data Frames

# Vectors in R

#Creating sequences in R
1:10 

5:-3

#The seq() function creates sequences also.
seq(0, 3, by = .2) 

seq(0, 3, length = 15) 

# Creating a vector in R
X <- c(1, 4, 8, 2, 9) 

class(X)

# Creating a vector of strings
Y <- c("Moe", "Larry", "Curley")
class(Y)


# Creating a vector of logical values
Z <- c(T, T, F, T, F)
class(Z)

# Misc. commands on vectors
length(X) 		# number of elements in X
sum(X) 		# add elements in X
sort(X) 		# sort in increasing order X

################################Question#####################
# Exercise vectors

#Creating sequences in R from 11 to 25
11:25

# Use the seq() function creates sequence from 11 to 25 with increments of 2
seq(11, 25, by=2)
# Creating a vector in R with elements 10, 9, 7, 6, 3 and call it Y
Y <- c(10, 9, 7, 6, 3)
# Find the length of Y
length(Y)
# What is teh sum of the elemnts of Y
sum(Y)
# Place the elemts of Y in ascending order
sort(Y)
# What data type is Y?
class(Y)
# Creating a vector of teh following strings: Lines, Circles, Elipses, Parabolas and call it Z
Z <- c("Lines", "Circles", "Ellipses", "Parabolas")
# What data type is Y?
class(Y)
# Create a vector of logical values Fales, Fales, True, Fales and call it W
W <- c(F, F, T, F)
################################Answer#######################
#############################################################
# Creating a scaler in R
a <- 3.456
a

###############################################