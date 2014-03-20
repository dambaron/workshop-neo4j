Hand's On Neo4j
=========

![Mou icon](http://upload.wikimedia.org/wikipedia/en/4/4a/Neo4j.jpg)

Nous sommes une boutique de e-commerce fleurissante, et afin de mieux cerner notre clientèle et ses besoins, le service marketing souhaite faire des analyses sur les stats du site.
Étant un pro de la Business Intelligence, on fait appel à vous...

Pour ce faire, vous devrez implémenter diverses méthodes qui permettront d'analyser les stats enregistrées par le site dans une base de données Neo4j.

Pour vous entrainer, on vous met à disposition un environnement de test avec des données déjà prêtes.
Vous pouvez d'ailleurs visualiser le graphe <http://goo.gl/GfahGI>

### Le contenu d'un panier

Pour découvrir Neo4j, on vous demande de pouvoir lister les produits d'un panier. Didier, votre collègue, vous suggère d'utiliser les requêtes `Cypher`, directement dans la console Neo4j.

Une fois votre requête prête, vous pourrez implémenter son execution dans la méthode

	GraphDAO.getProductsFor

Documentation relative à cette partie : <http://docs.neo4j.org/chunked/milestone/tutorials-cypher-java.html>

Quick reference card : <http://docs.neo4j.org/refcard/2.0/>

Informations complémentaires : Dans cette partie, vous aurez besoin de :
* ExecutionEngine.columnAs() (prend en paramètre le nom du résultat que vous avez retourné dans la requête cypher)
* Lists.newArrayList() (pour la conversion d'un itérable en liste) [javadoc](http://docs.guava-libraries.googlecode.com/git/javadoc/com/google/common/collect/Lists.html#newArrayList%28java.lang.Iterable%29)

### La recommandation de produit

La première chose qui saute aux yeux quand on arrive sur le site, c'est qu'il n'y a pas de recommandation de produit. Aussi vous demande-t-on, avant toute chose, d'implémenter une méthode permettant à partir d'un nom de produit de retrouver tous les produits qui ont été achetés dans le même panier. 

	GraphDAO.getRecommendedProductsFor

### Lister les filleuls d'un client

C'est le cinquième anniversaire de création de la boîte, et pour fêter l'évènement, votre entreprise a décidé de récompenser les clients qui ont ramené le plus de clients via le parainage.
On fait donc encore appel à vous pour qu'à partir d'un nom de client, on puisse récupérer tous les clients qu'il a parrainés et ce de façon récursive.

En parlant de cette nouvelle tâche avec Didier au café (oui vous êtes des vrais inséparables), celui-ci vous parle des `Traverser`, un Objet de l'API Neo4j qui serait capable de parcourir facilement un graphe en fonction d'un type de relation ainsi que du sens de cette relation.
Il vous donne même un lien sur la doc : <http://docs.neo4j.org/chunked/milestone/tutorial-traversal-java-api.html>

La Doc n'étant pas très à jour, Didier vous invite à remplacer les méthodes statiques dépréciées de Traversal par celles de GraphDatabaseService.

	GraphDAO.getRecursiveSponsoredClient

(Il est sympa quand même ce Didier ...)


### Parrainage

Un gros bug dans le mécanisme des parrainages vient de vous arriver. Nous décidons de faire table rase et de recoder la méthode qui permet à un client de parrainer un filleul.

    GraphDAO.addNewSponsoredClient

Pendant la pause cigarette, Didier vous parle du mécanisme d'indexation automatique fourni par Neo4J et vous conseille la doc <http://docs.neo4j.org/chunked/milestone/auto-indexing.html>


### Le début de la Business Intelligence (enfin)

Une fois tout cela terminé, on vous demande de commencer à implémenter les méthodes de Business Intelligence à proprement parler. Nous commencerons donc par vouloir connaître le nombre de ventes d'un produit à une date donnée.

	GraphDAO.getNumberOfSales

La bible `Cypher` que vous avez sur votre table de nuit : <http://docs.neo4j.org/chunked/milestone/cypher-query-lang.html>


### Optimisation du parcours client

On cherche à optimiser la vente de produit, et pour ce faire on voudrait réduire au maximum le parcours client. Les produits peuvent en effet être classés dans différentes catégories qu'y s'incluent elles mêmes.
On aimerais donc déjà connaitre le parcours client le plus cours de certain produit.

	GraphDAO.getTheShortestPathToBuy

Va falloir potasser quelque peu le RefCard <http://docs.neo4j.org/refcard/2.0/>
