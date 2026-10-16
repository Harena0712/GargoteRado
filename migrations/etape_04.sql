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
-- Verification

SELECT c.id AS commande, c.daty,
CASE 
    WHEN c.idClient ISNULL THEN 'Client de passage'
    ELSE cl.nom
END 
AS client
FROM commandes c LEFT JOIN clients cl
ON c.idClient = cl.id;