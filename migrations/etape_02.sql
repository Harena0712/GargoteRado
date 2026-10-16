CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(255)
);

INSERT INTO categories (libelle) VALUES 
('Plats malagasy'),
('Plats chinois'),
('Soupes'),
('Desserts'),
('Boissons');

ALTER TABLE plats ADD COLUMN idCategorie INT NOT NULL DEFAULT 1;

ALTER TABLE plats ADD CONSTRAINT fk_plats_categorie FOREIGN KEY (idCategorie) REFERENCES categories(id);

UPDATE plats SET idCategorie = 1 WHERE libelle IN ('Romazava', 'Ravitoto sy henakisoa', 'Akoho sy voanio');
UPDATE plats SET idCategorie = 2 WHERE libelle = 'Mi sao';
UPDATE plats SET idCategorie = 3 WHERE libelle = 'Soupe chinoise';
UPDATE plats SET idCategorie = 4 WHERE libelle = 'Mofo gasy (les 4)';
UPDATE plats SET idCategorie = 5 WHERE id = 7;

-- Verification 
SELECT c.libelle AS categorie, COUNT(p.libelle) AS nbPlats FROM plats p JOIN categories c ON c.id = p.idCategorie GROUP BY c.libelle;