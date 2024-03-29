
# Chapter 4.4
# Comparing two regression models
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


# Create a variable called MKTSHR
MKTSHR <- MEDDICORP$MKTSHR

# Create a variable called COMPET
COMPET <- MEDDICORP$COMPET


# Building the full model

Full_Model <- lm(SALES ~ ADV + BONUS + MKTSHR + COMPET)

summary(Full_Model)

# Building the reduced model

Reduced_Model <- lm(SALES ~ ADV + BONUS)

summary(Reduced_Model)

# The partial F-test
anova(Reduced_Model, Full_Model)

##########################################

#cost4 data

COST4 <- read_excel("C:\\Users\\Zack\\Documents\\Spring 2021\\MATH 212\\Data Sets\\COST4.xlsx", sheet=1)
Full_Model <- lm(COST4$COST ~ COST4$PAPER + COST4$MACHINE + COST4$OVERHEAD + COST4$LABOR)
Reduced_Model <- lm(COST4$COST ~ COST4$PAPER + COST4$MACHINE)

summary(Full_Model)
summary(Reduced_Model)

anova(Reduced_Model, Full_Model)


#HARRIS 4
HARRIS4 <- read_excel("C:\\Users\\Zack\\Documents\\Spring 2021\\MATH 212\\Data Sets\\HARRIS4.xlsx", sheet=1)
Full_Model <- lm(HARRIS4$SALARY ~ HARRIS4$EDUC + HARRIS4$EXPER + HARRIS4$TIME)
Reduced_Model <- lm(HARRIS4$SALARY ~ HARRIS4$EDUC)

anova(Reduced_Model, Full_Model)