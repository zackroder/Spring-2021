
# Chapter 4.1

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

##################################################################
# Creating conditional plots

library(ggplot2)

# install.packages(visreg)
library(visreg)

# conditional plot of sales vs bonus
visreg(Model, "BONUS", gg = TRUE) 

# conditional plot of sales vs advertising
visreg(Model, "ADV", gg = TRUE) 

####################################################################
# Question 17 Major League Baseball
MLB <- read_excel("C:\\Users\\Zack\\Documents\\Spring 2021\\MATH 212\\Data Sets\\MLB4.xlsx", sheet=1)

WINS <- MLB$WINS
HR <- MLB$HR
BA <- MLB$BA
ERA <- MLB$ERA

Model <- lm(WINS ~ HR + BA + ERA)

##################################################################
# Creating conditional plots
par(mfrow=c(1,3))
visreg(Model, "HR", gg=TRUE)
visreg(Model, "BA", gg=TRUE)
visreg(Model, "ERA", gg=TRUE)
####################################################################
# Question 14 Graduation Rate
COLLEGE <- read_excel("C:\\Users\\Zack\\Documents\\Spring 2021\\MATH 212\\Data Sets\\COLLEGE4.xlsx", sheet=1)

GRADRATE <- COLLEGE$GRADRATE4
ADMISRATE <- COLLEGE$ADMISRATE
SFACRATIO <- COLLEGE$SFACRATIO
AVGDEBT <- COLLEGE$AVGDEBT

model <- lm(GRADRATE ~ ADMISRATE + SFACRATIO + AVGDEBT)
##################################################################
# Creating conditional plots
####################################################################

library(ggplot2)
library(visreg)
visreg(model, "ADMISRATE")
visreg(model, "SFACRATIO")
visreg(model, "AVGDEBT")








