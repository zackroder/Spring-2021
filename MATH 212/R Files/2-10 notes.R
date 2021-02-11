#Chapter 2.7

#Example
Lifetime <- c(92, 110, 115, 103, 98)

mean(Lifetime)
sd(Lifetime)

#Statistic
(103.6 - 110)/(9.18/sqrt(5))

#P-value
1 - pt(-1.56, 4)

#Using t-test function
t.test(Lifetime, level=0.95, alternative="greater", mu=110)

#possible values for alternative = c("two.sided", "less", "greater")