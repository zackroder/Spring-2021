# Chapter 4.3

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

# Create variable MKTSHR
MKTSHR <- MEDDICORP$MKTSHR

# Building a regression line

Model <- lm(SALES ~ ADV + BONUS)

summary(Model)

anova(Model)

#calculate R^2 and adjusted R^2



#DIV3
DIV3 <- read_excel("C:\\Users\\Zack\\Documents\\Spring 2021\\MATH 212\\Data Sets\\DIV3.xlsx", sheet=1)
head(DIV3)

Model <- lm(DIV3$DIVYIELD ~ DIV3$EPS + DIV3$PRICE)
anova(Model)
summary(Model)

#SSE = 132.532
#SST = 8.345 + 4.332 + 132.532
#n = 42
#K = 2

#R^2_adj = 1 - (132.532 / (42-2-1))/(145.209/(42-1)) 


