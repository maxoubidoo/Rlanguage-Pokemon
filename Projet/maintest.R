library(tidyverse)
library(GGally)
library(readr)


datapokemon <- read_csv("C:/Users/maxou/OneDrive/Bureau/Travail/4eme année/DSIA_R/Projet/Pokemon.csv")
View(datapokemon)

names(datapokemon) <- c("PokedexNumber"  ,"Name" ,"TypeOne" ,"TypeTwo"  , "TotalStats"  ,  "HP" ,  "Attack" ,  "Defense"  ,  "Sp.Atk"   , 
                        "Sp.Def",    "Speed"  ,    "Generation", "Legendary" )


Wonder_Trade <- read_csv("C:/Users/maxou/OneDrive/Bureau/Travail/4eme année/DSIA_R/Projet/Wonder Trade.csv")
View(Wonder_Trade)

names(datapokemon)

p <- ggplot(datapokemon, aes(x=Attack, y=Sp.Atk , fill=TypeOne))

p <- p + geom_point(aes(color=TypeOne))
p <- p + facet_wrap(~TypeOne, ncol=6)
p <- p + geom_smooth()
p


c("TotalStats" ,   "HP"       ,     "Attack"    ,    "Defense"   ,   
 "Sp.Atk"   ,     "Sp.Def"    ,    "Speed")


names(datapokemon)


myxname = as.name("HP")

myx = table(dataset$myxname)

names(dataset)

myx
Wonder_Trade <- read_csv("Wonder Trade.csv")



c("Legendary", "Generation", "TypeTwo")

p2 <- ggplot(datapokemon, aes(x=Generation, fill=TypeOne)) 
p2

p2 <- p2 + geom_histogram()

p2

p2 <- p2 + facet_wrap(~TypeOne, ncol=6)
p2


View(Wonder_Trade)

datapokemon$TypeOne <- as.factor(datapokemon$TypeOne)


levels(datapokemon$TypeOne)

#Classification par type

#dataBug = subset()

