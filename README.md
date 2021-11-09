# Rlanguage-Pokemon
R project

## Sommaire
1. [Rapport d'analyse](#1-Rapport-d’analyse)
2. [User Guide](#2.-User-Guide)
3. [Developer Guide](#2.-Developer-Guide)
4. [Lien](#2.-Lien)


## 1. Rapport d’analyse

Notre projet porte sur les stats des différents Pokémon sur les générations une à sept.

Chaque Pokémon a différentes statistiques (vitesse, attaque, défense) ainsi que deux types.
Nous pouvons donc observer chaque statistique selon le type mais aussi les comparer à l'intérieur de chaque type.

Nous avons aussi pris un dataset avec 500 wonder trades (des échanges de pokémon aléatoire à travers le monde) pour avoir des données géolocalisées. 

Passons aux graphiques:

Nous avons opté pour un graphique très interactif, dans un premier temps pour représenter l’utilisation que quelqu’un aurait de notre application: montrer les graphiques selon les types et les statistiques, afin de comparer les Pokémons. Nous avons donc un bargraphe pour montrer la répartition des statistiques des pokémons selon les types sélectionnées. Lorsque tous les types sont sélectionnés nous obtenons trois bosses, expliquées par les trois stades d’évolutions des pokémons. 

En ajoutant une statistique (par exemple les HP selon l’attaque) nous obtenons un graphique en points, nous permettant de visualiser plus facilement deux statistiques ainsi que de cliquer pour sélectionner les pokémons, affichées ensuite dans un tableau en dessous. De plus, nous pouvons ajouter une forme aux points, selon le fait que le pokémon soit légendaire, son deuxième type ou sa génération. Cela permet une utilisation plus “compétitive” de notre graphique, de voir les forces et les faiblesses de chaque pokémon.
Dans ces graphes nous pouvons notamment voir que dans la majorité des cas les pokémons légendaire ont de bien meilleurs statistiques que le reste.

La partie intéractive étant plus complexe à décrire de par sa nature, nous allons passer à la partie plus “fixe”. 

Dans un premier temps nous avons l’histogramme (accessible depuis la case à cocher “Histogramme”) permettant d’avoir la répartition de tous les pokémons selon le ratio X/Y. Le graphique ne représente pas grand chose en terme d’utilisation “compétitive” mais il est intéressant de noter qu' il y a toujours certains pokémons qui sortent du lot (cela signifie qu’ils sont bons dans un seul domaine mais pas dans l’autre).

Enfin la carte des échanges montre qu’il n’y a pas beaucoup de pays échangeant des pokémons, de par l'accès au jeu et/ou à une connexion internet, ce qui était attendu, néanmoins nous pouvons remarquer un gros pôle d'échange : le Japon et les Etats Unis avec environ 50% des échanges réalisées à eux deux.


## 2. User Guide

Run “requirements” pour installer les packages nécessaires.

Ouvrir le fichier “R project” puis dans l’environnement ouvrir et run le fichier “app” dans “TestPkmn”, l’adresse est : http://127.0.0.1:7208/


Dans le cas où requirements est perdu voici le nom des packages nécessaires, à installer avec  “install.packages(“name”)”

"shiny"
"gapminder"
"dplyr"
"ggplot2"
"tidyverse"
"readr"
"plotly"
"leaflet"
"maps"



## 3. Developer Guide



Nous avons séparé le code en plusieurs parties distinctes par l'utilisation de commentaires,  les variables globales sont gérées dès le début du code.

L’UI est géré dans l’ordre d’apparition sur la page WEB.

Les graphes sont gérés  directement dans la partie “server”, selon les conditions (cases et menu déroulants).

Chaque graphique (hors map) est géré par la dataset nommé “dataset”, qui est changé selon les conditions.

## 3. Lien

https://www.kaggle.com/abcsds/pokemon

https://www.kaggle.com/notgibs/wtinformatics
