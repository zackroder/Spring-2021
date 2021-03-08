##################Answer
# A.  Use R to create a scatter plot and add the regression line.

library(readxl)

# Import data from an Excel workbook
COMNODE <- read_excel("C:\\Users\\Zack\\Documents\\Spring 2021\\MATH 212\\Data Sets\\COMNODE3.xlsx", sheet=1)

# Open the book CD file and save as "xlsx" in your folder

# View Data
head(COMNODE)

# Scatter plot
plot(COMNODE$NUMPORTS, COMNODE$COST, pch = 16, cex = 1.3, col = "blue", main = "Cost against Number of ports", xlab = "Number of ports", ylab = "Cost($)")

# Create regression model
lm(COMNODE$COST ~ COMNODE$NUMPORTS)

# Add regression line
abline(lm(COMNODE$COST ~ COMNODE$NUMPORTS))
###########################################################
Model <- lm(COMNODE$COST ~ COMNODE$NUMPORTS)
summary(Model)