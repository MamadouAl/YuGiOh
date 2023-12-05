-- fichier de mis à jour

--Crée une nouvelle édition 'Edition Collectors' et y regroupe toutes les éditions qui ont une rareté 'Collectors Rare'
INSERT INTO p12_edition (nom_edition, date_edition) VALUES('Edition Collectors', '2023-07-01');

UPDATE p12_carteedition
SET num_edition = (SELECT num_edition FROM p12_edition WHERE nom_edition ='Edition Collectors')
WHERE carte_rarete = 'Collectors Rare';
