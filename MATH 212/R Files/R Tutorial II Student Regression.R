
# Scaler, vectors, and data farmes are importnat for this class - matrices are not.
##############################################################
# Creating a dataframe in R

employee <- c('John Doe','Peter Gynn','Jolie Hope')

salary <- c(21000, 23400, 26800)

startdate <- as.Date(c('2010-11-1','2008-3-25','2007-3-14'))

class(startdate)

employ.data <- data.frame(employee, salary, startdate)

##################Question####################################
# Create the following data frame and Call it MyData
# MyData = | Low  0.42  0.67|
#          | Mid  0.67  1.64|
#          | High 1.64  2.33|

###########################Answer#############################
##############################################################
label <- c("Low", "Mid", "High")
lbound <- c(0.42, 0.67, 1.64)
ubound <- c(0.67, 1.64, 2.33)
(MyData <- data.frame(label,lbound,ubound))
# Basic arithmatic

x <- 1:5 
x - 3 
x*10 
x/10 
x^2 
2^x 
log(x)
w <- 6:10 
w <-  x*w                  

#Logical expressions
x < 3
x == 4

########################################################
# Subsetting

# Subsetting vectors
# Create a vector with the following elements - 10, 9, 7, 6, 3, 2, 6 - and call it Y 
Y <- c(10, 9, 7, 6, 3, 2, 6)
Y

#Extract the third element of Y:
Y[3]

#Extract the second, fourth, and sixth elements,
Y[c(2,4,6)]

#Extract all elements except the second and the fourth:
Y[-c(2,4)]

####################
# Subsetting data frames
employee <- c('John Doe','Peter Gynn','Jolie Hope')

salary <- c(21000, 23400, 26800)

startdate <- as.Date(c('2010-11-1','2008-3-25','2007-3-14'))


#For subsetting a data frame, use the syntax data[row.index, column.index].

employ.data <- data.frame(employee, salary, startdate)

#For instance, row 2, column 1:
 employ.data[2, 1]

#or rows 1 through 2, columns 1 and 3:
 employ.data[1:2, c(1, 3)]

#To extract all rows, but columns 1 and 3
 employ.data[, -c(1, 3)]

#and rows 1:2 and all columns
 employ.data[1:2, ]

#############################Questions###########################
# Subsetting

# Subsetting vectors
# Create a vector with the following elements - 8, 3, 0, 9, 9, 2, 1, 3 - and call it z
z <- c(-8, 3, 0, 9, 9, 2, 1, 3)
#Extract the fourth element of z:
z[4]
#Extract the 1rst, third and fourth element,
z[c(1,3,4)]
#Extract all elements except the 1rst, third and fourth:
z[-c(1, 3, 4)]

###########################
# Subsetting data frames
# Create the following data frame and Call it MyData
# MyData = | Low  0.42  0.67|
#          | Mid  0.67  1.64|
#          | High 1.64  2.33|
label <- c("Low", "Mid", "High")
lbound <- c(0.42, 0.67, 1.64)
ubound <- c(0.67, 1.64, 2.33)
(MyData <- data.frame(label,lbound,ubound))

#Extract the element in row 2, column 3:
 MyData[2,3]

#Exract elements in rows 1 through 3, columns 2 and 3:
 MyData[1:3, c(2,3)]

#Extract all rows, but columns 1 and 2
 MyData[,c(1,2)]

#Extract rows 2:3 and all columns
 MyData[2:3, ]

#############################Answers###########################
##############################################################
# Other useful commands
#ls returns the names of the function's local variables
  ls()

# rm can be used to remove objects
rm(B)
ls()

# Clear workspace - useful for first line of script
rm(list = ls())

#Check and you will not see any remaning varibles
ls()
##############################################################
