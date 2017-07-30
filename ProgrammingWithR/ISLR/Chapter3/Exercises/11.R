# In this problem we will investigate the t-statistic for the null hypothesis H_0 : B = 0
# in a simple linear regression without an intercept. To begin we will generate the predictors

set.seed(1)
x = rnorm(100)
y = 2*x+rnorm(100)

#a ) Perform a simple linear regression of y onto x, without an intercept.
# Report the coefficeint estimate B^, the standard error of this coefficient and the tstatistic and pvalue

lm.fit = lm(y~x+0)
summary(lm.fit)

# The pvalue of this is really low which shows a relation between our predictor and the response.
# Also the F statistic is really high compared to 1, The R^2 has a value of 0.77 which explains the
# variability on the data, We can afirm that: The null hypothesis is rejected

# b) Now performa  simple linear regression of x onto y without an intercept and report
# the coefficient estimate, its standard error and the corresponding t-statistic
# and dp values associated with it

lm.fit1 = lm(x~y+0)
summary(lm.fit1)

# We can see the same result, as before, the null hypothesis is rejected

# c) What is the relationship between the results obtained in a and b?

# Both results represent the same. y = 2x and x can be represented as x = 0.5y
