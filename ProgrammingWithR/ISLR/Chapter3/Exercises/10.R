# This question should be answered using the Carseats data set

library(ISLR)
fix(Carseats)
attach(Carseats)
names(Carseats)

# a) Fit a multiple regression model to predict sales using Price Urban and US

lm.fit = lm(Sales~Price+Urban+US)
summary(lm.fit)

# b) Provide an interpretation o f each coefficient in the model

# Price: the coefficient is -0.054459. The linear model says it is a good coefficient due to the
# low p value of the t-statistic. As price increases, the sale decreases

# UrbanYES: the coefficient is -0.021916. The linear model states that it does not have a good
# relationship between the sales.

#USYES: The coefficient is 1.200573 which has a good pvalue of the t-statistic. It says that
# if the store is in the US the sales will increase by 1201 ( due to the coefficient)

# c) Write out the model in equation form, being careful to handle the qualitative variables correctly

# Sales = 13.043469 + (-0.054459) * Price + (-0.021916) UrbanTrue + 1.200573 * USTrue


# d) For which of the predictors can you reject the null hypothesis H_0 = B_j = 0?
#We can reject for those that a high pvalue which are Price and USYES

# e) On the basis of your response to the previous question, fit a smaller model
#that only uses the predictors for which there is evidence of association with the outcome

lm.fit2 = lm(Sales~Price+US)
summary(lm.fit2)

#f) How well do the models in a and e fit the data

# Based on the R^2 and the RSE of both models, fit1 has a RSE of 2.472 with 4?2 of 0.2393 which is bad
# While the modified model has a RSE of 2.469 and R^2 of 0.2393 however both do not perform good
# we could find a better model since the variability on the data is not well explained with this

#g) Using the model from e, obtain a 95% confidence interval for the coefficients

confint(lm.fit2)

#h) Is there evidence of outliers or high leverage obsrvations in the model from e?

plot(predict(lm.fit2), rstudent(lm.fit2))

#We can see there are no potential outliers since they all fit in the range [-3,3]