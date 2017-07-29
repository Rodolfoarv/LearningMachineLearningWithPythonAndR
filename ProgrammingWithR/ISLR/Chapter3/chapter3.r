# Rodolfo Andrés Ramírez Valenuzela
# 28 of July 2017

# Chapter 3 of the Book ISLR http://www-bcf.usc.edu/~gareth/ISL/

library(MASS)
library(ISLR)

# Simple linear Regression 

# Boston data set which records medv ( median house value) seeking to predict medv using 13 predictors

fix(Boston)
names(Boston)
attach(Boston)
lm.fit = lm(medv~lstat)
summary(lm.fit)
names(lm.fit)

# It is safer to use the extractor function like coef instead of lm.fit$coefficients
coef(lm.fit)

#In order to obtain a confidence interval for the coefficient estimates we may use confint command
confint(lm.fit)

#The predict function can be used to produce confidence intervals and prediction intervals, for the
#preidiction of medv for a given value of lstat

predict(lm.fit, data.frame(lstat=(c(5,10,15))), interval="confidence")
predict(lm.fit, data.frame(lstat=(c(5,10,15))), interval="prediction")

#We will now plot medv and lstat along with the least squares regression

plot(lstat, medv, pch=20)
abline(lm.fit, lwd=3, col="red")
par(mfrow=c(2,2))
plot(lm.fit)
plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))
plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))

# ******************************   MULTIPLE LINEAR REGRESSION ************************************

lm.fit = lm(medv~lstat+age)
summary(lm.fit)

#In order to put all the variables in the model
lm.fit = lm(medv~., data=Boston)
summary(lm.fit)

#We may access individual elements of the summary ?summary.lm

summary(lm.fit)$sigma

# The vif function, can be used to compute the variance inflation factors
library(car)
vif(lm.fit)

#Performing the regression on all variables except one
#We will exclude the age since it has a high pvalue

lm.fit1 = lm(medv~.-age, data=Boston)
summary(lm.fit1)

# ****************************** END OF MULTIPLE LINEAR REGRESSION *******************************
