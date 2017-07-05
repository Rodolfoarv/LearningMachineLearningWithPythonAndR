library(datasets)
library(ggplot2)

head(iris)
ggplot(iris, aes(iris$Petal.Length, iris$Petal.Width, color = Species)) + geom_point()

set.seed(20)
irisCluster <- kmeans(iris[,3:4], 3, nstart = 20)
irisCluster

table(irisCluster$cluster, iris$Species)

irisCluster$cluster <- as.factor(irisCluster$cluster)
ggplot(iris, aes(iris$Petal.Length, iris$Petal.Width, color=irisCluster$cluster)) + geom_point()