# Chapter 3.2

#######################################################################

# Plotting using ggplot2

# Install ggplot2
#install.packages(ggplot2)

# The following code shows how to plot a simple linear regression line
library(readxl)

# Import data from an Excel workbook
COMNODE <- read_excel("C:\\Users\\Zack\\Documents\\Spring 2021\\MATH 212\\Data Sets\\COMNODE3.xlsx", sheet=1)

# View Data
head(COMNODE)

# Create a variable called PORTS
PORTS <- COMNODE$NUMPORTS

# Create a variable called COST
COST <- COMNODE$COST

COMMDATAFRAME <- data.frame(COST, PORTS)

library(ggplot2)

ggplot(COMMDATAFRAME,
       aes(x = PORTS, 
           y = COST)) +
  geom_point(color= "steelblue") +
  geom_smooth(method = "lm", se = FALSE) + 
       labs(x = "Number of Ports",
       y = "Total Cost",
       title = "Number of Ports vs. Cost") 

# Strong linera relationship
# Cross sectional data gathered at the same time point

########################################################################################
######Question#################
# Access data set REALEST3
REALEST <- read_excel("C:\\Users\\Zack\\Documents\\Spring 2021\\MATH 212\\Data Sets\\REALEST3.xlsx")
head(REALEST)
VALUE <- REALEST$VALUE
SIZE <- REALEST$SIZE

RealEstDF <- data.frame(VALUE, SIZE)
# Create a scatterplot for number of size(x) and value(y)
ggplot(RealEstDF,
       aes(x = SIZE, 
           y = VALUE)) +
  geom_point(color= "steelblue") +
  geom_smooth(method = "lm", se = FALSE) + 
  labs(x = "Size",
       y = "Value",
       title = "Size vs. Value") 
# Add a regression line 
##################Answer################################################################
# Weak linear relationship
# Cross sectional data gathered at the same time point


########################################################################################
######Question#################
# Access daat set HSTARTS3
HSTARTS <- read_excel("C:\\Users\\Zack\\Documents\\Spring 2021\\MATH 212\\Data Sets\\HSTARTS3.xlsx")

# Create a scatterplot for number of rates(x) and starts(y)
RATES <- HSTARTS$RATES
STARTS <- HSTARTS$STARTS

HSTARTSDF <- data.frame(RATES, STARTS)
ggplot(HSTARTSDF,
       aes(x = RATES, 
           y = STARTS)) +
  geom_point(color= "steelblue") +
  geom_smooth(method = "lm", se = FALSE) + 
  labs(x = "Rates",
       y = "Starts",
       title = "Housing Starts vs. Mortgage Rates")
# Add a regression line 
##################Answer

# No linear relationship
# Time series data gathered at the same time point
