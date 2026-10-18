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
(1, 1, 2),
(1, 6, 4),
(2, 2, 1),
(2, 4, 3),
(2, 7, 2); 