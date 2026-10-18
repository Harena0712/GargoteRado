-- Verification 

-- Etape 1
SELECT * FROM plats ORDER BY prix DESC;

-- Etape 2
SELECT c.libelle AS categorie, COUNT(p.libelle) AS nbPlats 
FROM plats p JOIN categories c 
ON c.id = p.idCategorie 
GROUP BY c.libelle;

-- Etape 3
SELECT c.daty AS commande, SUM(p.prix * cd.quantite) AS montant
FROM commandes c JOIN commandeDetails cd
ON c.id = cd.idCommande
JOIN plats p ON p.id = cd.idPlat
GROUP BY c.daty;

-- Etape 4
SELECT c.id AS commande, c.daty,
CASE 
    WHEN c.idClient ISNULL THEN 'Client de passage'
    ELSE cl.nom
END 
AS client
FROM commandes c LEFT JOIN clients cl
ON c.idClient = cl.id;

-- Etape 5
SELECT s.nom AS serveur, COUNT(DISTINCT c.id) AS nbCommande, COALESCE(SUM(p.prix * cd.quantite), 0) AS chiffreAffaire
FROM commandes c 
LEFT JOIN serveurs s ON c.idServeur = s.id
LEFT JOIN commandeDetails cd ON cd.idCommande = c.id
LEFT JOIN plats p ON p.id = cd.idPlat
GROUP BY s.nom;

-- Etape 6
SELECT t.commande, t.montantDu, t.montantPaye, t.montantDu - t.montantPaye AS resteAPaye
FROM 
    (
        SELECT c.id AS commande, 
            (SELECT  SUM(p.prix * cd.quantite)
            FROM commandeDetails cd
            LEFT JOIN plats p ON cd.idPlat = p.id
            WHERE c.id = cd.idCommande) AS montantDu,

            (SELECT COALESCE(SUM(cp.montantPaye), 0) 
            FROM commandePayements cp
            WHERE c.id = cp.idCommande) AS montantPaye
        FROM commandes c
    ) t
WHERE t.montantDu - t.montantPaye > 0;