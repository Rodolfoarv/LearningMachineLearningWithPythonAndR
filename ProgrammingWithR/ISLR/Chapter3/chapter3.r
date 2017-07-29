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

# ****************************** INTERACTIONS TERMS/ NON LINEAR TRANSFORMATIONS ******************

summary(lm(medv~lstat*age, data=Boston))

#To do non linear trasnformations we must use the function I()

lm.fit2 = lm(medv~lstat+I(lstat^2))
summary(lm.fit2)
vif(lm.fit2)

lm.fit = lm(medv~lstat)
#We use the anova function to compare both models linear and quadratic

anova(lm.fit, lm.fit2)
par(mfrow=c(2,2))

plot(lm.fit2)
plot(lm.fit)

#Cubic fits we may use the I(x^3) however this is not good in practice
#Poly function proves useful here

lm.fit5 = lm(medv~poly(lstat,5))
summary(lm.fit5)

summary(lm(medv~log(rm), data=Boston))
# *****************************END OF INTERACTIONS TERMS / NON LINEAR TRANSFORMATIONS ************

# ***************************** Qualitative Predictors *******************************************

#We will change the dataset to the Carseats, predicting Sales 
fix(Carseats)
attach(Carseats)
names(Carseats)

#Shelveloc, urban and US are qualitative predictors which may prove useful in this analysis

lm.fit = lm(Sales ~.+Income:Advertising + Price:Age, data=Carseats)
summary(lm.fit)

#Constrasts function returns the dummy variables that R uses for the qualitative predictors
contrasts(ShelveLoc)
contrasts(US)
# ***************************** End of Qualitative predictors ************************************

#******************************* WRITTING FUNCTIONS *********************************************

loadLibraries = function(){
  library(ISLR)
  library(MASS)
  print("The libraries have been loaded")
}

loadLibraries()

