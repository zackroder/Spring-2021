Chapter 4.5 Predictions

# Meddicorp questions
#1. Find point estimate of the mean sales when ADV=500 and BONUS =250
# Also find  95% prediction interval
#2. Find a 95% confidence intreval for the mean sales when ADV=500 and BONUS =250

#################Answer############################################

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

#1. Find point estimate of the mean sales when ADV=500 and BONUS =250
# Also find  95% prediction interval

NEWDATA = data.frame(ADV = 500, BONUS = 250)

predict(Model, NEWDATA, interval="predict") 

#       fit      lwr      upr
#1 1184.189 988.8392 1379.539


#2. Find a 95% confidence intreval for the mean sales when ADV=500 and BONUS =250

predict(Model, NEWDATA, interval="confidence") 
#       fit      lwr      upr
#1 1184.189 1131.824 1236.554

# Note that the point estimate for both mean sales and predicted sales are the same
# You can get this point estimate by substituting in the given equation

 2.4732*(500) + 1.8562*(250) -516.4443

############################################################

# Question 14 Graduation Rate (COLLEGE4 data set)
#1. Find point estimate of the mean graduation rate when ADMISRATE=0.5, SFACRATIO =12 and AVGDEBT =10,000
#2. Find a 95% confidence intreval for the mean graduation rate when ADMISRATE=0.5, SFACRATIO =12 and AVGDEBT =10,000
#3. Find a 95% prediction intreval for the mean graduation rate when ADMISRATE=0.5, SFACRATIO =12 and AVGDEBT =10,000

COLLEGE4 <- read_excel("C:\\Users\\Zack\\Documents\\Spring 2021\\MATH 212\\Data Sets\\COLLEGE4.xlsx", sheet=1)

GRADRATE <- COLLEGE4$GRADRATE4
ADMISRATE <- COLLEGE4$ADMISRATE
SFACRATIO <- COLLEGE4$SFACRATIO
AVGDEBT <- COLLEGE4$AVGDEBT


Model <- lm(GRADRATE ~ ADMISRATE + SFACRATIO + AVGDEBT)
summary(Model)

NEWDATA <- data.frame(ADMISRATE = 0.5, SFACRATIO = 12, AVGDEBT = 10000)

predict(Model, NEWDATA, interval="predict")
predict(Model, NEWDATA, interval="confidence")
