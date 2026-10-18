CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255)
);

ALTER TABLE commandes ADD COLUMN idClient INT;
ALTER TABLE commandes ADD CONSTRAINT fk_commande_client FOREIGN KEY (idClient) REFERENCES clients(id);

INSERT INTO clients (nom) VALUES
('Client1'),
('Client2');

INSERT INTO commandes (daty, idClient) VALUES
('2026-10-13', 1),
('2026-10-14', 2);