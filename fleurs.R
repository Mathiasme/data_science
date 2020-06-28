#Nous utiliserons essentiellement deux approches en nous appuyant sur deux procédures du logiciel R : la
#classification ascendante hiérarchique (CAH) avec hclust() ; la méthode des centres mobiles (k-means)
#avec kmeans().

install.packages("FactoMineR")
#Factominer permet de réaliser des analyses classiques telles que l'analyse en composantes principales (ACP),
#l'analyse des correspondances (AC), l'analyse des correspondances multiples (ACM) ainsi que des analyses plus avancées.
library(FactoMineR)
#On importe un dataset de R connu, Iris, dont les données ont été collectées par Edgar Anderson
data(iris)
iris
?iris
iris_bis = iris[,-5]
"methode des k means"
# La méthode des kmeans permet de regrouper les sujets en K clusters distincts.
# les sujets appartiennent à un seul cluster, et les clusters ne se chevauchent pas.
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

#on effectue désormais la CAH
#Le principe de la CAH est de rassembler des individus selon un critère de ressemblance défini au préalable
#qui s’exprimera sous la forme d’une matrice de distances, exprimant la distance existant entre chaque individu pris deux à deux.
#La CAH va ensuite rassembler les individus de manière itérative afin de produire un dendrogramme ou arbre de classification.
iris_distance = dist(iris_bis)
?hclust
#On indique sur quoi il faut faire la CAH 
cah = hclust(iris_distance)
#On print la CAH
plot(cah)
# Découper en choisissant le nombre de groupes, 2 puis 3
cutree(cah,k=2)
cutree(cah,k=3)
plot(iris_bis[,c(1,2)], col=cutree(cah,k=3))
plot(iris_bis[,c(1,4)], col=cutree(cah,k=3))
plot(iris_bis[,c(2,3)], col=cutree(cah,k=3))
plot(iris_bis[,c(3,4)], col=cutree(cah,k=3))
