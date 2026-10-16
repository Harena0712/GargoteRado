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

