# Niveau 1 – Fondamental (étapes 1 à 5)

## Etape 1 – La carte
### Schema relationnelle
- plats(**id**, libelle, prix) `(nouveau)`

### Reponse au piege
- Le type choisi pour le prix est de type `INT`
- L'identifiant choisi est `id`


## Étape 2 – Les catégories
### Schema relationnelle 
- categories(**id**, libelle) `(nouveau)`
- plats(**id**, libelle, prix, #idCategorie) `(modifié)`

### Reponse au piege
- Si on a simplement ajouter une colonne categorie VARCHAR(50) dans la table des
plats, on aurait pas pu avoir le nombre de plat par categorie car avoir une colonne de type VARCHAR multiplie les erreurs de saisie  et donc on aurait pu avoir des données comme 

| Plat | Categorie |
-------|-----------|
| Romazava | Plat Malagasy|
|Ravitoto sy henakisoa | Plat Malgache |

qui aurait pu causé des resultats incorrect car pour la base `lat Malagasy` et `Plat Malgache` sont different


## Étape 3 – Les commandes
### Schema relationnelle 
- commandes(**id**, date) `(nouveau)`
- commandeDetails(**id**, **#idCommande**, **#idPlat**, quantite) `(nouveau)`

### Reponse au piege
- J'ai placé la quantié dans la table commandeDetails


## Étape 4 – Les habitués
### Schema relationnelle 
- clients(**id**, nom) `(nouveau)`
- commandes(**id**, date, #idClient) `(modifié)`

### Reponse au piege
- Non, la clé étangère est NULL
- Il faut la jointure `LEFT JOIN` pour ne prendre aucune commande


## Étape 5 – Serveurs et tables
### Schema relationnelle 
- serveues(**id**, nom) `(nouveau)`
- tables(**id**, libelle) `(nouveau)`
- commandes(**id**, date, **#idClient**, **#idServeur**, **#idTable**) `(modifié)`

### Reponse au piege
- Une table de la salle et une commande sont deux choses différentes car une `table` de la salle sert juste d'information pour savoir où mettre la `commande`, tandis que la `commande` contient la reference de la table ainsi que les informatins du `client` et les details du `commande`
- Le nom `table` pose un probleme en SQL car c'est un mot qui existe deja dans SQL pour representé une table de base de données