CREATE TABLE serveurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255)
);

CREATE TABLE tables (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(255)
);

ALTER TABLE commandes ADD COLUMN idServeur INT;
ALTER TABLE commandes ADD COLUMN idTable INT;
ALTER TABLE commandes ADD CONSTRAINT fk_commande_serveur FOREIGN KEY (idServeur) REFERENCES serveurs(id);
ALTER TABLE commandes ADD CONSTRAINT fk_commande_table FOREIGN KEY (idTable) REFERENCES tables(id);

INSERT INTO serveurs (nom) VALUES
('Njaka Rakoto'),
('Lalao Rasoa');

INSERT INTO tables (libelle) VALUES
('Table 1'),
('Table 2'),
('Table 3'),
('Table 4'),
('Table 5'),
('Table 6'),
('Table 7'),
('Table 8');

UPDATE commandes SET idclient = 1, idserveur = 1, idtable = 1 WHERE id = 1;
UPDATE commandes SET idclient = 2, idserveur = 2, idtable = 2 WHERE id = 2;
UPDATE commandes SET idclient = 1, idserveur = 1, idtable = 3 WHERE id = 3;
UPDATE commandes SET idclient = 2, idserveur = 2, idtable = 4 WHERE id = 4;
UPDATE commandes SET idclient = 1, idserveur = 2, idtable = 5 WHERE id = 5;
UPDATE commandes SET idclient = 2, idserveur = 1, idtable = 6 WHERE id = 6;