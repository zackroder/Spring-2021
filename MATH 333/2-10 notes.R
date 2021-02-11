w = rnorm(500)

#v= c()
#v[1] = w[1]
#v[2] = w[1] + w[2]

#for (i in 3:500)
#  v[i] = 1/3*(w[i-1] + w[i] + w[i+1])

v = filter(w, sides=2, filter=rep(1/3,3)) #moving average
tsplot(w, col=4, main="white noise")
tsplot(v, ylim=c(-3,3), col=4, main="moving average")


#autoregression example
x = c()
x[1] = w[1]
x[2] = 1.5*w[1] + w[2]
for(i in 3:500)
  x[i] = -0.75*x[i-2] + 1.5*x[i-1] + w[i]

set.seed(98218)
w = rnorm(258 + 50)
x = filter(w, filter=c(1.5, -.75), method="recursive")[-(1:50)]
tsplot(x, main="autoregression", col=4)