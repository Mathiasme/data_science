install.packages("FactoMineR")
library(FactoMineR)
data(iris)
iris
?iris
iris_bis = iris[,-5]
"methode des k means"
?kmeans
km_4 = kmeans(iris_bis,centers=4)
km_4
plot(iris_bis[,c(1,2)])
plot(iris_bis[,c(1,3)], col=km_4$cluster)
plot(iris_bis[,c(2,4)], col=km_4$cluster)
plot(iris_bis[,c(2,3)], col=km_4$cluster)

km_3 = kmeans(iris_bis,centers=3)
km_3
plot(iris_bis[,c(1,2)])
plot(iris_bis[,c(1,3)], col=km_3$cluster)
plot(iris_bis[,c(2,4)], col=km_3$cluster)
plot(iris_bis[,c(2,3)], col=km_3$cluster)
#cah
iris_distance = dist(iris_bis)
?hclust
cah = hclust(iris_distance)
plot(cah)
cutree(cah,k=2)
cutree(cah,k=3)
plot(iris_bis[,c(1,2)], col=cutree(cah,k=3))
plot(iris_bis[,c(1,4)], col=cutree(cah,k=3))
plot(iris_bis[,c(2,3)], col=cutree(cah,k=3))
plot(iris_bis[,c(3,4)], col=cutree(cah,k=3))
