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

glm.fits = glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume, data=Smarket, family=binomial)
summary(glm.fits)
coef(glm.fits)
glm.probs = predict(glm.fits, type="response")
glm.probs[1:10]
contrasts(Direction)
glm.pred = rep("Down",1250)
glm.pred[glm.probs>.5] = "Up"

#Create a confusion matrix
table(glm.pred, Direction)
#Correct predictions
(507 + 145) / 1250
mean(glm.pred==Direction)

# Spliting the data set to create a train dataset and test dataset

train = (Year < 2005)
Smarket.2005= Smarket[!train,]
dim(Smarket.2005)
Direction.2005 = Direction[!train]

glm.fits = glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume, data=Smarket, family=binomial, subset=train)
glm.probs = predict(glm.fits, Smarket.2005, type=response)
glm.pred = rep (" Down " ,252)
glm.pred [ glm.probs >.5]=" Up "
table ( glm.pred , Direction.2005)
