#This question involdes the use of simple linear regression on the auto dataset

# a ) use the lm() function to perform a simple lienar regression with the mpg
# as the response and horsepower as the predictor. Use the summary function to print the results.
# Comment the output.

library(MASS)
library(ISLR)

head(Auto)
fix(Auto)
attach(Auto)

lm.fit = lm(mpg~horsepower, data=Boston)
summary(lm.fit)

#i) Is there a relationship between the predictor and the response?

# We can reject the null hypothesis that is:  H0 = There exists no relation between horsepower and mpg
# By looking at the p-value that is below 0.001, also the tvalue represents that our predictor is far away from 0
# Also the F statistic is 599.7 which is far from 1 and the p-value of the F-statistic is close to zero
#Thus rejecting the null hypothesis

#ii) How strong is the relationship between the predictor and the response?

#We need to calculate the residual error relative to the reponse.

response_mean = mean(mpg, na.rm=T)
residualerror_lm = 4.906
result = (residualerror_lm / response_mean) * 100
R_squared = summary(lm.fit)$r.sq
print("Means 60% of the variance is explained with the R^2 value")

#iii) Is the relationship between the predictor and the response positive or negative?
# It is negative since the more horsepower an automobile has the more it will spend on mpg

#iv) Use the plot function to produce diagnostic plots of the least squares regression fit.

plot(horsepower, mpg)
abline(lm.fit, col="red", lwd=3)

