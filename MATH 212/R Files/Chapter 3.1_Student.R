# Chapter 3.1

# Create a variable called 
TEMPERATURE <- c(54.5, 59.5, 63.5, 67.5, 72, 78.5, 83.0)

# Create a variable called COST
CHIRPS <- c(81, 97, 103, 123, 150, 182, 195)

CHIRPDATAFRAME <- data.frame(TEMPERATURE, CHIRPS)

library(ggplot2)

ggplot(CHIRPDATAFRAME,
       aes(x = CHIRPS , 
           y = TEMPERATURE )) +
  geom_point(color= "steelblue") +
  geom_smooth(method = "lm", se = FALSE) + 
       labs(x = "Chirps per minute",
       y = "Outside temperature",
       title = "Chirp rate vs. Outside temperature") 

# Create regression model
Model <- lm(TEMPERATURE ~ CHIRPS)

# Look at output
summary(Model)

#######################################################
# Question 
# Create a plot and a regression model for question 1 of Chapter 3.1 slides




