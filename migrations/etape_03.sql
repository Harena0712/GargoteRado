CREATE TABLE commandes (
    id SERIAL PRIMARY KEY,
    daty DATE
);

CREATE TABLE commandeDetails(
    id SERIAL PRIMARY KEY,
    idCommande INT,
    idPlat INT,
    quantite INT,

    CONSTRAINT fk_commande_commandeDetail FOREIGN KEY (idCommande) REFERENCES commandes (id),
    CONSTRAINT fk_commande_plat FOREIGN KEY (idPlat) REFERENCES plats (id)
);

INSERT INTO commandes (daty) VALUES
('2026-10-15'),
('2026-10-16');

INSERT INTO commandeDetails (idCommande, idPlat, quantite) VALUES
(1, 1, 2),   -- commande 1 : 2 Romazava
(1, 6, 4),   -- commande 1 : 4 Mofo gasy
(2, 2, 1),   -- commande 2 : 1 Ravitoto sy henakisoa
(2, 4, 3),   -- commande 2 : 3 Mi sao
(2, 7, 2);   -- commande 2 : 2 Ranon'ampango

-- Verification

SELECT c.daty AS commande, SUM(p.prix * cd.quantite) AS montant
FROM commandes c JOIN commandeDetails cd
ON c.id = cd.idCommande
JOIN plats p ON p.id = cd.idPlat
GROUP BY c.daty;