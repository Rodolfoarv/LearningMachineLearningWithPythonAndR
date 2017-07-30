#This question involves the use of multiple lienar regression on the Auto dataset

library(ISLR)
fix(Auto)
attach(Auto)

# i) Produce a scatterplot matrix which includes all of the variables in the dataset

pairs(Auto)

# ii) Compute the matrix of correlations between the variables using the function cor()
# You will need to exclude the name variable which is qualitative

correlation_matrix = cor(subset(Auto, select=-name))
correlation_matrix

# iii) Use the lm function to performa  multiple linear regression with mpg as the response
# and all other variables except name as the predictors
# Use the summary function to print the results and answer the following:

lm.fit = lm(mpg~.-name, Auto)
summary(lm.fit)

# Is there a relationship between the predictors and the response?
# Yes there is a relationship between the predictors, by using the null hypothesis for all the coefficients to be zero.
# The F-statistic is far from 0 with a value of 252, however the p value of some is high such as horsepower
# and acceleration

# Which predictors appear to have a statiscally significant relationship for t he response?
# weight, year, origin

# What does the coefficient for the year variable suggest?
# The coefficient is 0.75 which means that as the year 
#increases so does the mpg which means it is more efficient by every year that passes


# iv) Use the plot function to produce diagnostic plots of the lienar regression fit. 
# Do the residual plots suggest any unusually large outliers? Does the leverage plot identify any
# observations with high leverage?

par(mfrow=c(1,1))
plot(lm.fit)

# In the residual plots we can see a curve pattern and in the leverage graphic
# it can be seen that point 14 is an outlier with high leverage and high std residual

# v) Use the * and : symbols to fit linear regression models with interaction effects

lm.fit2 = lm(mpg~cylinders*horsepower+cylinders*weight+cylinders*acceleration)
summary(lm.fit2)
lm.fit3 = lm(mpg~log(horsepower))
summary(lm.fit3)
lm.fit4 = lm(mpg~horsepower)

plot(horsepower,mpg)
abline(lm.fit3, col="red", lwd=3)
abline(lm.fit4, col="blue", lwd=3)

summary(lm.fit3)
summary(lm.fit4)

#We can see in the case of the log it predicts the data better