CREATE TABLE plats (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(255),
    prix INT
);

INSERT INTO plats (libelle, prix) VALUES 
('Romazava', 7000),
('Ravitoto sy henakisoa', 8000),
('Akoho sy voanio', 8500),
('Mi sao', 6000),
('Soupe chinoise', 6000),
('Mofo gasy (les 4)', 1000),
($$Ranon'ampango$$, 500);