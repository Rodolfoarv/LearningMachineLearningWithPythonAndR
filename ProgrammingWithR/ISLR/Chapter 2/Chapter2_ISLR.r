x <- c(1,3,4)   # Concatenates a vector
y = c(1,2,3)    # Used instead of the <- notation
length(x)       # Get the length of the vector
length(y)
x + y
ls()            # List all the variables in use
rm(x,y)         # Remove the variables x,y
ls()
rm(list=ls())   # Removes all the variables by getting the lsit
?matrix

#Matrices

x = matrix(data=c(1,2,3,4), nrow=2, ncol=2, byrow = TRUE)
x
sqrt(x)
x^2

x = rnorm(50)
y = x + rnorm(50, mean=50, sd=.1)
cor(x,y)

set.seed(3)
y = rnorm(100)
mean(y)
var(y)
sqrt(var(y)) == sd(y)

# Graphics

?plot
require(stats)
plot(cars)
plot(sin, -pi, 2*pi)

x = rnorm(100)
y = rnorm(100)
plot(x,y)
plot(x,y,xlab="This is the x axis", ylab="This is the y axis", main="Plot of X vs Y")
pdf("Figure.pdf")
plot(x,y,col="green")
dev.off()
x = seq(1,10)
x
x = 1:10
x = seq(-pi,pi,length=50)


y = x
f=outer(x,y,function (x,y)cos(y)/(1+x^2))
contour(x,y,f)
contour (x,y,f,nlevels =45,add=T)
fa=(f-t(f))/2
contour (x,y,fa,nlevels =15)
image(x,y,fa)
persp(x,y,fa)
persp(x,y,fa,theta =30)

# Indexing data

A = matrix(1:16, 4,4)
A
A[c(1,3), c(2,4)]
A[1:3,2:4]
A[1:2,]
A[-c(1,3), ]

