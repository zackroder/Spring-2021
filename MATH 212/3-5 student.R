x <- c(1,2,3,4,5,6)
y <- c(3,2,8,8,11,13)

model <- lm(y ~ x)
newdata <- data.frame(x=6)
predict(model, newdata, interval="confidence", level=0.95)
predict(model, newdata, interval="prediction", level=0.95)

