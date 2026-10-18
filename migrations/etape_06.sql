CREATE TABLE modePayements(
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(255)
);

CREATE TABLE commandePayements (
    id SERIAL PRIMARY KEY,
    idCommande INT,
    idModePayement INT,
    montantPaye INT,

    CONSTRAINT fk_commandepayement_commande FOREIGN KEY (idCommande) REFERENCES commandes (id),
    CONSTRAINT fk_commandepayement_modepayement FOREIGN KEY (idModePayement) REFERENCES modePayements (id)
);

INSERT INTO modePayements (libelle) VALUES
('Espece'),
('MVola'),
('Orange Money'),
('Airtel Money');

INSERT INTO commandeDetails (idCommande, idPlat, quantite) VALUES
(3, 3, 2),
(3, 7, 2),
(4, 5, 2),
(4, 6, 1),
(5, 4, 1),
(6, 1, 1);

INSERT INTO commandePayements (idCommande, idModePayement, montantPaye) VALUES
(1, 1, 10000),
(1, 2, 5000),
(2, 3, 6000),
(3, 1, 10000),
(3, 4, 8000),
(4, 2, 13000),
(5, 1, 2000);