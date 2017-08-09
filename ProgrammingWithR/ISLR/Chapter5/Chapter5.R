#Cross validation and the Bootstrap

# The validation set approach

library(ISLR)
set.seed(1)
train = sample(392,196)
lm.fit = lm(mpg~horsepower, data=Auto, subset=train)
summary(lm.fit)

attach(Auto)
mean((mpg-predict(lm.fit, Auto))[-train]^2)

#Squared
lm.fit2 = lm(mpg~poly(horsepower,2), data=Auto, subset=train)
mean((mpg-predict(lm.fit2, Auto))[-train]^2)

#Cubic
lm.fit3 = lm(mpg~poly(horsepower,3), data= Auto, subset=train)
mean((mpg-predict(lm.fit3, Auto))[-train]^2)

# Choosing a different training set
set.seed(2)
train=sample(392,196)
lm.fit = lm(mpg~horsepower, subset=train)
mean((mpg-predict(lm.fit, Auto))[-train]^2)


