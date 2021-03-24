# Section 3.5
# Claculting confidence and prediction intervals when x = 6 for table 3.2 data
# Enter the data on table

x <- c(1, 2, 3, 4, 5, 6)
y <- c(3, 2, 8, 8, 11, 13)


# Develop a regression model
model <- lm(y ~ x)

newdata = data.frame(x=6)

predict(model, newdata, interval="confidence", level = 0.95) 

predict(model, newdata, interval="prediction", level = 0.95) 


####################################################
# Calculating confidence intrevals for communication nodes
# When NUMPORTS is 40

library(readxl)

# Import data from an Excel workbook
COMNODE <- read_excel("C:\\Users\\Zack\\Documents\\Spring 2021\\MATH 212\\Data Sets\\COMNODE3.xlsx", sheet=1)

# Open the book CD file and save as "xlsx" in your folder

# View Data
head(COMNODE)

# Create a variable called PORTS
PORTS <- COMNODE$NUMPORTS

# Create a variable called COST
COST <- COMNODE$COST

# Create ANOVA table
model <- lm(COST~ PORTS)


newdata = data.frame(PORTS=40)

predict(model, newdata, interval="confidence", level = 0.95) 

predict(model, newdata, interval="prediction", level = 0.95) 

####################################################

# Calculating confidence intrevals for sales/advertising
# When ADV is 25,000

library(readxl)

# Import data from an Excel workbook
# Make sure to save file as xlsx
SALESAD <- read_excel("C:\\Users\\Zack\\Documents\\Spring 2021\\MATH 212\\Data Sets\\SALESAD3.xlsx", sheet=1)


# Open the book CD file and save as "xlsx" in your folder

# View Data
head(SALESAD)

# Create a variable called PORTS
SALES <- SALESAD$SALES

# Create a variable called COST
ADV <- SALESAD$ADV

# Create ANOVA table
model <- lm(SALES~ ADV)

# Note that ADV data in given in 100s,  So 25,000 becomes 250
newdata = data.frame(ADV=250)

predict(model, newdata, interval="confidence", level = 0.95) 

predict(model, newdata, interval="prediction", level = 0.95) 

# Scatter plot
plot(SALESAD$ADV, SALESAD$SALES, pch = 16, cex = 1.3, col = "blue", main = "Sales against Advertising", xlab = "Advertising", ylab = "Sales($)")

# Create regression model
lm(SALESAD$SALES ~ SALESAD$ADV)

# Add regression line
abline(lm(SALESAD$SALES ~ SALESAD$ADV))

########################################################
# Calculation of press statistics "by hand" for data on table 3.2
# Enter the data on table

x <- c(1, 2, 3, 4, 5, 6)
y <- c(3, 2, 8, 8, 11, 13)

Step 1:
Remove the first pair of data (1,3)

x <- c(2, 3, 4, 5, 6)
y <- c(2, 8, 8, 11, 13)

# Develop a regression model
model <- lm(y ~ x)

summary(model)

#            Estimate Std. Error t value Pr(>|t|)  
#(Intercept)  -1.6000     2.0050  -0.798   0.4832  
#x             2.5000     0.4726   5.290   0.0132 *
###########
Step 2:
Remove the second pair of data (2,2)

x <- c(1, 3, 4, 5, 6)
y <- c(3, 8, 8, 11, 13)

# Develop a regression model
model <- lm(y ~ x)

summary(model)

#             Estimate Std. Error t value Pr(>|t|)   
#(Intercept)   1.2568     0.8702   1.444  0.24442   
#x             1.9324     0.2086   9.263  0.00266 **
########################################################

Step 3:
Remove the third pair of data (3,8)

x <- c(1, 2, 4, 5, 6)
y <- c(3, 2, 8, 11, 13)

# Develop a regression model
model <- lm(y ~ x)

summary(model)

#             Estimate Std. Error t value Pr(>|t|)   
#(Intercept)  -0.7209     1.3429  -0.537   0.6286   
#x             2.2558     0.3316   6.802   0.0065 **
#######################################################

Step 4:
Remove the third pair of data (4,8)

x <- c(1, 2, 3, 5, 6)
y <- c(3, 2, 8, 11, 13)

# Develop a regression model
model <- lm(y ~ x)

summary(model)

            Estimate Std. Error t value Pr(>|t|)  
(Intercept)  -0.1512     1.5590  -0.097   0.9289  
x             2.2209     0.4025   5.518   0.0117 *
##########################################################

Step 5:
Remove the third pair of data (5,11)

x <- c(1, 2, 3, 4, 6)
y <- c(3, 2, 8, 8, 13)

# Develop a regression model
model <- lm(y ~ x)

summary(model)

#             Estimate Std. Error t value Pr(>|t|)  
#(Intercept)  -0.1622     1.6122  -0.101   0.9262  
#x             2.1757     0.4438   4.903   0.0162 *
##########################################################

#Step 6:
Remove the third pair of data (6,13)

x <- c(1, 2, 3, 4, 5)
y <- c(3, 2, 8, 8, 11)

# Develop a regression model
model <- lm(y ~ x)

summary(model)

#            Estimate Std. Error t value Pr(>|t|)  
#(Intercept)  -0.2000     1.7963  -0.111   0.9184  
#x             2.2000     0.5416   4.062   0.0269 *
##############################################################
# Using R to Calculate prediction R2
test.data <- data.frame(x,y)
predictions <- predict(model,test.data)
summary(predictions)
R2(predictions,y)

x <- c(1, 2, 3, 4, 5, 6)
y <- c(3, 2, 8, 8, 11, 13)

MyData <- data.frame(x,y)

Sum <- 0
 for (i in 1:(nrow(MyData)))
{
 print(i)
 NewData <- MyData[-i,]
 Model <- lm(y ~ x, NewData)
 Myx <- data.frame(x = i)
 SqPred <- (MyData[i,2] - predict(Model, Myx))^2
 Sum <- SqPred + Sum
 #print(Model)
 #print(NewData)

}

Sum

######################################################################
# This dosent work so skip it
#####################################################################
# Calcuate Predictive R -squae for communication nodes data

library(readxl)

# Import data from an Excel workbook
COMNODE <- read_excel("C:\\Users\\dassanayakes\\Desktop\\Toshiba\\Rhodes MATH 212\\COMNODE3.xlsx", sheet=1)

# Open the book CD file and save as "xlsx" in your folder

# View Data
head(COMNODE)

# Create a variable called PORTS
PORTS <- COMNODE$NUMPORTS

# Create a variable called COST
COST <- COMNODE$COST

x <- PORTS
y <- COST

MyData <- data.frame(x,y)

Sum <- 0
 for (i in 1:(nrow(MyData)))
{
 print(i)
 NewData <- MyData[-i,]
 Model <- lm(y ~ x, NewData)
 Myx <- data.frame(x = i)
 SqPred <- (MyData[i,2] - predict(Model, Myx))^2
 Sum <- SqPred + Sum
 #print(Model)
 #print(NewData)

}

Sum

Model2 <- lm(COST ~ PORTS)
anova(Model2)

RPred <- 1 - (Sum/(1751268376 + 222594146))

print(RPred)
####################################################################










