###################Variable selection #################################
# Let's learn how the stepwise regression procedure works by considering a data set that concerns 
# the hardening of cement. Sounds interesting, eh? In particular, the researchers were interested 
# in learning how the composition of the cement affected the heat evolved during the hardening of 
#the cement.

#1.  Create a following data frame and save it as "cement"
#	y 		x1 	x2 	x3 	x4
#	78.5  	7 	26  	6 	60
#	74.3  	1 	29 	15 	52
#	104.3 	11 	56  	8 	20
#	87.6 		11 	31  	8 	47
#	95.9  	7 	52  	6 	33
#	109.2 	11 	55  	9 	22
y <- c(78.5, 74.3, 104.3,87.6,95.9,109.2)
x1 <- c(7,1,11,11,7,11)
x2 <- c(26,29,56,31,52,55)
x3 <- c(6,15,8,8,6,9)
x4 <- c(60,52,20,47,33,22)

cement <- data.frame(y,x1,x2,x3,x4)
#Response y: heat evolved in calories during hardening of cement on a per gram basis
#Predictor x1: % of tricalcium aluminate
#Predictor x2: % of tricalcium silicate
#Predictor x3: % of tetracalcium alumino ferrite
#Predictor x4: % of dicalcium silicate

#2 Create correlation plots using "ggcorrplot" package
# Interpret what you see in the correlation plots
r <- cor(cement)

library(ggcorrplot)
ggcorrplot(r)
######################################################################
# Define Alpha_to_enter and Alpha_to_remove
Alpha_to_enter <- 0.15
Alpha_to_remove <- 0.15

######################################################################
# Step 1
## Now, regressing y on x1 , regressing y on x2 , regressing y on x3 , and regressing y on x4 , 
# we obtain:

model <- lm(y ~ x1, data = cement)
summary(model)

model <- lm(y ~ x2, data = cement)
summary(model)

model <- lm(y ~ x3, data = cement)
summary(model)

model <- lm(y ~ x4, data = cement)
summary(model)

#############Outputs###################################################
#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)   
#(Intercept)   70.218     10.151   6.918  0.00229 **
#x1             2.677      1.157   2.314  0.08166 . 
#---
#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)   
#(Intercept)  53.4755     7.5881   7.047  0.00214 **
#x2            0.9195     0.1745   5.269  0.00622 **
#---
#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)   
#(Intercept)  105.108     17.919   5.866  0.00422 **
#x3            -1.555      1.951  -0.797  0.47016   
#---
#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)    
#(Intercept) 123.1287     5.3614  22.966 2.13e-05 ***
#x4           -0.8076     0.1282  -6.297  0.00325 ** 
---
# Each of the predictors is a candidate to be entered into the stepwise model because each t-test P-value is less than Alpha_to_enter=0.15.
# Therfore.Pick the variable with the smallest p-value.
# x4 has he smallest p-value, so as a result of the first step, we enter x4 into our stepwise model.
#######################################################################
# Step 2
# Now, following step #2, we fit each of the two-predictor models that include x4 as a predictor — that is, we regress y on x4 and x1 , 
# regress y on x4 and x2 , and regress y on x4 and x3 , obtaining:

model <- lm(y ~ x4 + x1, data = cement)
summary(model)

model <- lm(y ~ x4 + x2, data = cement)
summary(model)

model <- lm(y ~ x4 + x3, data = cement)
summary(model)


################################output########################################

#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)    
#(Intercept) 108.6595     6.9181  15.707 0.000561 ***
#x4           -0.6573     0.1054  -6.235 0.008322 ** 
#x1            1.0759     0.4402   2.444 0.092163 .  

#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)
#(Intercept) 112.7164    55.1982   2.042    0.134
##x4           -0.6899     0.6370  -1.083    0.358
#x2            0.1403     0.7394   0.190    0.862

#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)    
#(Intercept) 130.0653     5.6886  22.864 0.000183 ***
#x4           -0.7773     0.1030  -7.546 0.004824 ** 
#x3           -0.9368     0.5106  -1.835 0.163931    

############################################################################
# The predictor x2 and x3 are not eligible for entry into the stepwise model because 
# their t-test P-values (0.687, 0.163) are greater than Alpha_to_enter=0.15.  However, 
# the P-value for x1 < Alpha_to_enter (0.092 < 0.15).  As a result of the second step, 
# we enter x1 into our stepwise model. 

# Now, since x4 was the first predictor in the model, we must step back and see if entering x1 
# into the stepwise model affected the significance of the x4 predictor. It did not — the t-test
# P-value is less than 0.008, and thus smaller than Alpa_to_remove = 0.15. Therefore, we proceed to 
# the third step with both x1 and x4 as predictors in our stepwise model.
#############################################################################

# Step 3
# we fit each of the three-predictor models that include x1 and x4 as predictors — that is, we regress y on x4 , x1 , 
# and x2 ; and we regress y on x4 , x1 , and x3 , obtaining:

model <- lm(y ~ x1 + x4 + x2, data = cement)
summary(model)

model <- lm(y ~ x1 + x4 + x3, data = cement)
summary(model)

########################Results###############################################
#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)
#(Intercept)  72.9209    35.0090   2.083    0.173
#x1            1.2030     0.4511   2.667    0.117
#x4           -0.2550     0.4002  -0.637    0.589
#x2            0.4587     0.4407   1.041    0.407

#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)  
#(Intercept) 115.5754    13.4748   8.577   0.0133 *
#x1            0.7886     0.6728   1.172   0.3618  
#x4           -0.6841     0.1255  -5.450   0.0321 *
#x3           -0.4123     0.6573  -0.627   0.5946  
################################################################################
# Neither of the remaining predictors — x2 and x3 — are eligible for entry into our stepwise model, 
# because each t-test P-value — 0.407 and 0.594, respectively — is greater than Alpha_to_enter = 0.15. That is, 
# we stop our stepwise regression procedure. Our final regression model, based on the stepwise procedure contains only the predictors x1 and x4:

# Final model
model <- lm(y ~ x1 + x4, data = cement)
summary(model)


###############Output############################################################
#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)    
#(Intercept) 108.6595     6.9181  15.707 0.000561 ***
#x1            1.0759     0.4402   2.444 0.092163 .  
#x4           -0.6573     0.1054  -6.235 0.008322 ** 
---
#################################################################################
# Sarasota housing data
# load data
library(mosaicData)

data(SaratogaHouses, package="mosaicData")

# Look at the data set
head(SaratogaHouses)

# Create a data frame
Price <- SaratogaHouses$price
Living_Area <- SaratogaHouses$livingArea
Bathrooms <- SaratogaHouses$bathrooms
Rooms <- SaratogaHouses$rooms
College <- SaratogaHouses$pctCollege

Housing <- data.frame(Price,Living_Area,Bathrooms,Rooms, College)
r <- cor(Housing)  

# install.packages(ggcorrplot)
library(ggcorrplot)

# Create correlation plot
ggcorrplot(r)
######################################Question#############################################
# 1. Use variable selection to come up with a final model
# 2. Add the plots for conditional relations in the final model

###########################################################################################

model <- lm(Price ~ Living_Area, data=Housing )
summary(model)

model <- lm(Price ~ Bathrooms, data=Housing)
summary(model)

model <- lm(Price ~ Rooms, data=Housing)
summary(model)

model <- lm(Price ~ College, data=Housing)
summary(model)

##all variables have same p-value for slope; pick highest t-value (living area)


model <- lm(Price ~ Living_Area + Bathrooms, data=Housing)
summary(model)

model <- lm(Price ~ Living_Area + Rooms, data=Housing)
summary(model)

model <- lm(Price ~ Living_Area + College, data=Housing)
summary(model)




model <- lm(Price ~ Living_Area + Bathrooms + Rooms, data=Housing)
summary(model)


#final model
model <- lm(Price ~ Living_Area + Bathrooms + College, data=Housing)
summary(model)

library(visreg)
visreg(model, "Living_Area", gg=TRUE)
visreg(model, "Bathrooms", gg=TRUE)
visreg(model, "College", gg=TRUE)



############
head(mtcars)

Mileage <- mtcars$mpg
Weight <- mtcars$wt
Draft <- mtcars$drat
Gears <- mtcars$gear
Horsepower <- mtcars$hp

Cars <- data.frame(Mileage, Weight, Draft, Gears, Horespower)

r <- cor(Cars)
ggcorrplot(r)














