library(ISLR)
names(Smarket)
dim(Smarket)
summary(Smarket)
head(Smarket)

pairs(Smarket)
cor(Smarket[,-9])
attach(Smarket)
plot(Volume)

# Logistic Regression

glm.fits = glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Voolume, data=Smarket, family=binomial)
