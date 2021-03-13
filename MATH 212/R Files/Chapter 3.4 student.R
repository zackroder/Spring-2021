# Chapter 3.4
#########################
# Show why regression model is used over mean
# A.  Use R to create a scatter plot and add the regression line.

library(readxl)

# Import data from an Excel workbook
COMNODE <- read_excel("C:\\Users\\dassanayakes\\Desktop\\Toshiba\\Rhodes MATH 212\\COMNODE3.xlsx", sheet=1)

# Open the book CD file and save as "xlsx" in your folder

# View Data
head(COMNODE)

# Scatter plot
plot(COMNODE$NUMPORTS, COMNODE$COST, pch = 16, cex = 1.3, col = "blue", main = "Cost against Number of ports", xlab = "Number of ports", ylab = "Cost($)")

# Create regression model
lm(COMNODE$COST ~ COMNODE$NUMPORTS)

# Add regression line
abline(lm(COMNODE$COST ~ COMNODE$NUMPORTS))

# Create regression model
Model <- lm(COMNODE$COST ~ COMNODE$NUMPORTS)

# Look at the output
summary(Model)

# Add the mean
abline(h = mean(COMNODE$COST))
#####################################################

# Generating ANOVA table for data in table 3.2
# Enter data as vectors
y <- c(3,2,8,8,11,13)
x <- c(1,2,3,4,5,6)

# Create regression model
model <- lm(y ~ x)

# Finding SST and SSE
anova(model)

# Calculating R-square directly
summary(model)

###################
# Response: y
#          Df Sum Sq Mean Sq F value   Pr(>F)   
#x          1   84.7    84.7    38.5 0.003432 **
#Residuals  4    8.8     2.2                    

#  SSE = 8.8 (df = 1)
# SSR = 84.7 (df = 4)
# So SST is the sum 8.8 + 84.7 = 93.5
######################
# Calculating p values for f dsitrinution
(1-pf(38.5,1,4))
 
###########################
# Pricing of communication nodes

##################Answer
# A.  Use R to create a scatter plot and add the regression line.

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

# Create ANOVA table
model <- lm(COST~ PORTS)

