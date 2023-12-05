/*
    Auteur : 	Groupe P12
    Description : 	Script de creation de la base de donnees YuGiOh oracle
 */

/*
-- Suppression des tables au besoin car Oracle ne permet pas de mettre IF EXISTS
drop table P12_CARTEEDITION;
drop table P12_CARTEPOSSEDEE;
drop table P12_edition;
drop table P12_CARTE;
drop table P12_langue;
drop table P12_RELATION;
drop sequence seq;
*/



--CREATION DES TABLES YUGIOH !!

CREATE SEQUENCE seq;


CREATE TABLE P12_edition (
   num_edition INTEGER DEFAULT seq.nextval PRIMARY KEY,
   nom_edition VARCHAR(255) NOT NULL,
   date_edition DATE NOT NULL
);

CREATE TABLE P12_carte (
    num_carte INTEGER DEFAULT seq.nextval PRIMARY KEY,
    carte_nom VARCHAR(255) NOT NULL,
    carte_categorie VARCHAR(10) NOT NULL,
    carte_attribut VARCHAR(30),
    carte_niveau INTEGER,
    carte_image VARCHAR(255) NOT NULL,
    carte_type VARCHAR(30),
    carte_specificite VARCHAR(30),
    carteATK INTEGER,
    carteDEF INTEGER,
    carte_description VARCHAR2(2000),
    CONSTRAINT a CHECK ( carte_categorie IN ('Monstre','Magie','Piège'))
);

CREATE TABLE P12_langue (
    num_langue INTEGER DEFAULT seq.nextval PRIMARY KEY,
    nom_langue VARCHAR(30) NOT NULL
);

CREATE TABLE P12_carteEdition (
    num_carte INTEGER,
    num_edition INTEGER,
    carte_rarete VARCHAR(255),
    PRIMARY KEY (num_carte, num_edition, carte_rarete),
    FOREIGN KEY (num_carte) REFERENCES P12_carte (num_carte),
    FOREIGN KEY (num_edition) REFERENCES P12_edition (num_edition)
);

 CREATE TABLE P12_cartePossedee (
    num_carte INTEGER,
    num_edition INTEGER,
    num_langue INTEGER,
    quantite INTEGER,
    PRIMARY KEY (num_carte, num_edition, num_langue),
    FOREIGN KEY (num_carte) REFERENCES P12_carte (num_carte),
    FOREIGN KEY (num_edition) REFERENCES P12_edition (num_edition),
    FOREIGN KEY (num_langue) REFERENCES P12_langue (num_langue)
);

CREATE TABLE P12_relation (
    num_carte INTEGER DEFAULT seq.nextval PRIMARY KEY,
    carte_nom VARCHAR(255),
    carte_categorie VARCHAR(10),
    carte_attribut VARCHAR(30),
    carte_niveau INTEGER,
    carte_description VARCHAR2(2000),
    carte_image VARCHAR(255),
    carte_type VARCHAR(30),
    carte_specificite VARCHAR(30),
    carteATK INTEGER,
    carteDEF INTEGER,
    nom_edition VARCHAR(255),
    date_edition DATE,
    carte_rarete VARCHAR(255)
);

--Insersion de la table intermediaire ou relation

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Magicien Sombre le Chevalier de la Magie du Dragon', 'Monstre', 'ténèbres', 8, '\"Magicien Sombre\" + 1 monstre Dragon ou Guerrier de min. Niveau 7-----Si votre monstre attaque un monstre en Position de Défense, infligez des dommages de combat perçants à votre adversaire. Une fois par tour, lorsque votre monstre détruit un monstre de l''adversaire au combat : vous pouvez infliger des dommages à votre adversaire égaux à l''ATK d''origine du monstre détruit. Si cette carte est détruite : vous pouvez Invoquer Spécialement 1 \"Magicien Sombre\" ainsi qu''1 \"Gaïa le Dragon Champion\" depuis votre main, Deck, Extra Deck et/ou Cimetière.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-1.jpg', 'DRAGON', 'FUSION', 2900, 2400, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Magicien Sombre le Chevalier de la Magie du Dragon', 'Monstre', 'ténèbres', 8, '\"Magicien Sombre\" + 1 monstre Dragon ou Guerrier de min. Niveau 7-----Si votre monstre attaque un monstre en Position de Défense, infligez des dommages de combat perçants à votre adversaire. Une fois par tour, lorsque votre monstre détruit un monstre de l''adversaire au combat : vous pouvez infliger des dommages à votre adversaire égaux à l''ATK d''origine du monstre détruit. Si cette carte est détruite : vous pouvez Invoquer Spécialement 1 \"Magicien Sombre\" ainsi qu''1 \"Gaïa le Dragon Champion\" depuis votre main, Deck, Extra Deck et/ou Cimetière.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-1q.jpg', 'DRAGON', 'FUSION', 2900, 2400, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Néos Armé', 'Monstre', 'vent', 10, '\"Néos, HÉROS Élémentaire\" + 1 monstre \"Dragon Armé\"-----Uniquement Invocable par Fusion. Si cette carte est Invoquée Spécialement : vous pouvez choisir 1 monstre Dragon dans votre Cimetière, et détruisez tous les monstres contrôlés par votre adversaire d''un Niveau inférieur ou égal. Lorsque cette carte détruit un monstre au combat : vous pouvez faire gagner à cette carte l''effet suivant.-----●Durant la Main Phase (Effet Rapide) : vous pouvez Sacrifier cette carte \; Invoquez Spécialement 1 Monstre Fusion \"HÉROS Élémentaire\" depuis votre Extra Deck, en ignorant ses conditions d''Invocation.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-2.jpg', 'GUERRIER', 'FUSION', 3500, 3000, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Néos Armé', 'Monstre', 'vent', 10, '\"Néos, HÉROS Élémentaire\" + 1 monstre \"Dragon Armé\"-----Uniquement Invocable par Fusion. Si cette carte est Invoquée Spécialement : vous pouvez choisir 1 monstre Dragon dans votre Cimetière, et détruisez tous les monstres contrôlés par votre adversaire d''un Niveau inférieur ou égal. Lorsque cette carte détruit un monstre au combat : vous pouvez faire gagner à cette carte l''effet suivant.-----●Durant la Main Phase (Effet Rapide) : vous pouvez Sacrifier cette carte \; Invoquez Spécialement 1 Monstre Fusion \"HÉROS Élémentaire\" depuis votre Extra Deck, en ignorant ses conditions d''Invocation.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-2q.jpg', 'GUERRIER', 'FUSION', 3500, 3000, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Assaut Synchronique', 'Monstre', 'ténèbres', 2, 'Durant votre Main Phase : vous pouvez Invoquer Spécialement cette carte depuis votre main, puis recevez 700 points de dommages, et aussi, tant qu''elle est face recto dans la Zone Monstre, vous ne pouvez pas Invoquer Spécialement depuis l''Extra Deck (Monstres Synchro exclus). Si un ou plusieurs Monstres Synchro Dragon face recto que vous contrôlez sont Sacrifiés ou bannis (sauf durant la Damage Step) : vous pouvez bannir cette carte depuis votre Cimetière, puis ciblez 1 de ces monstres \; Invoquez-le Spécialement. Vous ne pouvez utiliser chaque effet de \"Assaut Synchronique\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-3.jpg', 'MACHINE', 'SYNTONISEUR', 700, 0, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Assaut Synchronique', 'Monstre', 'ténèbres', 2, 'Durant votre Main Phase : vous pouvez Invoquer Spécialement cette carte depuis votre main, puis recevez 700 points de dommages, et aussi, tant qu''elle est face recto dans la Zone Monstre, vous ne pouvez pas Invoquer Spécialement depuis l''Extra Deck (Monstres Synchro exclus). Si un ou plusieurs Monstres Synchro Dragon face recto que vous contrôlez sont Sacrifiés ou bannis (sauf durant la Damage Step) : vous pouvez bannir cette carte depuis votre Cimetière, puis ciblez 1 de ces monstres \; Invoquez-le Spécialement. Vous ne pouvez utiliser chaque effet de \"Assaut Synchronique\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-3q.jpg', 'MACHINE', 'SYNTONISEUR', 700, 0, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dernier Espoir des Numéros', 'Magie', '(Cette carte est toujours traitée comme une carte \"Yeux Galactiques\".)-----Payez la moitié de vos LP, puis ciblez 2 monstres dans votre Cimetière \; Invoquez-les Spécialement tous les deux, mais annulez leurs effets, puis, immédiatement après la résolution de cet effet, Invoquez par Xyz 1 Monstre Xyz \"Numéro\" en utilisant uniquement ces 2 monstres, et aussi, le reste de ce tour après la résolution de cette carte, vous ne pouvez Invoquer Spécialement qu''une fois de plus depuis l''Extra Deck. Vous ne pouvez activer qu''1 \"Dernier Espoir des Numéros\" par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-4.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dragon Xyz de la Rébellion aux Yeux Impairs', 'Monstre', 'ténèbres', 7, '[Effet Pendule]-----Durant votre Main Phase : vous pouvez Invoquer Spécialement cette carte, puis vous pouvez attacher 1 monstre TÉNÈBRES depuis votre Cimetière à cette carte comme Matériel. Vous ne pouvez utiliser cet effet de \"Dragon Xyz de la Rébellion aux Yeux Impairs\" qu''une fois par tour.----------[Effet de Monstre]-----2 Monstres Pendule de Niveau 7-----Si vous pouvez effectuer une Invocation Pendule de Niveau 7, vous pouvez Invoquer par Pendulation cette carte face recto depuis votre Extra Deck. Cette carte ne peut pas être utilisée comme Matériel pour une Invocation Xyz le tour où elle a été Invoquée par Xyz. Vous pouvez détacher 1 Matériel de cette carte, puis ciblez max. 2 monstres contrôlés par votre adversaire avec max. 3000 ATK \; détruisez-les. Vous ne pouvez utiliser cet effet de \"Dragon Xyz de la Rébellion aux Yeux Impairs\" qu''une fois par tour. Si cette carte dans la Zone Monstre est détruite : vous pouvez placer cette carte dans votre Zone Pendule.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-5.jpg', 'DRAGON', 'XYZ', 3000, 2500, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Codeur Rokkette', 'Monstre', 'ténèbres', 4, 'Si cette carte va être utilisée pour l''Invocation Lien d''un monstre \"Borrelle\", vous pouvez traiter cette carte comme Dragon. Vous ne pouvez utiliser chacun des effets suivants de \"Codeur Rokkette\" qu''une fois par tour. Si un monstre Cyberse que vous contrôlez va être utilisé comme Matériel Lien pour un monstre \"Codeur Bavard\", cette carte dans votre main peut aussi être utilisée comme Matériel. Si cette carte que vous contrôlez va être utilisée comme Matériel Lien pour un monstre \"Borrelle\", 1 monstre TÉNÈBRES dans votre main peut aussi être utilisé comme Matériel.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-6.jpg', 'CYBERSE', 'EFFET', 1700, 300, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Hydre Extox', 'Monstre', 'eau', 4, '2+ monstres que vous contrôlez, Invoqués Spécialement depuis l''Extra Deck-----Les monstres contrôlés par votre adversaire du même type de carte (Fusion, Synchro, Xyz, Pendule ou Lien) que les Matériels utilisés pour l''Invocation Fusion de cette carte perdent une ATK égale à leur propre ATK d''origine. Lorsque cette carte inflige min. 1000 points dommages de combat à votre adversaire : vous pouvez piocher 1 carte pour chaque 1000 points de dommages que vous avez infligés.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-7.jpg', 'REPTILE', 'FUSION', 2000, 2000, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Hydre Extox', 'Monstre', 'eau', 4, '2+ monstres que vous contrôlez, Invoqués Spécialement depuis l''Extra Deck-----Les monstres contrôlés par votre adversaire du même type de carte (Fusion, Synchro, Xyz, Pendule ou Lien) que les Matériels utilisés pour l''Invocation Fusion de cette carte perdent une ATK égale à leur propre ATK d''origine. Lorsque cette carte inflige min. 1000 points dommages de combat à votre adversaire : vous pouvez piocher 1 carte pour chaque 1000 points de dommages que vous avez infligés.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-7q.jpg', 'REPTILE', 'FUSION', 2000, 2000, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Maître Tri-Pointe', 'Monstre', 'lumière', 6, '1 Syntoniseur + 1+ monstre non-Syntoniseur-----Si cette carte est Invoquée par Synchronisation : vous pouvez appliquer l''effet approprié selon les Niveaux utilisés pour son Invocation Synchro, ou si vous avez utilisé min. 3 monstres comme Matériels, appliquez tous ces effets dans l''ordre.-----●1 et 5 : Détruisez 1 autre carte sur le Terrain.-----●2 et 4 : Piochez 1 carte.-----●3 et 3 : Traitez cette carte comme un Syntoniseur.-----Vous ne pouvez utiliser cet effet de \"Maître Tri-Pointe\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-8.jpg', 'GUERRIER', 'SYNCHRO', 2100, 1800, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Maître Tri-Pointe', 'Monstre', 'lumière', 6, '1 Syntoniseur + 1+ monstre non-Syntoniseur-----Si cette carte est Invoquée par Synchronisation : vous pouvez appliquer l''effet approprié selon les Niveaux utilisés pour son Invocation Synchro, ou si vous avez utilisé min. 3 monstres comme Matériels, appliquez tous ces effets dans l''ordre.-----●1 et 5 : Détruisez 1 autre carte sur le Terrain.-----●2 et 4 : Piochez 1 carte.-----●3 et 3 : Traitez cette carte comme un Syntoniseur.-----Vous ne pouvez utiliser cet effet de \"Maître Tri-Pointe\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-8q.jpg', 'GUERRIER', 'SYNCHRO', 2100, 1800, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Daidaratant le Géant Visqueux', 'Monstre', 'eau', 4, '[Effet Pendule]-----Vous pouvez cibler 1 Monstre Xyz que vous contrôlez \; attachez-lui cette carte comme Matériel. Vous ne pouvez utiliser cet effet de \"Daidaratant le Géant Visqueux\" qu''une fois par tour.----------[Effet de Monstre]-----2 monstres de Niveau 4-----Si vous pouvez effectuer une Invocation Pendule de Niveau 4, vous pouvez Invoquer par Pendulation cette carte face recto depuis votre Extra Deck. Vous pouvez détacher 1 Matériel de cette carte \; placez cette carte dans votre Zone Pendule, puis vous pouvez ajouter face recto 1 Monstre Pendule depuis votre Cimetière à l''Extra Deck. Si cette carte dans la Zone Monstre est détruite au combat ou par un effet de carte : vous pouvez placer cette carte dans votre Zone Pendule. Vous ne pouvez utiliser chaque effet de \"Daidaratant le Géant Visqueux\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-9.jpg', 'ZOMBIE', 'XYZ', 2400, 400, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ne Lâchez Pas, les Chiens de Guerre', 'Magie', 'Lorsque l''un des joueurs pioche un ou plusieurs Syntoniseurs pour sa pioche normale durant sa Draw Phase : il peut révéler ces cartes \; il pioche 2 cartes. Si votre adversaire pioche par cet effet : vous perdez 2000 LP, et si vous le faites, envoyez cette carte au Cimetière.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-10.jpg', 'TERRAIN', 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Arc-en-Cielution RVB', 'Piège', 'Une fois par tour : vous pouvez cibler 1 monstre face recto sur le Terrain \; son Type est changé en Machine, et aussi, il gagne les Attributs LUMIÈRE/TÉNÈBRES/TERRE/EAU/FEU/VENT (même si cette carte quitte le Terrain).', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-11.jpg', 'CONTINU', 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Homme-Oiseau de Feu, HÉROS Élémentaire - Rage Infernale', 'Monstre', 'vent', 8, '2 monstres \"HÉROS Élémentaire\" d''Attributs différents-----Uniquement Invocable par Fusion. Si cette carte est Invoquée Spécialement : vous pouvez ajouter 1 carte avec \"Favori\" dans son nom depuis votre Deck ou Cimetière à votre main. Vous pouvez Sacrifier cette carte qui a été Invoquée par Fusion en utilisant un ou plusieurs Monstres Normaux comme Matériel \; Invoquez Spécialement 1 monstre \"HÉROS Élémentaire\" de max. Niveau 7 depuis votre Deck ou Extra Deck qui ne peut pas être Invoqué/Posé Normalement, en ignorant ses conditions d''Invocation. Vous ne pouvez utiliser chaque effet de \"Homme-Oiseau de Feu, HÉROS Élémentaire - Rage Infernale\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-12.jpg', 'GUERRIER', 'FUSION', 2100, 1200, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Décodeur Lien', 'Monstre', 'ténèbres', 0, '1 monstre Cyberse de max. Niveau 4-----Si cette carte est envoyée au Cimetière comme Matériel pour un Monstre Lien Cyberse avec min. 2300 ATK d''origine : vous pouvez Invoquer Spécialement cette carte, mais bannissez-la lorsqu''elle quitte le Terrain. Vous ne pouvez utiliser cet effet de \"Décodeur Lien\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-13.jpg', 'CYBERSE', 'LIEN', 300, 0, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Courageuse Chevaleresse Cramoisie Bradamante', 'Monstre', 'feu', 1, '(Cette carte est toujours traitée comme une carte \"Chevalier Noble Inferno\".)-----Vous pouvez défausser cette carte, puis ciblez 1 monstre Guerrier que vous contrôlez \; équipez-le avec 1 Magie d''Équipement depuis votre Deck qui peut l''équiper. Lorsque cette carte, non équipée avec une Carte d''Équipement, est détruite au combat avec un monstre de l''adversaire et envoyée au Cimetière : vous pouvez Invoquer Spécialement cette carte, et si vous le faites, équipez le monstre contrôlé par votre adversaire à cette carte. Vous ne pouvez utiliser chaque effet de \"Courageuse Chevaleresse Cramoisie Bradamante\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-14.jpg', 'GUERRIER', 'SYNTONISEUR', 500, 200, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Pion des Poupées', 'Monstre', 'terre', 3, 'Cette carte peut attaquer directement. Vous ne pouvez utiliser chacun des effets suivants de \"Pion des Poupées\" qu''une fois par tour. Lorsque cette carte inflige des dommages de combat à votre adversaire : vous pouvez ajouter 1 \"Promotion\" depuis votre Deck à votre main. Vous pouvez bannir cette carte depuis votre Cimetière \; ajoutez 1 monstre TERRE Guerrier (\"Pion des Poupées\" exclu) depuis votre Deck à votre main, puis votre adversaire peut ajouter 1 monstre depuis son Deck à sa main.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-15.jpg', 'GUERRIER', 'EFFET', 800, 1200, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Tour des Poupées', 'Monstre', 'terre', 4, 'Lorsque cette carte est Invoquée Normalement : vous pouvez changer cette carte en Position de Défense, et si vous le faites, envoyez 1 monstre TERRE Guerrier depuis votre Deck à votre Cimetière. Les monstres contrôlés par votre adversaire qui peuvent attaquer doivent attaquer cette carte. Une fois par tour, lorsque cette carte est ciblée par une attaque : vous pouvez cibler 1 monstre TERRE Guerrier de min. Niveau 6 dans votre Cimetière \; envoyez cette carte depuis le Terrain au Cimetière, et si vous le faites, Invoquez Spécialement le monstre, puis transférez-lui la cible de l''attaque.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-16.jpg', 'GUERRIER', 'EFFET', 1200, 1800, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Promotion', 'Magie', 'Ciblez 1 monstre TERRE Guerrier de max. Niveau 3 que vous contrôlez \; envoyez-le au Cimetière, et si vous le faites, Invoquez Spécialement 1 monstre TERRE Guerrier de min. Niveau 4 depuis votre Deck, puis, si vous contrôlez un monstre \"Poupée\" qui était TERRE Guerrier à l''origine, le monstre Invoqué Spécialement gagne une ATK/DEF égales au nombre de cartes actuellement dans le Cimetière de votre adversaire x 100. Vous ne pouvez activer qu''1 \"Promotion\" par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-17.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Tragédie de Champ de Bataille', 'Magie', 'Durant votre Main Phase 2, si aucun des monstres ne se sont combattus ce tour : vous pouvez défausser 1 carte \; Posez 1 \"Tragédie de Champ de Bataille\" directement depuis votre Deck dans votre Zone Magie & Piège. Vous ne pouvez utiliser cet effet de \"Tragédie de Champ de Bataille\" qu''une fois par tour. Une fois par tour, durant la End Phase, si des monstres se sont combattus ce tour : le joueur du tour envoie 5 cartes du dessus de son Deck au Cimetière.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-18.jpg', 'CONTINU', 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Black Mamba', 'Monstre', 'ténèbres', 3, 'Si vous contrôlez un monstre Reptile, vous pouvez Invoquer Spécialement cette carte (depuis votre main). Vous ne pouvez Invoquer Spécialement \"Black Mamba\" qu''une fois par tour de cette façon. Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez cibler 1 monstre contrôlé par votre adversaire \; envoyez 1 monstre Reptile depuis votre Deck au Cimetière, et si vous le faites, changez la position de combat du monstre ciblé. Vous ne pouvez utiliser cet effet de \"Black Mamba\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-19.jpg', 'REPTILE', 'EFFET', 1300, 1000, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Urubonus, l''Incarnation de la Rancune', 'Monstre', 'ténèbres', 5, 'Les monstres contrôlés par votre adversaire perdent 300 ATK/DEF. Vous ne pouvez utiliser chacun des effets suivants de \"Urubonus, l''Incarnation de la Rancune\" qu''une fois par tour. Vous pouvez Sacrifier 1 monstre Reptile \; Invoquez Spécialement cette carte depuis votre main. Vous pouvez Sacrifier 1 monstre \; jusqu''à la fin de ce tour, tous les monstres actuellement contrôlés par votre adversaire perdent une ATK/DEF égales à l''ATK d''origine du monstre Sacrifié.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLMR/BLMR-20.jpg', 'REPTILE', 'EFFET', 2000, 800, 'Batailles de Légende : La Vengeance Monstrueuse', TO_DATE('2023-06-22', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Xéno Météoraure', 'Monstre', 'feu', 6, 'Si une ou plusieurs cartes sont détruites au combat ou par un effet de carte : vous pouvez Invoquer Spécialement cette carte depuis votre main. Durant votre Main Phase : vous pouvez détruire 1 monstre Dinosaure dans votre main ou sur votre Terrain, puis Invoquez Spécialement 1 Monstre Normal Dinosaure depuis votre main ou Deck, et aussi, vous ne pouvez pas Invoquer Spécialement de monstres (monstres Dragon, Dinosaure, Serpent de Mer ou Wyrm exclus) depuis l''Extra Deck le reste de ce tour. Vous ne pouvez utiliser chaque effet de \"Xéno Météoraure\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-01.jpg', 'DINOSAURE', 'SYNTONISEUR', 2000, 200, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Xéno Météoraure', 'Monstre', 'feu', 6, 'Si une ou plusieurs cartes sont détruites au combat ou par un effet de carte : vous pouvez Invoquer Spécialement cette carte depuis votre main. Durant votre Main Phase : vous pouvez détruire 1 monstre Dinosaure dans votre main ou sur votre Terrain, puis Invoquez Spécialement 1 Monstre Normal Dinosaure depuis votre main ou Deck, et aussi, vous ne pouvez pas Invoquer Spécialement de monstres (monstres Dragon, Dinosaure, Serpent de Mer ou Wyrm exclus) depuis l''Extra Deck le reste de ce tour. Vous ne pouvez utiliser chaque effet de \"Xéno Météoraure\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-01c.jpg', 'DINOSAURE', 'SYNTONISEUR', 2000, 200, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Transcendosaure Météoraure', 'Monstre', 'feu', 12, 'Ni Invocable Normalement ni Posable Normalement. Uniquement Invocable Spécialement par un effet de carte. Durant le tour de votre adversaire (Effet Rapide) : vous pouvez détruire 2 autres monstres Dinosaure dans votre main et/ou sur votre Terrain, et si vous le faites, Invoquez Spécialement cette carte depuis votre main. Si cette carte est Invoquée Spécialement : vous pouvez envoyer 1 monstre Dinosaure depuis votre Deck au Cimetière. Si cette carte est détruite : vous pouvez mélanger 1 Monstre Normal depuis votre Cimetière dans le Deck, puis vous pouvez Invoquer Spécialement cette carte. Vous ne pouvez utiliser chaque effet de \"Transcendosaure Météoraure\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-02.jpg', 'DINOSAURE', 'EFFET', 3500, 700, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Transcendosaure Gigantozouleur', 'Monstre', 'terre', 12, '1 monstre Dinosaure + 1 Monstre Normal-----Si cette carte est Invoquée Spécialement : vous pouvez cibler 1 monstre Dinosaure dans votre Cimetière \; ajoutez-le à votre main, puis, si cette carte a été Invoquée Spécialement depuis le Cimetière, vous pouvez détruire 2 cartes (1 depuis votre main ou Terrain, et 1 contrôlée par votre adversaire). Si cette carte est détruite : vous pouvez mélanger 1 Monstre Normal depuis votre Cimetière dans le Deck, puis vous pouvez Invoquer Spécialement cette carte. Vous ne pouvez utiliser chaque effet de \"Transcendosaure Gigantozouleur\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-03.jpg', 'DINOSAURE', 'FUSION', 3800, 2000, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Transcendosaure Glaciosaure', 'Monstre', 'eau', 12, '1 Syntoniseur + 1+ monstre non-Syntoniseur-----Non destructible au combat. Les monstres Dinosaure que vous contrôlez qui ont été Invoqués Spécialement depuis le Cimetière ne peuvent pas être détruits par des effets de carte de votre adversaire, et aussi, votre adversaire ne peut pas les cibler avec des effets de carte. Si cette carte est détruite : vous pouvez mélanger 1 Monstre Normal depuis votre Cimetière dans le Deck, puis vous pouvez Invoquer Spécialement cette carte. Vous ne pouvez utiliser cet effet de \"Transcendosaure Glaciosaure\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-04.jpg', 'DINOSAURE', 'SYNCHRO', 3600, 2700, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Transcendosaure Percygnathus', 'Monstre', 'vent', 6, '2 monstres de Niveau 6-----Tant que cette carte n''a pas de Matériel, si elle combat un monstre, les dommages de combat qu''elle inflige à votre adversaire sont doublés. Vous ne pouvez utiliser chacun des effets suivants de \"Transcendosaure Percygnathus\" qu''une fois par tour. Vous pouvez détacher 1 Matériel de cette carte, puis ciblez 1 de vos monstres Dinosaure bannis \; Invoquez-le Spécialement. Si cette carte est détruite : vous pouvez mélanger 1 Monstre Normal depuis votre Cimetière dans le Deck, puis vous pouvez Invoquer Spécialement cette carte.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-05.jpg', 'DINOSAURE', 'XYZ', 3000, 2300, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Point Xéno', 'Magie', 'Ajoutez 1 Syntoniseur Dinosaure ou Monstre Normal Dinosaure depuis votre Deck à votre main, puis détruisez 1 carte dans votre main. Vous pouvez bannir cette carte depuis votre Cimetière \; Invoquez par Fusion 1 Monstre Fusion Dinosaure depuis votre Extra Deck, en utilisant des monstres depuis votre main ou Terrain comme Matériel. Vous ne pouvez utiliser chaque effet de \"Point Xéno\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-06.jpg', 'NORMAL', 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Super Envol', 'Piège', 'Ciblez 1 monstre Dinosaure qui est banni ou dans l''un des Cimetières \; Invoquez-le Spécialement sur votre Terrain. Vous ne pouvez activer qu''1 \"Super Envol\" par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-07.jpg', 'NORMAL', 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Givrosaure', 'Monstre', 'eau', 6, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-08.jpg', 'DINOSAURE', 'AUCUNE', 2600, 1700, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Tyranno Ultime-Conducteur', 'Monstre', 'lumière', 10, 'Ni Invocable Normalement ni Posable Normalement. Doit d''abord être Invoquée Spécialement (depuis votre main) en bannissant 2 monstres Dinosaure depuis votre Cimetière. Une fois par tour, durant la Main Phase (Effet Rapide) : vous pouvez détruire 1 monstre dans votre main ou sur votre Terrain, et si vous le faites, changez tous les monstres face recto contrôlés par votre adversaire en Position de Défense face verso. Cette carte peut attaquer une fois tous les monstres contrôlés par votre adversaire. Au début de la Damage Step, si cette carte attaque un monstre en Position de Défense : vous pouvez infliger 1000 points de dommages à votre adversaire, et si vous le faites, envoyez le monstre en Position de Défense au Cimetière.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-09.jpg', 'DINOSAURE', 'EFFET', 3500, 3200, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Tyranno Ultime-Conducteur', 'Monstre', 'lumière', 10, 'Ni Invocable Normalement ni Posable Normalement. Doit d''abord être Invoquée Spécialement (depuis votre main) en bannissant 2 monstres Dinosaure depuis votre Cimetière. Une fois par tour, durant la Main Phase (Effet Rapide) : vous pouvez détruire 1 monstre dans votre main ou sur votre Terrain, et si vous le faites, changez tous les monstres face recto contrôlés par votre adversaire en Position de Défense face verso. Cette carte peut attaquer une fois tous les monstres contrôlés par votre adversaire. Au début de la Damage Step, si cette carte attaque un monstre en Position de Défense : vous pouvez infliger 1000 points de dommages à votre adversaire, et si vous le faites, envoyez le monstre en Position de Défense au Cimetière.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-09c.jpg', 'DINOSAURE', 'EFFET', 3500, 3200, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Rex le Géant', 'Monstre', 'terre', 4, 'Ne peut pas attaquer directement. Si cette carte est bannie : vous pouvez Invoquer Spécialement cette carte, et si vous le faites, cette carte gagne 200 ATK pour chacun de vos monstres Dinosaure bannis. Vous ne pouvez utiliser cet effet de \"Rex le Géant\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-10.jpg', 'DINOSAURE', 'AUCUNE', 2000, 1200, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Divernosaure', 'Monstre', 'feu', 0, 'Durant la Main Phase (Effet Rapide) : vous pouvez envoyer cette carte depuis votre main au Cimetière \; durant cette Main Phase, les monstres Dinosaure que vous contrôlez ne sont pas affectés par les effets activés de votre adversaire. Vous pouvez bannir un nombre de votre choix de monstres Dinosaure (cette carte incluse) depuis votre Cimetière \; Invoquez Spécialement 1 monstre Dinosaure depuis votre Deck de Niveau égal au nombre total de monstres bannis pour activer cet effet, mais détruisez-le durant la End Phase. Vous ne pouvez utiliser cet effet de \"Divernosaure\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-11.jpg', 'DINOSAURE', 'EFFET', 1800, 1000, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Oviraptor Mange-Âme', 'Monstre', 'ténèbres', 4, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez prendre 1 monstre Dinosaure depuis votre Deck, et soit l''ajouter à votre main soit l''envoyer au Cimetière. Vous pouvez cibler 1 autre monstre Dinosaure de max. Niveau 4 sur le Terrain \; détruisez-le, puis Invoquez Spécialement 1 monstre Dinosaure depuis votre Cimetière en Position de Défense. Vous ne pouvez utiliser chaque effet de \"Oviraptor Mange-Âme\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-12.jpg', 'DINOSAURE', 'EFFET', 1800, 500, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Oviraptor Mange-Âme', 'Monstre', 'ténèbres', 4, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez prendre 1 monstre Dinosaure depuis votre Deck, et soit l''ajouter à votre main soit l''envoyer au Cimetière. Vous pouvez cibler 1 autre monstre Dinosaure de max. Niveau 4 sur le Terrain \; détruisez-le, puis Invoquez Spécialement 1 monstre Dinosaure depuis votre Cimetière en Position de Défense. Vous ne pouvez utiliser chaque effet de \"Oviraptor Mange-Âme\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-12c.jpg', 'DINOSAURE', 'EFFET', 1800, 500, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Bébécérasaure', 'Monstre', 'terre', 2, 'Si cette carte est détruite par un effet et envoyée au Cimetière, sélectionnez 1 monstre de Type Dinausaure de Niveau 4 ou moins de votre Deck et Invoquez-le par Invocation Spéciale sur votre Terrain.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-13.jpg', 'DINOSAURE', 'EFFET', 500, 500, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Petiteranodon', 'Monstre', 'terre', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-14.jpg', 'DINOSAURE', 'EFFET', 500, 500, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Évolzar Solda', 'Monstre', 'feu', 6, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-15.jpg', 'DRAGON', 'XYZ', 2600, 1000, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Âme du Vainqueur Razen', 'Monstre', 'feu', 4, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez ajouter 1 monstre \"Âme du Vainqueur\" non-Guerrier depuis votre Deck à votre main. (Effet Rapide) : vous pouvez activer 1 de ces effets, en révélant un ou plusieurs monstres dans votre main avec les Attributs listés \;-----●FEU : Ce tour, cette carte ne peut pas être détruite par des effets de carte.-----●FEU et TÉNÈBRES : Détruisez tous les autres monstres dans la colonne de cette carte.-----Vous ne pouvez utiliser chaque effet de \"Âme du Vainqueur Razen\" qu''une fois par tour, et ne pouvez en activer que max. 1 dans la même Chaîne.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-16.jpg', 'GUERRIER', 'EFFET', 1800, 1500, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Âme du Vainqueur Razen', 'Monstre', 'feu', 4, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez ajouter 1 monstre \"Âme du Vainqueur\" non-Guerrier depuis votre Deck à votre main. (Effet Rapide) : vous pouvez activer 1 de ces effets, en révélant un ou plusieurs monstres dans votre main avec les Attributs listés \;-----●FEU : Ce tour, cette carte ne peut pas être détruite par des effets de carte.-----●FEU et TÉNÈBRES : Détruisez tous les autres monstres dans la colonne de cette carte.-----Vous ne pouvez utiliser chaque effet de \"Âme du Vainqueur Razen\" qu''une fois par tour, et ne pouvez en activer que max. 1 dans la même Chaîne.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-16c.jpg', 'GUERRIER', 'EFFET', 1800, 1500, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Âme du Vainqueur Pantéra', 'Monstre', 'terre', 4, 'Si vous ne contrôlez aucun monstre dans votre Zone Monstre Main : vous pouvez Invoquer Spécialement cette carte depuis votre main. (Effet Rapide) : vous pouvez activer 1 de ces effets, en révélant un ou plusieurs monstres dans votre main avec les Attributs listés \;-----●TERRE : Ce tour, cette carte ne peut pas être détruite au combat.-----●TERRE et FEU : Détruisez tous les Magies/Pièges dans la colonne de cette carte.-----Vous ne pouvez utiliser chaque effet de \"Âme du Vainqueur Pantéra\" qu''une fois par tour, et ne pouvez en activer que max. 1 dans la même Chaîne.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-17.jpg', 'BÊTE-GUERRIER', 'EFFET', 1700, 1900, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Âme du Vainqueur Borger Lourd', 'Monstre', 'ténèbres', 7, 'Durant la Main Phase (Effet Rapide) : vous pouvez cibler 1 monstre \"Âme du Vainqueur\" non-Machine que vous contrôlez \; renvoyez-le à la main, et si vous le faites, Invoquez Spécialement cette carte depuis votre main. (Effet Rapide) : vous pouvez activer 1 de ces effets, en révélant un ou plusieurs monstres dans votre main avec les Attributs listés \;-----●TÉNÈBRES : Piochez 1 carte.-----●TERRE et FEU : Infligez 1500 points de dommages à votre adversaire.-----Vous ne pouvez utiliser chaque effet de \"Âme du Vainqueur Borger Lourd\" qu''une fois par tour, et ne pouvez en activer que max. 1 dans la même Chaîne.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-18.jpg', 'MACHINE', 'EFFET', 2500, 1500, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Âme du Vainqueur Borger Lourd', 'Monstre', 'ténèbres', 7, 'Durant la Main Phase (Effet Rapide) : vous pouvez cibler 1 monstre \"Âme du Vainqueur\" non-Machine que vous contrôlez \; renvoyez-le à la main, et si vous le faites, Invoquez Spécialement cette carte depuis votre main. (Effet Rapide) : vous pouvez activer 1 de ces effets, en révélant un ou plusieurs monstres dans votre main avec les Attributs listés \;-----●TÉNÈBRES : Piochez 1 carte.-----●TERRE et FEU : Infligez 1500 points de dommages à votre adversaire.-----Vous ne pouvez utiliser chaque effet de \"Âme du Vainqueur Borger Lourd\" qu''une fois par tour, et ne pouvez en activer que max. 1 dans la même Chaîne.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-18c.jpg', 'MACHINE', 'EFFET', 2500, 1500, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Âme du Vainqueur Dr Amour Fou', 'Monstre', 'ténèbres', 4, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez ajouter 1 Magie/Piège \"Âme du Vainqueur\" depuis votre Deck à votre main. (Effet Rapide) : vous pouvez activer 1 de ces effets, en révélant un ou plusieurs monstres dans votre main avec les Attributs listés \;-----●TÉNÈBRES : 1 monstre face recto contrôlé par votre adversaire perd 500 ATK/DEF.-----●TÉNÈBRES et TERRE : Renvoyez le monstre avec la plus faible DEF sur le Terrain à la main (en cas d''égalité, vous choisissez).-----Vous ne pouvez utiliser chaque effet de \"Âme du Vainqueur Dr Amour Fou\" qu''une fois par tour, et ne pouvez en activer que max. 1 dans la même Chaîne.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-19.jpg', 'DÉMON', 'EFFET', 1200, 2000, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Âme du Vainqueur Dr Amour Fou', 'Monstre', 'ténèbres', 4, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez ajouter 1 Magie/Piège \"Âme du Vainqueur\" depuis votre Deck à votre main. (Effet Rapide) : vous pouvez activer 1 de ces effets, en révélant un ou plusieurs monstres dans votre main avec les Attributs listés \;-----●TÉNÈBRES : 1 monstre face recto contrôlé par votre adversaire perd 500 ATK/DEF.-----●TÉNÈBRES et TERRE : Renvoyez le monstre avec la plus faible DEF sur le Terrain à la main (en cas d''égalité, vous choisissez).-----Vous ne pouvez utiliser chaque effet de \"Âme du Vainqueur Dr Amour Fou\" qu''une fois par tour, et ne pouvez en activer que max. 1 dans la même Chaîne.', 'https://www.otk-expert.fr/cartes/yugioh_ext/WISU/WISU-19c.jpg', 'DÉMON', 'EFFET', 1200, 2000, 'Survivants Sauvages', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Char Lourd du Labyrinthe', 'Monstre', 'ténèbres', 7, 'Vous pouvez Invoquer Normalement cette carte sans Sacrifices. Ne peut pas attaquer le tour où elle est Invoquée Normalement. Durant votre Main Phase : vous pouvez placer 1 de vos \"Sanga du Tonnerre\", \"Kazejin\" ou \"Suijin\" qui est banni, ou dans votre main ou Deck, face recto dans votre Zone Magie & Piège comme Magie Continue, puis, si vous contrôlez une carte \"Mur du Labyrinthe\", vous pouvez détruire 1 monstre contrôlé par votre adversaire. Vous ne pouvez utiliser cet effet de \"Char Lourd du Labyrinthe\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-1.jpg', 'MACHINE', 'EFFET', 2400, 2400, 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Goule d''Ombre du Labyrinthe', 'Monstre', 'ténèbres', 5, 'Vous pouvez défausser cette carte \; ajoutez 1 carte \"Mur du Labyrinthe\" depuis votre Deck à votre main. Au début de la Damage Step, si un monstre de votre adversaire combat, tant que vous contrôlez une carte \"Mur du Labyrinthe\" : vous pouvez bannir cette carte depuis votre Cimetière \; détruisez le monstre de l''adversaire. Vous ne pouvez utiliser chaque effet de \"Goule d''Ombre du Labyrinthe\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-2.jpg', 'ZOMBIE', 'EFFET', 1600, 1300, 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Association du Gardien de la Porte', 'Monstre', 'ténèbres', 12, '\"Sanga du Tonnerre\" + \"Kazejin\" + \"Suijin\"-----Uniquement Invocable Spécialement (depuis votre Extra Deck) en bannissant les cartes ci-dessus depuis votre main, Terrain et/ou Cimetière. Lorsque votre adversaire active une carte ou un effet qui cible une ou plusieurs cartes que vous contrôlez (Effet Rapide) : vous pouvez annuler l''effet, et si vous le faites, détruisez la carte. Vous ne pouvez utiliser cet effet de \"Association du Gardien de la Porte\" que trois fois par tour. Si cette carte face recto Invoquée Spécialement contrôlée par son propriétaire quitte le Terrain à cause d''une carte de l''adversaire : vous pouvez Invoquer Spécialement 1 monstre \"Gardien de la Porte\" de max. Niveau 11 depuis votre Deck ou Extra Deck, en ignorant ses conditions d''Invocation.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-3.jpg', 'GUERRIER', 'FUSION', 3750, 3400, 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gardien de la Porte du Tonnerre et du Vent', 'Monstre', 'lumière', 9, '\"Sanga du Tonnerre\" + \"Kazejin\"-----Uniquement Invocable Spécialement (depuis votre Extra Deck) en bannissant les cartes ci-dessus que vous contrôlez. Durant votre Main Phase : vous pouvez ajouter 1 Magie/Piège depuis votre Deck à votre main qui mentionne \"Sanga du Tonnerre\", \"Kazejin\" ET \"Suijin\". Vous ne pouvez utiliser cet effet de \"Gardien de la Porte du Tonnerre et du Vent\" qu''une fois par tour. Si cette carte face recto Invoquée Spécialement contrôlée par son propriétaire quitte le Terrain à cause d''une carte de l''adversaire : vous pouvez Invoquer Spécialement 1 de vos \"Sanga du Tonnerre\" ou \"Kazejin\" bannis.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-4.jpg', 'TONNERRE', 'FUSION', 2500, 2200, 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gardien de la Porte du Vent et de l''Eau', 'Monstre', 'vent', 9, '\"Kazejin\" + \"Suijin\"-----Uniquement Invocable Spécialement (depuis votre Extra Deck) en bannissant les cartes ci-dessus que vous contrôlez. Une fois par Chaîne, lorsque votre adversaire active une Carte Magie/Piège ou effet de Magie/Piège sur le Terrain (Effet Rapide) : vous pouvez annuler l''effet. Vous ne pouvez utiliser cet effet de \"Gardien de la Porte du Vent et de l''Eau\" que deux fois par tour. Si cette carte face recto Invoquée Spécialement contrôlée par son propriétaire quitte le Terrain à cause d''une carte de l''adversaire : vous pouvez Invoquer Spécialement 1 de vos \"Kazejin\" ou \"Suijin\" bannis.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-5.jpg', 'MAGICIEN', 'FUSION', 2450, 2300, 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gardien de la Porte de l''Eau et du Tonnerre', 'Monstre', 'eau', 9, '\"Suijin\" + \"Sanga du Tonnerre\"-----Uniquement Invocable Spécialement (depuis votre Extra Deck) en bannissant les cartes ci-dessus que vous contrôlez. Une fois par Chaîne (Effet Rapide) : vous pouvez cibler 1 monstre face recto contrôlé par votre adversaire \; jusqu''à la fin de ce tour, changez son ATK à 0. Vous ne pouvez utiliser cet effet de \"Gardien de la Porte de l''Eau et du Tonnerre\" que deux fois par tour. Si cette carte face recto Invoquée Spécialement contrôlée par son propriétaire quitte le Terrain à cause d''une carte de l''adversaire : vous pouvez Invoquer Spécialement 1 de vos \"Suijin\" ou \"Sanga du Tonnerre\" bannis.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-6.jpg', 'AQUA', 'FUSION', 2550, 2300, 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ombre du Mur du Labyrinthe', 'Magie', 'Les monstres (monstres dont le Niveau d''origine est min. 5 exclus) ne peuvent pas attaquer le tour où ils sont Invoqués. Une fois par tour, durant votre Main Phase : vous pouvez placer 1 de vos \"Sanga du Tonnerre\", \"Kazejin\" ou \"Suijin\" qui est banni, ou dans votre main ou Deck, face recto dans votre Zone Magie & Piège comme Magie Continue. Au début de la Battle Phase de votre adversaire : vous pouvez cibler 1 monstre contrôlé par votre adversaire avec moins de 1600 ATK \; détruisez-le.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-7.jpg', 'TERRAIN', 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Double Attaque ! Vent et Tonnerre !', 'Magie', 'Si vous contrôlez un monstre \"Gardien de la Porte\" : ciblez 1 carte sur le Terrain \; détruisez-la. Durant votre Main Phase : vous pouvez bannir cette carte depuis votre Cimetière \; ajoutez 1 de vos \"Sanga du Tonnerre\", \"Kazejin\" ou \"Suijin\" bannis ou dans votre Deck à votre main. Vous ne pouvez utiliser cet effet de \"Double Attaque ! Vent et Tonnerre !\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-8.jpg', 'JEU RAPIDE', 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gardien Riryoku', 'Magie', 'Si vos LP sont inférieurs à ceux de votre adversaire : ciblez 1 monstre que vous contrôlez avec \"Gardien de la Porte\" dans son nom d''origine \; divisez par deux les LP de votre adversaire, puis le monstre gagne une ATK égale aux LP de votre adversaire. Vous pouvez bannir cette carte depuis votre Cimetière \; ajoutez 1 de vos \"Sanga du Tonnerre\", \"Kazejin\" ou \"Suijin\" bannis ou dans votre Deck à votre main. Vous ne pouvez utiliser chaque effet de \"Gardien Riryoku\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-9.jpg', 'NORMAL', 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Proie de Jirai Gumo', 'Piège', 'Invoquez Spécialement cette carte comme un Monstre Normal (Insecte/TERRE/Niveau 5/ATK 2100/DEF 100) dans votre Zone Monstre Main dans sa même colonne (cette carte est toujours aussi un Piège), puis vous pouvez détruire 1 monstre contrôlé par votre adversaire dans la colonne de cette carte. Vous pouvez bannir cette carte depuis votre Cimetière \; ajoutez 1 de vos \"Sanga du Tonnerre\", \"Kazejin\" ou \"Suijin\" bannis ou dans votre Deck à votre main. Vous ne pouvez utiliser chaque effet de \"Proie de Jirai Gumo\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-10.jpg', 'CONTINU', 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Soldat du Lustre Noir - Spadassin Légendaire', 'Monstre', 'terre', 8, 'Vous pouvez Invoquer Rituellement cette carte avec \"Forme du Chaos\" ou \"Rituel du Super Soldat\". Uniquement Invocable Rituellement. Durant votre Draw Phase, avant de piocher : vous pouvez révéler cette carte dans votre main \; renoncez à votre pioche normale ce tour, et si vous le faites, ajoutez 1 Magie Rituelle depuis votre Deck à votre main. Votre adversaire ne peut activer ni de cartes ni d''effets durant votre Battle Phase. Lorsque cette carte attaquante, qui a été Invoquée Rituellement en utilisant un Monstre Normal, détruit un monstre de l''adversaire au combat : vous pouvez mélanger toutes les cartes contrôlées par votre adversaire dans le Deck.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-11.jpg', 'GUERRIER', 'RITUEL', 3000, 2500, 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Soldat du Lustre Noir - Spadassin Légendaire', 'Monstre', 'terre', 8, 'Vous pouvez Invoquer Rituellement cette carte avec \"Forme du Chaos\" ou \"Rituel du Super Soldat\". Uniquement Invocable Rituellement. Durant votre Draw Phase, avant de piocher : vous pouvez révéler cette carte dans votre main \; renoncez à votre pioche normale ce tour, et si vous le faites, ajoutez 1 Magie Rituelle depuis votre Deck à votre main. Votre adversaire ne peut activer ni de cartes ni d''effets durant votre Battle Phase. Lorsque cette carte attaquante, qui a été Invoquée Rituellement en utilisant un Monstre Normal, détruit un monstre de l''adversaire au combat : vous pouvez mélanger toutes les cartes contrôlées par votre adversaire dans le Deck.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-11c.jpg', 'GUERRIER', 'RITUEL', 3000, 2500, 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Âme aux Yeux Rouges', 'Monstre', 'ténèbres', 7, 'Le nom de cette carte devient \"Dragon Noir aux Yeux Rouges\" tant qu''elle est sur le Terrain ou dans le Cimetière. Si votre adversaire Invoque Spécialement un ou plusieurs monstres (sauf durant la Damage Step) : vous pouvez envoyer cette carte depuis votre main ou Terrain au Cimetière \; Invoquez Spécialement 1 monstre \"Yeux Rouges\" (\"Âme aux Yeux Rouges\" exclu) depuis votre main ou Deck. Vous ne pouvez utiliser cet effet de \"Âme aux Yeux Rouges\" qu''une fois par tour. (Effet Rapide) : vous pouvez cibler 1 \"Dragon Noir aux Yeux Rouges\" que vous contrôlez \; infligez des dommages à votre adversaire égaux à l''ATK d''origine du monstre. Vous ne pouvez utiliser cet effet de \"Âme aux Yeux Rouges\" qu''une fois par Duel.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-12.jpg', 'DRAGON', 'EFFET', 900, 2000, 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Duel Académie', 'Magie', 'Cette carte gagne ces effets selon les Types de Monstre sur le Terrain.-----●Guerrier, Bête ou Pyro : Une fois par tour, si vous activez une Carte Piège (sauf durant la Damage Step) : vous pouvez cibler 1 carte contrôlée par votre adversaire \; détruisez-la.-----●Dinosaure, Serpent de Mer ou Tonnerre : Une fois par tour, si vous activez une Carte Magie (sauf durant la Damage Step) : vous pouvez infliger 1000 points de dommages à votre adversaire.-----●Machine, Elfe ou Démon : Une fois par tour, si vous activez un effet de monstre (sauf durant la Damage Step) : vous pouvez cibler 1 monstre face recto que vous contrôlez \; il gagne 1000 ATK (même si cette carte quitte le Terrain).', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-13.jpg', 'TERRAIN', 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Duel Académie', 'Magie', 'Cette carte gagne ces effets selon les Types de Monstre sur le Terrain.-----●Guerrier, Bête ou Pyro : Une fois par tour, si vous activez une Carte Piège (sauf durant la Damage Step) : vous pouvez cibler 1 carte contrôlée par votre adversaire \; détruisez-la.-----●Dinosaure, Serpent de Mer ou Tonnerre : Une fois par tour, si vous activez une Carte Magie (sauf durant la Damage Step) : vous pouvez infliger 1000 points de dommages à votre adversaire.-----●Machine, Elfe ou Démon : Une fois par tour, si vous activez un effet de monstre (sauf durant la Damage Step) : vous pouvez cibler 1 monstre face recto que vous contrôlez \; il gagne 1000 ATK (même si cette carte quitte le Terrain).', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-13c.jpg', 'TERRAIN', 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Réveillez votre HÉROS Élémentaire', 'Monstre', 'lumière', 10, '1 Monstre Fusion \"HÉROS Élémentaire\" + 1+ monstre Guerrier-----Uniquement Invocable par Fusion. Gagne 300 ATK pour chaque Matériel utilisé pour son Invocation. Cette carte peut faire un nombre d''attaques sur des monstres chaque Battle Phase, inférieur ou égal au nombre de Monstres Fusion utilisés comme Matériel pour son Invocation. Après le calcul des dommages, si cette carte a combattu un monstre : détruisez le monstre, et si vous le faites, infligez des dommages à votre adversaire égaux à son ATK d''origine. Si cette carte Invoquée par Fusion est détruite : Invoquez Spécialement 1 monstre Guerrier depuis votre main ou Deck.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-14.jpg', 'GUERRIER', 'FUSION', 2500, 2100, 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Réveillez votre HÉROS Élémentaire', 'Monstre', 'lumière', 10, '1 Monstre Fusion \"HÉROS Élémentaire\" + 1+ monstre Guerrier-----Uniquement Invocable par Fusion. Gagne 300 ATK pour chaque Matériel utilisé pour son Invocation. Cette carte peut faire un nombre d''attaques sur des monstres chaque Battle Phase, inférieur ou égal au nombre de Monstres Fusion utilisés comme Matériel pour son Invocation. Après le calcul des dommages, si cette carte a combattu un monstre : détruisez le monstre, et si vous le faites, infligez des dommages à votre adversaire égaux à son ATK d''origine. Si cette carte Invoquée par Fusion est détruite : Invoquez Spécialement 1 monstre Guerrier depuis votre main ou Deck.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-14c.jpg', 'GUERRIER', 'FUSION', 2500, 2100, 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Explosion Finale d''Évolution', 'Magie', 'Ajoutez 1 \"Fusion en Surcharge\" depuis votre Deck à votre main. Si vous Invoquez par Fusion un monstre ce tour avec \"Fusion en Surcharge\", en utilisant min. 6 monstres comme Matériel, le monstre peut attaquer un nombre de fois chaque Battle Phase ce tour, inférieur ou égal au nombre de monstres utilisés comme ses Matériels Fusion. Le reste de ce tour après la résolution de cette carte, vous ne pouvez pas Invoquer Spécialement de monstres, sauf avec des effets de Magie. Vous ne pouvez activer qu''1 \"Explosion Finale d''Évolution\" par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-15.jpg', 'NORMAL', 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'À vos Marques, Prêts, DUEL !', 'Magie', 'Lorsque cette carte est activée : si vous ne contrôlez aucune autre carte, vous pouvez ajouter 1 monstre \"Synchronique\" depuis votre Deck à votre main. Une fois par tour, durant votre Standby Phase : placez 1 Compteur Signal sur cette carte. Vous pouvez retirer 2 Compteurs Signal depuis votre Terrain, et envoyez cette carte face recto au Cimetière \; piochez 2 cartes, puis envoyez 1 carte depuis votre main au Cimetière. Vous ne pouvez activer qu''1 \"À vos Marques, Prêts, DUEL !\" par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-16.jpg', 'CONTINU', 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Place à la Résistance', 'Piège', 'Si un Monstre Synchro Dragon est sur le Terrain : Invoquez Spécialement max. 2 monstres, qui sont des monstres \"Diapason\" et/ou monstres Dragon de Niveau 1, depuis votre Deck. Lorsqu''un effet de monstre est activé, tant que vous contrôlez un Monstre Synchro TÉNÈBRES Dragon de min. Niveau 10 : vous pouvez bannir cette carte depuis votre Cimetière \; annulez l''effet, et si vous le faites, 1 Monstre Synchro que vous contrôlez gagne 2000 ATK jusqu''à la fin du prochain tour. Vous ne pouvez utiliser chaque effet de \"Place à la Résistance\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-17.jpg', 'NORMAL', 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ce Sinistre Petit Vaurien', 'Magie', '(Cette carte est toujours traitée comme une carte \"Enfernité\".)-----Invoquez Spécialement 1 de vos monstres \"Enfernité\" qui est banni, ou dans votre main ou Cimetière. Si un ou plusieurs monstres \"Enfernité\" face recto que vous contrôlez sont détruits au combat, ou quittent le Terrain à cause d''un effet de carte de l''adversaire, tant que cette carte est dans votre Cimetière : vous pouvez Poser cette carte. Vous ne pouvez utiliser chaque effet de \"Ce Sinistre Petit Vaurien\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-18.jpg', 'NORMAL', 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dragon Poussière d''Étoile Accel Synchro', 'Monstre', 'vent', 8, '1 Syntoniseur + 1+ monstre non-Syntoniseur-----Si cette carte est Invoquée par Synchronisation : vous pouvez Invoquer Spécialement 1 Syntoniseur de max. Niveau 2 depuis votre Cimetière. Durant la Main Phase (Effet Rapide) : vous pouvez Sacrifier cette carte \; Invoquez Spécialement 1 \"Dragon Poussière d''Étoile\" depuis votre Extra Deck (ceci est traité comme une Invocation Synchro), puis, immédiatement après la résolution de cet effet, Invoquez par Synchronisation en utilisant des monstres que vous contrôlez comme Matériel. Le reste de ce tour, les monstres Invoqués par Synchronisation par cet effet ne sont pas affectés par les effets activés de votre adversaire. Vous ne pouvez utiliser chaque effet de \"Dragon Poussière d''Étoile Accel Synchro\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-19.jpg', 'DRAGON', 'SYNCHRO', 2500, 2000, 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Réseau Habillé', 'Magie', 'Vous pouvez activer 1 des effets suivants.-----●Ciblez 1 monstre face recto que vous contrôlez \; Invoquez Spécialement 1 monstre de même Niveau depuis votre main ou Cimetière en Position de Défense, mais annulez ses effets. Vous ne pouvez pas Invoquer Spécialement de monstres (Monstres Xyz exclus) depuis l''Extra Deck le tour où vous activez cet effet.-----●Ciblez 1 Monstre Xyz que vous contrôlez \; ajoutez 1 carte qui lui est attachée à la main.-----Vous ne pouvez utiliser cet effet de \"Réseau Habillé\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-20.jpg', 'CONTINU', 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Numéro 39 : Ascension de l''Utopie', 'Monstre', 'lumière', 4, '2 monstres de Niveau 4-----Si cette carte est Invoquée Spécialement : vous pouvez cibler 1 Monstre Xyz \"Numéro\" (\"Numéro 39 : Ascension de l''Utopie\" exclu) dans votre Cimetière \; Invoquez-le Spécialement en Position de Défense, puis vous pouvez détacher tous les Matériels de cette carte et les attacher au monstre. Si vous Invoquez par Xyz (sauf durant la Damage Step) : vous pouvez Invoquer Spécialement cette carte depuis votre Cimetière, mais bannissez-la lorsqu''elle quitte le Terrain. Vous ne pouvez utiliser chaque effet de \"Numéro 39 : Ascension de l''Utopie\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-21.jpg', 'GUERRIER', 'XYZ', 0, 2000, 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Antopie Barian', 'Magie', '(Cette carte est toujours traitée comme une carte \"de Barian\".)-----Les monstres \"Numéro\" que vous contrôlez avec un numéro entre \"101\" et \"107\" dans leur nom, ainsi que les monstres \"CXyz\" et monstres \"Numéro C\" que vous contrôlez, ne peuvent pas être détruits par des effets de carte de votre adversaire, et votre adversaire ne peut pas les cibler avec des effets de carte. Une fois par tour, si vous Invoquez Spécialement un Monstre Xyz avec un effet de Magie \"Magie-Rang-Plus\" : vous pouvez cibler le Monstre Xyz et 1 monstre contrôlé par votre adversaire \; attachez le monstre de l''adversaire au Monstre Xyz comme Matériel.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MAZE/MAZE-22.jpg', 'TERRAIN', 'Le Labyrinthe des Souvenirs', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Impulsion des Secours-AS', 'Monstre', 'feu', 3, 'Durant votre Main Phase : vous pouvez choisir le Monstre à Effet contrôlé par votre adversaire avec la plus haute ATK (en cas d''égalité, vous choisissez), et aucun joueur ne peut activer les effets du monstre sur le Terrain ce tour. Lorsque votre adversaire active un effet de monstre sur le Terrain (Effet Rapide) : vous pouvez Sacrifier cette carte depuis votre main ou Terrain face recto \; Invoquez Spécialement 1 monstre ″Secours-AS″ Machine depuis votre Deck. Vous ne pouvez utiliser chaque effet de ″Impulsion des Secours-AS″ qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-1.jpg', 'GUERRIER', 'EFFET', 1500, 1500, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Monte-Air des Secours-AS', 'Monstre', 'feu', 4, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez ajouter 1 Magie ″Secours-AS″ depuis votre Deck à votre main. Lorsque votre adversaire active un effet de monstre sur le Terrain (Effet Rapide) : vous pouvez Sacrifier cette carte depuis votre main ou Terrain face recto \; Invoquez Spécialement 1 monstre ″Secours-AS″ (″Monte-Air des Secours-AS″ exclu) depuis votre main. Vous ne pouvez utiliser chaque effet de ″Monte-Air des Secours-AS″ qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-2.jpg', 'GUERRIER', 'EFFET', 1700, 1700, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Moniteur des Secours-AS', 'Monstre', 'feu', 4, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez ajouter 1 Piège ″Secours-AS″ depuis votre Deck à votre main. Lorsque votre adversaire active un effet de monstre sur le Terrain (Effet Rapide) : vous pouvez Sacrifier cette carte depuis votre main ou Terrain face recto, puis ciblez 1 monstre ″Secours-AS″ (″Moniteur des Secours-AS″ exclu) dans votre Cimetière \; Invoquez-le Spécialement. Vous ne pouvez utiliser chaque effet de ″Moniteur des Secours-AS″ qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-3.jpg', 'GUERRIER', 'EFFET', 1800, 1800, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Hydrant des Secours-AS', 'Monstre', 'feu', 1, 'Tant que vous contrôlez un monstre ″Secours-AS″ (″Hydrant des Secours-AS″ exclu), les monstres de votre adversaire ne peuvent pas cibler cette carte avec une attaque, et aussi, votre adversaire ne peut pas cibler cette carte avec des effets de carte. Vous ne pouvez utiliser chacun des effets suivants de ″Hydrant des Secours-AS″ qu''une fois par tour. Vous pouvez activer une Magie Jeu-Rapide ou Carte Piège qui a été Posée par l''effet de votre carte ″Secours-AS″ le tour où elle a été Posée. Durant votre Main Phase : vous pouvez ajouter 1 monstre ″Secours-AS″ (″Hydrant des Secours-AS″ exclu) depuis votre Deck à votre main.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-4.jpg', 'MACHINE', 'EFFET', 0, 0, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Hydrant des Secours-AS', 'Monstre', 'feu', 1, 'Tant que vous contrôlez un monstre ″Secours-AS″ (″Hydrant des Secours-AS″ exclu), les monstres de votre adversaire ne peuvent pas cibler cette carte avec une attaque, et aussi, votre adversaire ne peut pas cibler cette carte avec des effets de carte. Vous ne pouvez utiliser chacun des effets suivants de ″Hydrant des Secours-AS″ qu''une fois par tour. Vous pouvez activer une Magie Jeu-Rapide ou Carte Piège qui a été Posée par l''effet de votre carte ″Secours-AS″ le tour où elle a été Posée. Durant votre Main Phase : vous pouvez ajouter 1 monstre ″Secours-AS″ (″Hydrant des Secours-AS″ exclu) depuis votre Deck à votre main.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-4c.jpg', 'MACHINE', 'EFFET', 0, 0, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Attaque-Feu des Secours-AS', 'Monstre', 'feu', 6, 'Si un ou plusieurs monstres ″Secours-AS″ (″Attaque-Feu des Secours-AS″ exclu) sont Invoqués Normalement ou Spécialement sur votre Terrain (sauf durant la Damage Step) : vous pouvez Invoquer Spécialement cette carte depuis votre main. Si une ou plusieurs cartes sont ajoutées à la main de votre adversaire, sauf en les piochant (sauf durant la Damage Step) : vous pouvez piocher 2 cartes, puis défaussez 1 carte. Vous ne pouvez utiliser chaque effet de ″Attaque-Feu des Secours-AS″ qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-5.jpg', 'MACHINE', 'EFFET', 2200, 2200, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Machine-Feu des Secours-AS', 'Monstre', 'feu', 7, 'Si un ou plusieurs monstres ″Secours-AS″ (″Machine-Feu des Secours-AS″ exclu) sont Invoqués Normalement ou Spécialement sur votre Terrain (sauf durant la Damage Step) : vous pouvez Invoquer Spécialement cette carte depuis votre main. Si un ou plusieurs monstres sont Invoqués Spécialement sur le Terrain de votre adversaire (sauf durant la Damage Step) : vous pouvez Invoquer Spécialement 1 monstre ″Secours-AS″ de max. Niveau 4 depuis votre main, Deck ou Cimetière. Vous ne pouvez utiliser chaque effet de ″Machine-Feu des Secours-AS″ qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-6.jpg', 'MACHINE', 'EFFET', 2500, 2500, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Turbulence des Secours-AS', 'Monstre', 'feu', 9, 'Vous pouvez bannir 2 cartes ″Secours-AS″ depuis votre Cimetière \; Invoquez Spécialement cette carte depuis votre main. Durant votre Main Phase : vous pouvez Poser max. 4 Magies Jeu-Rapide/Pièges Normaux ″Secours-AS″ de noms différents, directement depuis votre Deck. Si une ou plusieurs autres cartes que vous contrôlez quittent le Terrain par un effet de carte de l''adversaire (sauf durant la Damage Step) : vous pouvez cibler 1 carte sur le Terrain \; détruisez-la. Vous ne pouvez utiliser chaque effet de ″Turbulence des Secours-AS″ qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-7.jpg', 'MACHINE', 'EFFET', 3000, 3000, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Turbulence des Secours-AS', 'Monstre', 'feu', 9, 'Vous pouvez bannir 2 cartes ″Secours-AS″ depuis votre Cimetière \; Invoquez Spécialement cette carte depuis votre main. Durant votre Main Phase : vous pouvez Poser max. 4 Magies Jeu-Rapide/Pièges Normaux ″Secours-AS″ de noms différents, directement depuis votre Deck. Si une ou plusieurs autres cartes que vous contrôlez quittent le Terrain par un effet de carte de l''adversaire (sauf durant la Damage Step) : vous pouvez cibler 1 carte sur le Terrain \; détruisez-la. Vous ne pouvez utiliser chaque effet de ″Turbulence des Secours-AS″ qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-7c.jpg', 'MACHINE', 'EFFET', 3000, 3000, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'QG des Secours-AS', 'Magie', 'Tant que votre adversaire contrôle un monstre, tous les monstres ″Secours-AS″ que vous contrôlez gagnent 500 ATK/DEF. Durant votre Main Phase, vous pouvez Invoquer Normalement 1 monstre ″Secours-AS″ en plus de votre Invocation/Pose Normale. (Vous ne pouvez gagner cet effet qu''une fois par tour.) Une fois par tour : vous pouvez cibler 4 de vos cartes ″Secours-AS″ qui sont bannies et/ou dans votre Cimetière \; mélangez-les dans le Deck, puis piochez 1 carte.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-8.jpg', 'TERRAIN', 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'SAUVETAGE !', 'Magie', '(Cette carte est toujours traitée comme une carte ″Secours-AS″.)-----Ciblez 1 monstre ″Secours-AS″ dans votre Cimetière, ou si vous contrôlez ″Hydrant des Secours-AS″, vous pouvez cibler 1 monstre dans le Cimetière de votre adversaire à la place \; Invoquez-le Spécialement sur votre Terrain. Vous ne pouvez activer qu''1 ″SAUVETAGE !″ par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-9.jpg', 'JEU RAPIDE', 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'ALERTE !', 'Magie', '(Cette carte est toujours traitée comme une carte ″Secours-AS″.)-----Ajoutez 1 monstre ″Secours-AS″ depuis votre Cimetière à votre main, ou si vous contrôlez ″Hydrant des Secours-AS″, vous pouvez ajouter 1 monstre ″Secours-AS″ depuis votre Deck à votre main à la place. Vous ne pouvez activer qu''1 ″ALERTE !″ par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-10.jpg', 'JEU RAPIDE', 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'CONFINEMENT !', 'Piège', '(Cette carte est toujours traitée comme une carte ″Secours-AS″.)-----Si vous contrôlez un monstre ″Secours-AS″ : ciblez 1 Monstre à Effet contrôlé par votre adversaire \; ce tour, le Monstre à Effet ne peut pas attaquer, et aussi, ses effets sont annulés. Si vous contrôlez ″Hydrant des Secours-AS″ à la résolution de cet effet, le monstre ne peut aussi pas être utilisé comme Matériel pour une Invocation Fusion, Synchro, Xyz ou Lien ce tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-11.jpg', 'NORMAL', 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'EXTINCTION !', 'Piège', '(Cette carte est toujours traitée comme une carte ″Secours-AS″.)-----Si vous contrôlez un monstre ″Secours-AS″ : ciblez 1 Monstre à Effet contrôlé par votre adversaire \; détruisez-le, puis, si vous contrôlez actuellement ″Hydrant des Secours-AS″, votre adversaire ne peut pas activer les effets du monstre détruit ou de monstres du même nom d''origine que celui-ci, ce tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-12.jpg', 'NORMAL', 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Purrely', 'Monstre', 'lumière', 1, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez dévoiler les 3 cartes du dessus de votre Deck, et si vous le faites, vous pouvez ajouter 1 Magie/Piège ″Purrely″ dévoilé à votre main, et aussi, placez les cartes restantes au-dessous de votre Deck dans l''ordre de votre choix. Une fois par tour, durant votre Main Phase : vous pouvez révéler 1 Magie Jeu-Rapide ″Purrely″ dans votre main, Invoquez Spécialement 1 Monstre Xyz depuis votre Extra Deck qui mentionne la carte, en utilisant cette carte que vous contrôlez comme Matériel, et attachez la carte révélée au monstre Invoqué. (Ceci est traité comme une Invocation Xyz.)', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-13.jpg', 'ELFE', 'EFFET', 100, 100, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Purrely', 'Monstre', 'lumière', 1, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez dévoiler les 3 cartes du dessus de votre Deck, et si vous le faites, vous pouvez ajouter 1 Magie/Piège ″Purrely″ dévoilé à votre main, et aussi, placez les cartes restantes au-dessous de votre Deck dans l''ordre de votre choix. Une fois par tour, durant votre Main Phase : vous pouvez révéler 1 Magie Jeu-Rapide ″Purrely″ dans votre main, Invoquez Spécialement 1 Monstre Xyz depuis votre Extra Deck qui mentionne la carte, en utilisant cette carte que vous contrôlez comme Matériel, et attachez la carte révélée au monstre Invoqué. (Ceci est traité comme une Invocation Xyz.)', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-13c.jpg', 'ELFE', 'EFFET', 100, 100, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Bonheur Épurrely', 'Monstre', 'lumière', 2, '2 monstres de Niveau 2
-----À la fin de la Damage Step, si cette carte a combattu : vous pouvez ajouter 1 carte ″Purrely″ depuis votre Deck à votre main, et aussi, si cette carte a ″Heureux Souvenirs Purrely″ comme Matériel, vous pouvez diviser par deux l''ATK d''1 monstre face recto sur le Terrain. Max. trois fois par tour, lorsque vous activez une Carte Magie Jeu-Rapide ″Purrely″ (Effet Rapide) : vous pouvez attacher la carte sur le Terrain à cette carte comme Matériel, puis vous pouvez renvoyer 1 Magie/Piège contrôlé par votre adversaire à la main.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-14.jpg', 'ELFE', 'XYZ', 2000, 100, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Beauté Épurrely', 'Monstre', 'eau', 2, '2 monstres de Niveau 2-----Une fois par tour : vous pouvez cibler 1 Monstre à Effet contrôlé par votre adversaire \; jusqu''à la fin de ce tour, annulez ses effets. Ceci est un Effet Rapide si cette carte a ″Beaux Souvenirs Purrely″ comme Matériel. Max. trois fois par tour, lorsque vous activez une Carte Magie Jeu-Rapide ″Purrely″ (Effet Rapide) : vous pouvez attacher la carte sur le Terrain à cette carte comme Matériel, puis vous pouvez changer la position de combat d''1 monstre contrôlé par votre adversaire.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-15.jpg', 'ELFE', 'XYZ', 1600, 1100, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dodu Épurrely', 'Monstre', 'terre', 2, '2 monstres de Niveau 2-----Une fois par tour : vous pouvez cibler max. 2 Magies/Pièges dans les Cimetières \; attachez-les à cette carte comme Matériel. Ceci est un Effet Rapide si cette carte a ″Délicieux Souvenirs Purrely″ comme Matériel. Max. trois fois par tour, lorsque vous activez une Carte Magie Jeu-Rapide ″Purrely″ (Effet Rapide) : vous pouvez attacher la carte sur le Terrain à cette carte comme Matériel, puis vous pouvez bannir 1 monstre sur le Terrain jusqu''à la End Phase.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-16.jpg', 'ELFE', 'XYZ', 200, 2100, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Bonheur Expurrely', 'Monstre', 'lumière', 7, '2 monstres de Niveau 7-----Vous pouvez aussi Invoquer par Xyz cette carte en utilisant un monstre de Rang 2 que vous contrôlez avec min. 5 Matériels. (Transférez ses Matériels à cette carte.) Durant votre Main Phase : vous pouvez détacher 1 Matériel de cette carte, et si vous le faites, annulez les effets de tous les monstres face recto actuellement contrôlés par votre adversaire, jusqu''à la fin de ce tour. Votre adversaire ne peut activer ni de cartes ni d''effets en réponse à l''activation de cet effet si cette carte a un monstre ″Purrely″ de Niveau 1 comme Matériel. Lorsqu''une attaque impliquant cette carte qui a min. 5 Matériels est déclarée : infligez 1500 points de dommages à votre adversaire.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-17.jpg', 'ELFE', 'XYZ', 2500, 1100, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Bonheur Expurrely', 'Monstre', 'lumière', 7, '2 monstres de Niveau 7-----Vous pouvez aussi Invoquer par Xyz cette carte en utilisant un monstre de Rang 2 que vous contrôlez avec min. 5 Matériels. (Transférez ses Matériels à cette carte.) Durant votre Main Phase : vous pouvez détacher 1 Matériel de cette carte, et si vous le faites, annulez les effets de tous les monstres face recto actuellement contrôlés par votre adversaire, jusqu''à la fin de ce tour. Votre adversaire ne peut activer ni de cartes ni d''effets en réponse à l''activation de cet effet si cette carte a un monstre ″Purrely″ de Niveau 1 comme Matériel. Lorsqu''une attaque impliquant cette carte qui a min. 5 Matériels est déclarée : infligez 1500 points de dommages à votre adversaire.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-17c.jpg', 'ELFE', 'XYZ', 2500, 1100, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Noir Expurrely', 'Monstre', 'ténèbres', 7, '2 monstres de Niveau 7-----Vous pouvez aussi Invoquer par Xyz cette carte en utilisant un monstre de Rang 2 que vous contrôlez avec min. 5 Matériels. (Transférez ses Matériels à cette carte.) Cette carte n''est pas affectée par les effets activés de votre adversaire tant qu''elle a min. 5 Matériels. Vous pouvez détacher 2 Matériels de cette carte, puis ciblez 1 carte contrôlée par votre adversaire ou dans son Cimetière \; placez-la au-dessous du Deck. Ceci est un Effet Rapide si cette carte a un monstre ″Purrely″ de Niveau 1 comme Matériel.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-18.jpg', 'ELFE', 'XYZ', 1100, 2800, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Noir Expurrely', 'Monstre', 'ténèbres', 7, '2 monstres de Niveau 7-----Vous pouvez aussi Invoquer par Xyz cette carte en utilisant un monstre de Rang 2 que vous contrôlez avec min. 5 Matériels. (Transférez ses Matériels à cette carte.) Cette carte n''est pas affectée par les effets activés de votre adversaire tant qu''elle a min. 5 Matériels. Vous pouvez détacher 2 Matériels de cette carte, puis ciblez 1 carte contrôlée par votre adversaire ou dans son Cimetière \; placez-la au-dessous du Deck. Ceci est un Effet Rapide si cette carte a un monstre ″Purrely″ de Niveau 1 comme Matériel.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-18c.jpg', 'ELFE', 'XYZ', 1100, 2800, 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Rue Purrely Errant', 'Magie', 'Votre adversaire ne peut pas cibler de monstres ″Purrely″ que vous contrôlez avec des effets de carte, le tour où ils sont Invoqués Spécialement. Une fois par tour, si un ou plusieurs Monstres Xyz ″Purrely″ face recto que vous contrôlez quittent le Terrain à cause d''une carte de l''adversaire : Invoquez Spécialement 1 monstre ″Purrely″ de Niveau 1 depuis votre Deck ou Cimetière. Une fois par tour, durant la End Phase : vous pouvez cibler 1 Monstre Xyz ″Purrely″ sur le Terrain \; attachez 1 Magie Jeu-Rapide ″Purrely″ depuis votre Deck ou Cimetière au monstre comme Matériel.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-19.jpg', 'TERRAIN', 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Mon Ami Purrely', 'Magie', 'Vous pouvez payer 500 LP \; révélez 3 cartes ″Purrely″ (″Mon Ami Purrely″ exclu) depuis votre Deck, et votre adversaire en prend 1 au hasard pour vous à ajouter à votre main, et aussi, mélangez les cartes restantes dans votre Deck. Si un ou plusieurs Monstres Xyz ″Purrely″ face recto que vous contrôlez quittent le Terrain à cause d''une carte de l''adversaire, même durant la Damage Step : vous pouvez ajouter max. 3 Magies Jeu-Rapide ″Purrely″ de noms différents depuis votre Cimetière à votre main. Vous ne pouvez utiliser chaque effet de ″Mon Ami Purrely″ qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/AMDE/AMDE-20.jpg', 'CONTINU', 'Incroyables Défenseurs', TO_DATE('2023-01-19', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Trancheur de Lignée Royale', 'Monstre', 'lumière', 6, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-1.jpg', 'GUERRIER', 'EFFET', 2400, 1350, 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Lignée Royale', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-2.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Griffe de Dragon', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-3.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Boule de Tonnerre', 'Monstre', 'ténèbres', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-4.jpg', 'DÉMON', 'EFFET', 450, 400, 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Duel des Dés', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-5.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Monstre des Dés', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-6.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Nuit des Machines', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-7.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Le Mélangeur', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-8.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Bataille des Esprits Endormis', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-9.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Bête Cristalline Ultime : Escarboucle de Rubis', 'Monstre', 'lumière', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-10.jpg', 'ELFE', 'EFFET', 300, 300, 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Bête Cristalline Ultime : Chat d''Améthyste', 'Monstre', 'terre', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-11.jpg', 'BÊTE', 'EFFET', 1200, 400, 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Bête Cristalline Ultime : Tortue d''Émeraude', 'Monstre', 'eau', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-12.jpg', 'AQUA', 'EFFET', 600, 2000, 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Bête Cristalline Ultime : Tigre de Topaze', 'Monstre', 'terre', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-13.jpg', 'BÊTE', 'EFFET', 1600, 1000, 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Bête Cristalline Ultime : Mammouth d''Ambre', 'Monstre', 'terre', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-14.jpg', 'BÊTE', 'EFFET', 1700, 1600, 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Bête Cristalline Ultime : Aigle de Cobalt', 'Monstre', 'vent', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-15.jpg', 'BÊTE AILÉE', 'EFFET', 1400, 800, 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Bête Cristalline Ultime : Pégase de Saphir', 'Monstre', 'vent', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-16.jpg', 'BÊTE', 'EFFET', 1800, 1200, 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dyno Base', 'Monstre', 'terre', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-17.jpg', 'MACHINE', 'EFFET', 0, 2100, 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dyno Tank', 'Monstre', 'terre', 7, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-18.jpg', 'MACHINE', 'FUSION', 0, 2100, 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Boîte Gadget', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-19.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Retour de l''Impact Morphtronique', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-20.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Boîte à Outils', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-21.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Crâne de Cristal', 'Monstre', 'eau', 1, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-22.jpg', 'ROCHER', 'EFFET', 0, 0, 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Poupée de la Malédiction du Reflet', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-23.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Stonehenge', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-24.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Requin Rêve', 'Monstre', 'eau', 5, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLCR/BLCR-25.jpg', 'POISSON', 'EFFET', 0, 2600, 'Batailles de Légende : La Vengeance du Cristal', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Shinonome la Prêtresse Vaylantz', 'Monstre', 'eau', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-1.jpg', 'MAGICIEN', 'PENDULE', 500, 500, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Shinonome la Prêtresse Vaylantz', 'Monstre', 'eau', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-1c.jpg', 'MAGICIEN', 'PENDULE', 500, 500, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Saion l''Archer Vaylantz', 'Monstre', 'eau', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-2.jpg', 'MAGICIEN', 'PENDULE', 1100, 1100, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Nazuki le Ninja Vaylantz', 'Monstre', 'eau', 6, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-3.jpg', 'MAGICIEN', 'PENDULE', 1800, 1800, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Hojo le Guerrier Vaylantz', 'Monstre', 'eau', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-4.jpg', 'MAGICIEN', 'PENDULE', 1900, 1900, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Baron du Brisement Vaylantz', 'Monstre', 'feu', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-5.jpg', 'MACHINE', 'PENDULE', 800, 800, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Vicomte de la Tension Vaylantz', 'Monstre', 'feu', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-6.jpg', 'MACHINE', 'PENDULE', 1400, 1400, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Marquis de la Folie Vaylantz', 'Monstre', 'feu', 6, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-7.jpg', 'MACHINE', 'PENDULE', 1700, 1700, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Duc de la Domination Vaylantz', 'Monstre', 'feu', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-8.jpg', 'MACHINE', 'PENDULE', 2000, 2000, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Mamonaka l''Union Vaylantz', 'Monstre', 'eau', 10, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-9c.jpg', 'MAGICIEN', 'FUSION', 2800, 2800, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Mamonaka l''Union Vaylantz', 'Monstre', 'eau', 10, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-9.jpg', 'MAGICIEN', 'FUSION', 2800, 2800, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Grand-Duc de la Genèse Vaylantz', 'Monstre', 'feu', 10, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-10.jpg', 'MACHINE', 'FUSION', 2500, 2500, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Guerres Vaylantz - L''Endroit du Commencement', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-11.jpg', 'NORMAL', 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Guerres Vaylantz - L''Endroit du Commencement', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-11c.jpg', 'NORMAL', 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Monde Vaylantz - Shinra Bansho', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-12.jpg', 'NORMAL', 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Monde Vaylantz - Konig Wissen', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-13.jpg', 'NORMAL', 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Adorable Labrynth du Château d''Argent', 'Monstre', 'ténèbres', 8, 'Votre adversaire ne peut pas activer d''effets de monstre en réponse à l''activation de vos Cartes Piège Normal. Vous ne pouvez utiliser chacun des effets suivants de \"Adorable Labrynth du Château d''Argent\" qu''une fois par tour. Vous pouvez cibler 1 Piège Normal dans votre Cimetière \; Posez-le sur votre Terrain, mais il ne peut pas être activé sauf si vous contrôlez un monstre Démon. Si un ou plusieurs autres monstres quittent le Terrain par votre effet de Piège Normal (sauf durant la Damage Step) : vous pouvez détruire 1 carte dans la main de votre adversaire (au hasard) ou sur son Terrain.', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-14.jpg', 'DÉMON', 'EFFET', 2900, 1900, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Adorable Labrynth du Château d''Argent', 'Monstre', 'ténèbres', 8, 'Votre adversaire ne peut pas activer d''effets de monstre en réponse à l''activation de vos Cartes Piège Normal. Vous ne pouvez utiliser chacun des effets suivants de \"Adorable Labrynth du Château d''Argent\" qu''une fois par tour. Vous pouvez cibler 1 Piège Normal dans votre Cimetière \; Posez-le sur votre Terrain, mais il ne peut pas être activé sauf si vous contrôlez un monstre Démon. Si un ou plusieurs autres monstres quittent le Terrain par votre effet de Piège Normal (sauf durant la Damage Step) : vous pouvez détruire 1 carte dans la main de votre adversaire (au hasard) ou sur son Terrain.', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-14c.jpg', 'DÉMON', 'EFFET', 2900, 1900, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Archdémon Labrynth', 'Monstre', 'ténèbres', 7, 'Gagne 400 ATK pour chaque Piège Normal de nom différent dans votre Cimetière. Les monstres de votre adversaire ne peuvent pas cibler de monstres Démon (\"Archdémon Labrynth\" exclu) avec une attaque. Vous ne pouvez utiliser chacun des effets suivants de \"Archdémon Labrynth\" qu''une fois par tour. Si une Carte Piège est activée (sauf durant la Damage Step) : vous pouvez Invoquer Spécialement cette carte depuis votre main. Si cette carte est Invoquée Spécialement : vous pouvez Poser 1 Piège Normal depuis votre Deck qui ne peut être activé que lorsqu''une attaque est déclarée.', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-15.jpg', 'DÉMON', 'EFFET', 2000, 2800, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ariane la Domestique Labrynth', 'Monstre', 'ténèbres', 4, 'Vous pouvez envoyer 1 Piège Normal depuis votre main ou qui est Posé sur votre Terrain au Cimetière \; Invoquez Spécialement 1 monstre Démon de max. Niveau 4 (\"Ariane la Domestique Labrynth\" exclu) depuis votre Deck en Position de Défense. Si un ou plusieurs autres monstres quittent le Terrain par votre effet de Piège Normal (sauf durant la Damage Step) : vous pouvez piocher 1 carte, puis vous pouvez appliquer cet effet.-----●Depuis votre main, soit Invoquez Spécialement 1 monstre Démon, soit Posez 1 Magie/Piège.-----Vous ne pouvez utiliser chaque effet de \"Ariane la Domestique Labrynth\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-16.jpg', 'DÉMON', 'EFFET', 1800, 1100, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ariane la Domestique Labrynth', 'Monstre', 'ténèbres', 4, 'Vous pouvez envoyer 1 Piège Normal depuis votre main ou qui est Posé sur votre Terrain au Cimetière \; Invoquez Spécialement 1 monstre Démon de max. Niveau 4 (\"Ariane la Domestique Labrynth\" exclu) depuis votre Deck en Position de Défense. Si un ou plusieurs autres monstres quittent le Terrain par votre effet de Piège Normal (sauf durant la Damage Step) : vous pouvez piocher 1 carte, puis vous pouvez appliquer cet effet.-----●Depuis votre main, soit Invoquez Spécialement 1 monstre Démon, soit Posez 1 Magie/Piège.-----Vous ne pouvez utiliser chaque effet de \"Ariane la Domestique Labrynth\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-16c.jpg', 'DÉMON', 'EFFET', 1800, 1100, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Arianna la Domestique Labrynth', 'Monstre', 'ténèbres', 4, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez ajouter 1 carte \"Labrynth\" (\"Arianna la Domestique Labrynth\" exclu) depuis votre Deck à votre main. Si un ou plusieurs autres monstres quittent le Terrain par votre effet de Piège Normal (sauf durant la Damage Step) : vous pouvez piocher 1 carte, puis vous pouvez appliquer cet effet.-----●Depuis votre main, soit Invoquez Spécialement 1 monstre Démon, soit Posez 1 Magie/Piège.-----Vous ne pouvez utiliser qu''1 effet de \"Arianna la Domestique Labrynth\" par tour, et uniquement une fois le tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-17.jpg', 'DÉMON', 'EFFET', 1600, 2100, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Arianna la Domestique Labrynth', 'Monstre', 'ténèbres', 4, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez ajouter 1 carte \"Labrynth\" (\"Arianna la Domestique Labrynth\" exclu) depuis votre Deck à votre main. Si un ou plusieurs autres monstres quittent le Terrain par votre effet de Piège Normal (sauf durant la Damage Step) : vous pouvez piocher 1 carte, puis vous pouvez appliquer cet effet.-----●Depuis votre main, soit Invoquez Spécialement 1 monstre Démon, soit Posez 1 Magie/Piège.-----Vous ne pouvez utiliser qu''1 effet de \"Arianna la Domestique Labrynth\" par tour, et uniquement une fois le tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-17c.jpg', 'DÉMON', 'EFFET', 1600, 2100, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Chandraglier Labrynth', 'Monstre', 'ténèbres', 3, '(Effet Rapide) : vous pouvez envoyer cette carte depuis votre main ou Terrain au Cimetière, et défaussez 1 carte \; Posez 1 Magie/Piège \"Labrynth\" depuis votre main ou Deck. Si un ou plusieurs monstres quittent le Terrain par votre effet de Piège Normal, tant que cette carte est dans votre Cimetière (sauf durant la Damage Step) : vous pouvez ajouter cette carte à votre main. Vous ne pouvez utiliser chaque effet de \"Chandraglier Labrynth\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-18.jpg', 'DÉMON', 'EFFET', 1500, 0, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Cheminie Torbie Labrynth', 'Monstre', 'ténèbres', 2, '(Effet Rapide) : vous pouvez envoyer cette carte depuis votre main ou Terrain au Cimetière, et défaussez 1 carte \; Posez 1 Magie/Piège \"Labrynth\" depuis votre main ou Deck. Si un ou plusieurs monstres quittent le Terrain par votre effet de Piège Normal, tant que cette carte est dans votre Cimetière (sauf durant la Damage Step) : vous pouvez Invoquer Spécialement cette carte. Vous ne pouvez utiliser chaque effet de \"Cheminie Torbie Labrynth\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/TAMA/TAMA-19.jpg', 'DÉMON', 'EFFET', 0, 2000, 'Les Maîtres Tactiques', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ukiyoe-P.U.N.K. Sharakusai', 'Monstre', 'terre', 3, 'Vous pouvez payer 600 LP \; Invoquez par Fusion 1 Monstre Fusion \"P.U.N.K.\" depuis votre Extra Deck, en utilisant des monstres depuis votre main ou Terrain comme Matériel. Durant le tour de votre adversaire (Effet Rapide) : vous pouvez payer 600 LP \; immédiatement après la résolution de cet effet, Invoquez par Synchronisation 1 Monstre Synchro \"P.U.N.K.\" en utilisant des monstres que vous contrôlez comme Matériel. Vous ne pouvez utiliser chaque effet de \"Ukiyoe-P.U.N.K. Sharakusai\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-1.jpg', 'PSYCHIQUE', 'SYNTONISEUR', 1200, 600, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gagaku-P.U.N.K. Wa Gon', 'Monstre', 'terre', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-2.jpg', 'PSYCHIQUE', 'SYNTONISEUR', 900, 600, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Joruri-P.U.N.K. Madame Araignée', 'Monstre', 'terre', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-3.jpg', 'PSYCHIQUE', 'SYNTONISEUR', 900, 600, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Noh-P.U.N.K. Ze Amin', 'Monstre', 'terre', 3, 'Vous pouvez payer 600 LP \; ajoutez 1 monstre \"P.U.N.K.\" (\"Noh-P.U.N.K. Ze Amin\" exclu) depuis votre Deck à votre main. Si cette carte est envoyée au Cimetière : vous pouvez cibler 1 monstre \"P.U.N.K.\" que vous contrôlez \; il gagne 600 ATK. Vous ne pouvez utiliser chaque effet de \"Noh-P.U.N.K. Ze Amin\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-4.jpg', 'PSYCHIQUE', 'SYNTONISEUR', 600, 600, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Noh-P.U.N.K. Mélodie du Renard', 'Monstre', 'lumière', 8, 'Une fois par tour, lorsque cette carte détruit un monstre de l''adversaire au combat : vous pouvez gagner des LP égaux à l''ATK d''origine du monstre. Vous ne pouvez utiliser chacun des effets suivants de \"Noh-P.U.N.K. Mélodie du Renard\" qu''une fois par tour. Vous pouvez Sacrifier 1 monstre \"P.U.N.K.\" \; Invoquez Spécialement cette carte depuis votre main. Vous pouvez envoyer cette carte depuis votre main ou Terrain au Cimetière \; envoyez 1 carte depuis votre main au Cimetière, et si vous le faites, Invoquez Spécialement 1 monstre \"P.U.N.K.\" (monstres de Niveau 8 exclus) depuis votre Deck.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-5.jpg', 'BÊTE', 'EFFET', 2300, 2600, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Noh-P.U.N.K. Mélodie du Renard', 'Monstre', 'lumière', 8, 'Une fois par tour, lorsque cette carte détruit un monstre de l''adversaire au combat : vous pouvez gagner des LP égaux à l''ATK d''origine du monstre. Vous ne pouvez utiliser chacun des effets suivants de \"Noh-P.U.N.K. Mélodie du Renard\" qu''une fois par tour. Vous pouvez Sacrifier 1 monstre \"P.U.N.K.\" \; Invoquez Spécialement cette carte depuis votre main. Vous pouvez envoyer cette carte depuis votre main ou Terrain au Cimetière \; envoyez 1 carte depuis votre main au Cimetière, et si vous le faites, Invoquez Spécialement 1 monstre \"P.U.N.K.\" (monstres de Niveau 8 exclus) depuis votre Deck.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-5c.jpg', 'BÊTE', 'EFFET', 2300, 2600, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Noh-P.U.N.K. Danse de l''Ogre', 'Monstre', 'ténèbres', 8, 'Une fois par tour, lorsque votre adversaire active un effet de monstre (Effet Rapide) : jusqu''à la fin de ce tour, vous pouvez faire gagner à cette carte une ATK égale à l''ATK d''origine du monstre de l''adversaire. Vous ne pouvez utiliser chacun des effets suivants de \"Noh-P.U.N.K. Danse de l''Ogre\" qu''une fois par tour. Vous pouvez Sacrifier 1 monstre \"P.U.N.K.\" \; Invoquez Spécialement cette carte depuis votre main. Vous pouvez envoyer cette carte depuis votre main ou Terrain au Cimetière \; ajoutez 1 monstre \"P.U.N.K.\" (monstres de Niveau 8 exclus) depuis votre Deck à votre main.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-6.jpg', 'DÉMON', 'EFFET', 2500, 2000, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Noh-P.U.N.K. Danse de l''Ogre', 'Monstre', 'ténèbres', 8, 'Une fois par tour, lorsque votre adversaire active un effet de monstre (Effet Rapide) : jusqu''à la fin de ce tour, vous pouvez faire gagner à cette carte une ATK égale à l''ATK d''origine du monstre de l''adversaire. Vous ne pouvez utiliser chacun des effets suivants de \"Noh-P.U.N.K. Danse de l''Ogre\" qu''une fois par tour. Vous pouvez Sacrifier 1 monstre \"P.U.N.K.\" \; Invoquez Spécialement cette carte depuis votre main. Vous pouvez envoyer cette carte depuis votre main ou Terrain au Cimetière \; ajoutez 1 monstre \"P.U.N.K.\" (monstres de Niveau 8 exclus) depuis votre Deck à votre main.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-6c.jpg', 'DÉMON', 'EFFET', 2500, 2000, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ukiyoe-P.U.N.K. Carpe Montante', 'Monstre', 'eau', 8, '2 monstres \"P.U.N.K.\"-----Vous pouvez Sacrifier cette carte Invoquée par Fusion \; Invoquez Spécialement max. 2 monstres \"P.U.N.K.\" de noms différents l''un de l''autre (monstres de Niveau 8 exclus) depuis votre main et/ou Deck en Position de Défense. Si vous avez Invoqué par Synchronisation en utilisant cette carte comme Matériel : vous pouvez cibler 1 monstre \"P.U.N.K.\" que vous contrôlez \; durant chaque Battle Phase ce tour, il peut faire une seconde attaque. Vous ne pouvez utiliser chaque effet de \"Ukiyoe-P.U.N.K. Carpe Montante\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-7.jpg', 'POISSON', 'FUSION', 1000, 2600, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ukiyoe-P.U.N.K. Dragon Extraordinaire', 'Monstre', 'vent', 11, '1 Syntoniseur + 1+ monstre non-Syntoniseur-----Si cette carte est Invoquée par Synchronisation : vous pouvez cibler un nombre de cartes contrôlées par votre adversaire, inférieur ou égal au nombre de monstres Psychique de Niveau 3 de noms différents que vous contrôlez et dans votre Cimetière \; renvoyez-les à la main. Vous pouvez cibler 1 monstre \"P.U.N.K.\" (\"Ukiyoe-P.U.N.K. Dragon Extraordinaire\" exclu) dans votre Cimetière \; Invoquez-le Spécialement. Vous ne pouvez utiliser qu''1 effet de \"Ukiyoe-P.U.N.K. Dragon Extraordinaire\" par tour, et uniquement une fois le tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-8.jpg', 'SERPENT DE MER', 'SYNCHRO', 3000, 2800, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ukiyoe-P.U.N.K. Dragon Extraordinaire', 'Monstre', 'vent', 11, '1 Syntoniseur + 1+ monstre non-Syntoniseur-----Si cette carte est Invoquée par Synchronisation : vous pouvez cibler un nombre de cartes contrôlées par votre adversaire, inférieur ou égal au nombre de monstres Psychique de Niveau 3 de noms différents que vous contrôlez et dans votre Cimetière \; renvoyez-les à la main. Vous pouvez cibler 1 monstre \"P.U.N.K.\" (\"Ukiyoe-P.U.N.K. Dragon Extraordinaire\" exclu) dans votre Cimetière \; Invoquez-le Spécialement. Vous ne pouvez utiliser qu''1 effet de \"Ukiyoe-P.U.N.K. Dragon Extraordinaire\" par tour, et uniquement une fois le tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-8c.jpg', 'SERPENT DE MER', 'SYNCHRO', 3000, 2800, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gagaku-P.U.N.K. Picking Sauvage', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-9.jpg', 'NORMAL', 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gagaku-P.U.N.K. Rythme Endiablé', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-10.jpg', 'NORMAL', 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Joruri-P.U.N.K. Dangereuse Gabu', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-11.jpg', 'NORMAL', 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Joruri-P.U.N.K. Surprise Nashiwari', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-12.jpg', 'NORMAL', 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Exosœur Elis', 'Monstre', 'lumière', 4, 'Si vous contrôlez un monstre \"Exosœur\" : vous pouvez Invoquer Spécialement cette carte depuis votre main, puis si vous contrôlez \"Exosœur Stella\", vous gagnez 800 LP. Si votre adversaire sort une ou plusieurs cartes d''au moins l''un des Cimetières (sauf durant la Damage Step) : vous pouvez Invoquer Spécialement 1 Monstre Xyz \"Exosœur\" depuis votre Extra Deck, en utilisant cette carte face recto que vous contrôlez comme Matériel. (Ceci est traité comme une Invocation Xyz.) Vous ne pouvez utiliser chaque effet de \"Exosœur Elis\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-13.jpg', 'MAGICIEN', 'EFFET', 500, 800, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Exosœur Stella', 'Monstre', 'lumière', 4, 'Durant votre Main Phase : vous pouvez Invoquer Spécialement 1 monstre \"Exosœur\" depuis votre main, puis si vous contrôlez \"Exosœur Elis\", vous gagnez 800 LP. Si votre adversaire sort une ou plusieurs cartes d''au moins l''un des Cimetières (sauf durant la Damage Step) : vous pouvez Invoquer Spécialement 1 Monstre Xyz \"Exosœur\" depuis votre Extra Deck, en utilisant cette carte face recto que vous contrôlez comme Matériel. (Ceci est traité comme une Invocation Xyz.) Vous ne pouvez utiliser chaque effet de \"Exosœur Stella\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-14.jpg', 'MAGICIEN', 'EFFET', 300, 800, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Exosœur Irène', 'Monstre', 'lumière', 4, 'Vous pouvez placer 1 carte \"Exosœur\" depuis votre main au-dessous du Deck \; piochez 1 carte, puis si vous contrôlez \"Exosœur Sophia\", vous gagnez 800 LP. Si votre adversaire sort une ou plusieurs cartes d''au moins l''un des Cimetières (sauf durant la Damage Step) : vous pouvez Invoquer Spécialement 1 Monstre Xyz \"Exosœur\" depuis votre Extra Deck, en utilisant cette carte face recto que vous contrôlez comme Matériel. (Ceci est traité comme une Invocation Xyz.) Vous ne pouvez utiliser chaque effet de \"Exosœur Irène\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-15.jpg', 'MAGICIEN', 'EFFET', 400, 800, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Exosœur Sophia', 'Monstre', 'lumière', 4, 'Si vous contrôlez un autre monstre \"Exosœur\" : vous pouvez piocher 1 carte, puis si vous contrôlez \"Exosœur Irène\", vous gagnez 800 LP. Si votre adversaire sort une ou plusieurs cartes d''au moins l''un des Cimetières (sauf durant la Damage Step) : vous pouvez Invoquer Spécialement 1 Monstre Xyz \"Exosœur\" depuis votre Extra Deck, en utilisant cette carte face recto que vous contrôlez comme Matériel. (Ceci est traité comme une Invocation Xyz.) Vous ne pouvez utiliser chaque effet de \"Exosœur Sophia\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-16.jpg', 'MAGICIEN', 'EFFET', 100, 800, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Exosœur Sophia', 'Monstre', 'lumière', 4, 'Si vous contrôlez un autre monstre \"Exosœur\" : vous pouvez piocher 1 carte, puis si vous contrôlez \"Exosœur Irène\", vous gagnez 800 LP. Si votre adversaire sort une ou plusieurs cartes d''au moins l''un des Cimetières (sauf durant la Damage Step) : vous pouvez Invoquer Spécialement 1 Monstre Xyz \"Exosœur\" depuis votre Extra Deck, en utilisant cette carte face recto que vous contrôlez comme Matériel. (Ceci est traité comme une Invocation Xyz.) Vous ne pouvez utiliser chaque effet de \"Exosœur Sophia\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-16c.jpg', 'MAGICIEN', 'EFFET', 100, 800, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Exosœur Mikailis', 'Monstre', 'lumière', 4, '2 monstres de Niveau 4-----Non destructible au combat avec un monstre Invoqué Spécialement depuis le Cimetière. Vous ne pouvez utiliser chacun des effets suivants de \"Exosœur Mikailis\" qu''une fois par tour. Si vous contrôlez cette carte qui a été Invoquée par Xyz ce tour en utilisant un monstre \"Exosœur\" comme Matériel (Effet Rapide) : vous pouvez cibler 1 carte contrôlée par votre adversaire ou dans son Cimetière \; bannissez-la. Vous pouvez détacher 1 Matériel de cette carte \; ajoutez 1 Magie/Piège \"Exosœur\" depuis votre Deck à votre main.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-17.jpg', 'GUERRIER', 'XYZ', 2500, 1800, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Exosœur Mikailis', 'Monstre', 'lumière', 4, '2 monstres de Niveau 4-----Non destructible au combat avec un monstre Invoqué Spécialement depuis le Cimetière. Vous ne pouvez utiliser chacun des effets suivants de \"Exosœur Mikailis\" qu''une fois par tour. Si vous contrôlez cette carte qui a été Invoquée par Xyz ce tour en utilisant un monstre \"Exosœur\" comme Matériel (Effet Rapide) : vous pouvez cibler 1 carte contrôlée par votre adversaire ou dans son Cimetière \; bannissez-la. Vous pouvez détacher 1 Matériel de cette carte \; ajoutez 1 Magie/Piège \"Exosœur\" depuis votre Deck à votre main.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-17c.jpg', 'GUERRIER', 'XYZ', 2500, 1800, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Exosœur Kaspitell', 'Monstre', 'lumière', 4, '2 monstres de Niveau 4-----Non destructible au combat avec un monstre Invoqué Spécialement depuis le Cimetière. Vous ne pouvez utiliser chacun des effets suivants de \"Exosœur Kaspitell\" qu''une fois par tour. Si cette carte est Invoquée par Xyz en utilisant un monstre \"Exosœur\" comme Matériel : le reste de ce tour, aucun joueur ne peut Invoquer Spécialement de monstres depuis les Cimetières. Vous pouvez détacher 1 Matériel de cette carte \; ajoutez 1 monstre \"Exosœur\" depuis votre Deck à votre main.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-18.jpg', 'GUERRIER', 'XYZ', 2300, 800, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Exosœur Gibrine', 'Monstre', 'lumière', 4, '2 monstres de Niveau 4-----Non destructible par les effets activés de monstres Invoqués Spécialement depuis le Cimetière. Vous ne pouvez utiliser chacun des effets suivants de \"Exosœur Gibrine\" qu''une fois par tour. Si vous contrôlez cette carte qui a été Invoquée par Xyz ce tour en utilisant un monstre \"Exosœur\" comme Matériel (Effet Rapide) : vous pouvez cibler 1 Monstre à Effet contrôlé par votre adversaire \; jusqu''à la fin de ce tour, annulez ses effets. Vous pouvez détacher 1 Matériel de cette carte \; le reste de ce tour, tous les Monstres Xyz que vous contrôlez vont gagner 800 ATK.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-19.jpg', 'GUERRIER', 'XYZ', 1400, 2800, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Exosœur Asophiel', 'Monstre', 'lumière', 4, '2 monstres de Niveau 4-----Non destructible par les effets activés de monstres Invoqués Spécialement depuis le Cimetière. Vous ne pouvez utiliser chacun des effets suivants de \"Exosœur Asophiel\" qu''une fois par tour. Si cette carte est Invoquée par Xyz en utilisant un monstre \"Exosœur\" comme Matériel : ce tour, aucun joueur ne peut activer d''effets de carte dans le Cimetière. Vous pouvez détacher 1 Matériel de cette carte, puis ciblez 1 monstre contrôlé par votre adversaire \; renvoyez-le à la main.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GRCR/GRCR-20.jpg', 'GUERRIER', 'XYZ', 2100, 1800, 'Les Grands Créateurs', TO_DATE('2022-01-27', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Numéro 17 : Dragon Léviathan', 'Monstre', 'eau', 3, '2 monstres de Niveau 3Une fois par tour : vous pouvez détacher 1 Matériel Xyz de cette carte \; cette carte gagne 500 ATK. Si cette carte n''a pas de Matériel Xyz, elle ne peut pas attaquer directement votre adversaire.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-0.jpg', 'DRAGON', 'XYZ', 2000, 0, 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Starlight Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Kuribah', 'Monstre', 'ténèbres', 1, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-1.jpg', 'DÉMON', 'EFFET', 300, 200, 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Kuribeille', 'Monstre', 'ténèbres', 1, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-2.jpg', 'DÉMON', 'EFFET', 300, 200, 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Kuribou', 'Monstre', 'ténèbres', 1, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-3.jpg', 'DÉMON', 'EFFET', 300, 200, 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Kuribeh', 'Monstre', 'ténèbres', 1, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-4.jpg', 'DÉMON', 'EFFET', 300, 200, 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Kuribabylon', 'Monstre', 'ténèbres', 5, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-5.jpg', 'DÉMON', 'EFFET', 1500, 1000, 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Crépuscule à Cinq Étoiles', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-6.jpg', 'NORMAL', 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Yowie', 'Monstre', 'terre', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-7.jpg', 'REPTILE', 'EFFET', 500, 500, 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Épée du Pingouin', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-8.jpg', 'ÉQUIPEMENT', 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Force D', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-9.jpg', 'NORMAL', 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Docteur D', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-10.jpg', 'NORMAL', 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dragonroid', 'Monstre', 'vent', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-11.jpg', 'MACHINE', 'EFFET', 2900, 1000, 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Choix de la Renaissance', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-12.jpg', 'NORMAL', 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Barrière de Glace', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-13.jpg', 'NORMAL', 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Chevalier de Glace', 'Monstre', 'eau', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-14.jpg', 'AQUA', 'EFFET', 1300, 1200, 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Invocation de la Tempête', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-15.jpg', 'NORMAL', 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Retour d''Ailes', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-16.jpg', 'NORMAL', 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Porteur du Bouclier Chevalier Noble', 'Monstre', 'lumière', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-17.jpg', 'GUERRIER', 'EFFET', 800, 1300, 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Destrier des Chevaliers Floraux', 'Monstre', 'vent', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-18.jpg', 'BÊTE', 'EFFET', 400, 800, 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Lancier Chevalier Noble', 'Monstre', 'lumière', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-19.jpg', 'GUERRIER', 'EFFET', 800, 400, 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Mina la Centauresse', 'Monstre', 'lumière', 6, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-20.jpg', 'BÊTE-GUERRIER', 'FUSION', 2200, 1600, 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'École de Zone', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-21.jpg', 'NORMAL', 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Porte Renferme-Âme', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-22.jpg', 'NORMAL', 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Carte de Piri Reis', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-23.jpg', 'NORMAL', 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Miroir de Glace', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BROL/BROL-24.jpg', 'NORMAL', 'Frères de Légende', TO_DATE('2021-12-02', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Alakan le Triomphe Harlequin', 'Monstre', 'lumière', 10, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-1.jpg', 'GUERRIER', 'EFFET', 0, 2500, 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Alakan le Triomphe Harlequin', 'Monstre', 'lumière', 10, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-1C.jpg', 'GUERRIER', 'EFFET', 0, 2500, 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Chevalier du Harlequin', 'Monstre', 'lumière', 5, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-2.jpg', 'GUERRIER', 'EFFET', 2000, 1400, 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Chevalier du Harlequin', 'Monstre', 'lumière', 5, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-2C.jpg', 'GUERRIER', 'EFFET', 2000, 1400, 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gardes Impériaux', 'Monstre', 'lumière', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-3.jpg', 'GUERRIER', 'EFFET', 1500, 1500, 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gardes Impériaux', 'Monstre', 'lumière', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-3C.jpg', 'GUERRIER', 'EFFET', 1500, 1500, 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Quinte du Harlequin', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-4.jpg', 'NORMAL', 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Quinte du Harlequin', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-4C.jpg', 'NORMAL', 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Fusion de Figure', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-5.jpg', 'NORMAL', 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Invocation à la Vitesse de l''Éclair', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-6.jpg', 'NORMAL', 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Remplacement du Harlequin', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-7.jpg', 'NORMAL', 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Cour des Cartes', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-8.jpg', 'NORMAL', 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Induction Magnétique', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-9.jpg', 'NORMAL', 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Hyper Canon XYZ', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-10.jpg', 'NORMAL', 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Idole aux Yeux d''Or', 'Monstre', 'ténèbres', 1, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-11.jpg', 'MAGICIEN', 'EFFET', 0, 0, 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Zolga le Prophète', 'Monstre', 'terre', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-12.jpg', 'ELFE', 'EFFET', 1700, 1200, 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Numéro F0 : Futur Draco Utopique', 'Monstre', 'lumière', 0, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-13.jpg', 'GUERRIER', 'XYZ', 3000, 2000, 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Numéro F0 : Futur Draco Utopique', 'Monstre', 'lumière', 0, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-13C.jpg', 'GUERRIER', 'XYZ', 3000, 2000, 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gilti-Gearfried le Chevalier d''Acier Magique', 'Monstre', 'lumière', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-14.jpg', 'GUERRIER', 'FUSION', 2700, 1600, 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gilti-Gearfried le Chevalier d''Acier Magique', 'Monstre', 'lumière', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-14C.jpg', 'GUERRIER', 'FUSION', 2700, 1600, 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Fille de Cristal', 'Monstre', 'eau', 1, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-15.jpg', 'MAGICIEN', 'EFFET', 200, 100, 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dholes Tindangle', 'Monstre', 'ténèbres', 5, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-16.jpg', 'DÉMON', 'FLIP', 1000, 1000, 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Princesse de la Rose', 'Monstre', 'terre', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-17.jpg', 'PLANTE', 'EFFET', 1200, 800, 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Roi Morph Stygi-Gel', 'Monstre', 'ténèbres', 1, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-18.jpg', 'DÉMON', 'SYNTONISEUR', 100, 100, 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Cloître des Roses Blanches', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/KICO/KICO-19.jpg', 'NORMAL', 'La Cour du Roi', TO_DATE('2021-07-08', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Nunu, la Rémanence Ogdoadique', 'Monstre', 'lumière', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-001.jpg', 'REPTILE', 'EFFET', 0, 0, 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Nauya, la Rémanence Ogdoadique', 'Monstre', 'ténèbres', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-002.jpg', 'REPTILE', 'EFFET', 0, 2000, 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Flogos, l''Infini Ogdoadique', 'Monstre', 'lumière', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-003.jpg', 'REPTILE', 'EFFET', 1800, 1400, 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Zohah, l''Infini Ogdoadique', 'Monstre', 'ténèbres', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-004.jpg', 'REPTILE', 'EFFET', 1500, 1700, 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Keurse, la Lumière Ogdoadique', 'Monstre', 'lumière', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-005.jpg', 'REPTILE', 'EFFET', 400, 2400, 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Aleirtt, les Ténèbres Ogdoadiques', 'Monstre', 'ténèbres', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-006.jpg', 'REPTILE', 'EFFET', 2000, 800, 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Aron, le Roi Ogdoadique', 'Monstre', 'lumière', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-007.jpg', 'REPTILE', 'EFFET', 2500, 2800, 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Amunessia, la Reine Ogdoadique', 'Monstre', 'ténèbres', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-008.jpg', 'REPTILE', 'EFFET', 2700, 2100, 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ogdoabyss, le Seigneur Ogdoadique', 'Monstre', 'lumière', 10, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-009.jpg', 'REPTILE', 'EFFET', 3100, 2200, 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Nénuphar Ogdoadique', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-010.jpg', 'NORMAL', 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Origine Ogdoadique', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-011.jpg', 'NORMAL', 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Vide Ogdoadique', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-012.jpg', 'NORMAL', 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Appel Ogdoadique', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-013.jpg', 'NORMAL', 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'DoSolfaccord Cutia', 'Monstre', 'terre', 1, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-014.jpg', 'ELFE', 'PENDULE', 100, 400, 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'RéSolfaccord Dreamia', 'Monstre', 'vent', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-015.jpg', 'ELFE', 'PENDULE', 600, 400, 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'MiSolfaccord Éliteia', 'Monstre', 'eau', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-016.jpg', 'ELFE', 'PENDULE', 1100, 400, 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'FaSolfaccord Fancia', 'Monstre', 'feu', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-017.jpg', 'ELFE', 'PENDULE', 1600, 400, 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'SolSolfaccord Gracia', 'Monstre', 'eau', 5, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-018.jpg', 'ELFE', 'PENDULE', 2100, 1400, 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'LaSolfaccord Angélia', 'Monstre', 'feu', 6, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-019.jpg', 'ELFE', 'PENDULE', 2300, 1400, 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'SiSolfaccord Beautia', 'Monstre', 'terre', 7, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-020.jpg', 'ELFE', 'PENDULE', 2500, 1400, 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'DoSolfaccord Coolia', 'Monstre', 'vent', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-021.jpg', 'ELFE', 'PENDULE', 2700, 1400, 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Élégance Solfaccord', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-022.jpg', 'NORMAL', 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gamme Solfaccord', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-023.jpg', 'NORMAL', 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Harmonie Solfaccord', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-024.jpg', 'NORMAL', 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Orchestre Solfaccord', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/ANGU/ANGU-025.jpg', 'NORMAL', 'Les Anciens Gardiens', TO_DATE('2021-05-06', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Crowley, Magistus des Grimoires', 'Monstre', 'ténèbres', 4, 'Vous pouvez envoyer 1 monstre Magicien depuis votre main ou Terrain face recto au Cimetière \; Invoquez Spécialement cette carte depuis votre main. Vous pouvez déclarer 1 Attribut \; jusqu''à la fin de ce tour, cette carte devient de cet Attribut. Vous pouvez bannir cette carte depuis votre Cimetière, puis ciblez 1 monstre \"Magistus\" que vous contrôlez \; équipez-le avec 1 monstre \"Magistus\" (monstres de Niveau 4 exclus) depuis votre Cimetière. Vous ne pouvez utiliser chaque effet de \"Crowley, Magistus des Grimoires\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-1.jpg', 'MAGICIEN', 'EFFET', 1800, 1000, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Zoroa, Magistus de la Flamme', 'Monstre', 'feu', 4, 'Vous pouvez cibler 1 monstre \"Magistus\" que vous contrôlez \; équipez-le avec 1 monstre \"Magistus\" depuis votre Extra Deck. Si cette carte est équipée avec une Carte Monstre \"Magistus\" : vous pouvez Invoquer Spécialement 1 monstre Magicien de Niveau 4 (\"Zoroa, Magistus de la Flamme\" exclu) depuis votre main ou Cimetière en Position de Défense, mais ses effets sont annulés. Vous ne pouvez utiliser chaque effet de \"Zoroa, Magistus de la Flamme\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-2.jpg', 'MAGICIEN', 'SYNTONISEUR', 1500, 1500, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Rilliona, Magistus du Verre', 'Monstre', 'lumière', 4, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez activer 1 de ces effets \;
-----●Ajoutez 1 Magie/Piège \"Magistus\" depuis votre Deck à votre main.
-----●Renvoyez 1 de vos monstres Magicien de max. Niveau 4 bannis à votre Cimetière.
-----Vous pouvez bannir cette carte depuis votre Cimetière, puis ciblez 1 monstre \"Magistus\" que vous contrôlez \; équipez-le avec 1 monstre \"Magistus\" (monstres de Niveau 4 exclus) depuis votre Cimetière.
-----Vous ne pouvez utiliser chaque effet de \"Rilliona, Magistus du Verre\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-3.jpg', 'MAGICIEN', 'EFFET', 800, 1800, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Rilliona, Magistus du Verre', 'Monstre', 'lumière', 4, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez activer 1 de ces effets \;
-----●Ajoutez 1 Magie/Piège \"Magistus\" depuis votre Deck à votre main.
-----●Renvoyez 1 de vos monstres Magicien de max. Niveau 4 bannis à votre Cimetière.
-----Vous pouvez bannir cette carte depuis votre Cimetière, puis ciblez 1 monstre \"Magistus\" que vous contrôlez \; équipez-le avec 1 monstre \"Magistus\" (monstres de Niveau 4 exclus) depuis votre Cimetière.
-----Vous ne pouvez utiliser chaque effet de \"Rilliona, Magistus du Verre\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-3c.jpg', 'MAGICIEN', 'EFFET', 800, 1800, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Endymion, Magistus de la Maîtrise', 'Monstre', 'eau', 4, 'Vous pouvez cibler 1 monstre \"Magistus\" que vous contrôlez \; équipez-le avec 1 monstre \"Magistus\" depuis votre Extra Deck. Vous pouvez cibler 1 Magie face recto que vous contrôlez \; détruisez-la, et si vous le faites, piochez 1 carte, puis placez 1 carte depuis votre main au-dessous du Deck. Vous ne pouvez utiliser chaque effet de \"Endymion, Magistus de la Maîtrise\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-4.jpg', 'MAGICIEN', 'EFFET', 1300, 1700, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Aiwass, Esprit de la Magie Magistus', 'Monstre', 'vent', 8, '1 monstre \"Magistus\" + 1 monstre Magicien
-----Tant que cette carte est une Carte d''Équipement, le monstre équipé gagne 1000 ATK/DEF. Durant la Main Phase (Effet Rapide) : vous pouvez cibler 1 autre monstre face recto sur le Terrain \; équipez-lui cette carte que vous contrôlez. Si cette carte était équipée à un monstre de l''adversaire par cet effet, prenez le contrôle du monstre équipé, et aussi, il ne peut pas activer ses effets. Vous ne pouvez utiliser cet effet de \"Aiwass, Esprit de la Magie Magistus\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-5.jpg', 'DÉMON', 'FUSION', 2000, 2800, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Vahram, Dragon de la Divinité Magistus', 'Monstre', 'feu', 8, '1 Syntoniseur + 1+ monstre non-Syntoniseur
-----Tant que cette carte est une Carte d''Équipement, le monstre équipé ne peut pas être détruit par des effets de Magie/Piège de votre adversaire. Vous ne pouvez utiliser chacun des effets suivants de \"Vahram, Dragon de la Divinité Magistus\" qu''une fois par tour. Si cette carte Invoquée par Synchronisation est détruite : vous pouvez détruire toutes les cartes face recto contrôlées par votre adversaire. Au début de la Damage Step, si le monstre équipé avec cette carte combat un monstre de l''adversaire : vous pouvez détruire le monstre de l''adversaire.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-6.jpg', 'DRAGON', 'SYNCHRO', 2500, 2900, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ninaruru, Déesse de Verre Magistus', 'Monstre', 'terre', 4, '2 monstres Magicien de Niveau 4
-----Tant que cette carte est une Carte d''Équipement, le monstre équipé peut faire max. 2 attaques sur des monstres durant chaque Battle Phase. Vous ne pouvez utiliser chacun des effets suivants de \"Ninaruru, Déesse de Verre Magistus\" qu''une fois par tour. Vous pouvez détacher 1 Matériel de cette carte, puis ciblez 1 monstre Magicien de min. Niveau 4 dans votre Cimetière \; ajoutez-le à votre main. Tant que cette carte est équipée à un monstre : vous pouvez cibler 1 carte \"Magistus\" dans votre Zone Magie & Piège et 1 Magie/Piège contrôlé par votre adversaire \; détruisez-les.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-7.jpg', 'ROCHER', 'XYZ', 1800, 2400, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ninaruru, Déesse de Verre Magistus', 'Monstre', 'terre', 4, '2 monstres Magicien de Niveau 4
-----Tant que cette carte est une Carte d''Équipement, le monstre équipé peut faire max. 2 attaques sur des monstres durant chaque Battle Phase. Vous ne pouvez utiliser chacun des effets suivants de \"Ninaruru, Déesse de Verre Magistus\" qu''une fois par tour. Vous pouvez détacher 1 Matériel de cette carte, puis ciblez 1 monstre Magicien de min. Niveau 4 dans votre Cimetière \; ajoutez-le à votre main. Tant que cette carte est équipée à un monstre : vous pouvez cibler 1 carte \"Magistus\" dans votre Zone Magie & Piège et 1 Magie/Piège contrôlé par votre adversaire \; détruisez-les.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-7c.jpg', 'ROCHER', 'XYZ', 1800, 2400, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Artémis, Jeune Fille de la Lune Magistus', 'Monstre', 'lumière', 0, '1 monstre Magicien de max. Niveau 4
-----Si un ou plusieurs autres monstres \"Magistus\" sont Invoqués Normalement ou Spécialement tant que vous contrôlez ce monstre (sauf durant la Damage Step) : vous pouvez cibler 1 de ces monstres \; équipez-lui cette carte que vous contrôlez. Tant que cette carte est équipée à un monstre : vous pouvez ajouter 1 monstre \"Magistus\" depuis votre Deck à votre main. Vous ne pouvez utiliser chaque effet de \"Artémis, Jeune Fille de la Lune Magistus\" qu''une fois par tour. Vous ne pouvez Invoquer Spécialement \"Artémis, Jeune Fille de la Lune Magistus\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-8c.jpg', 'MAGICIEN', 'LIEN', 800, 0, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Artémis, Jeune Fille de la Lune Magistus', 'Monstre', 'lumière', 0, '1 monstre Magicien de max. Niveau 4
-----Si un ou plusieurs autres monstres \"Magistus\" sont Invoqués Normalement ou Spécialement tant que vous contrôlez ce monstre (sauf durant la Damage Step) : vous pouvez cibler 1 de ces monstres \; équipez-lui cette carte que vous contrôlez. Tant que cette carte est équipée à un monstre : vous pouvez ajouter 1 monstre \"Magistus\" depuis votre Deck à votre main. Vous ne pouvez utiliser chaque effet de \"Artémis, Jeune Fille de la Lune Magistus\" qu''une fois par tour. Vous ne pouvez Invoquer Spécialement \"Artémis, Jeune Fille de la Lune Magistus\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-8.jpg', 'MAGICIEN', 'LIEN', 800, 0, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Trismagistus', 'Magie', 'La première fois que chaque monstre \"Magistus\" équipé avec une Carte d''Équipement va être détruit au combat chaque tour, il n''est pas détruit. Vous ne pouvez utiliser qu''1 des effets suivants de \"Trismagistus\" par tour, et uniquement une fois le tour.
-----●Durant votre Main Phase : vous pouvez Invoquer Spécialement 1 monstre Magicien de Niveau 4 depuis votre main.
-----●Vous pouvez envoyer cette carte face recto au Cimetière \; Invoquez Spécialement un nombre de votre choix de monstres \"Magistus\" de noms différents depuis votre main.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-9.jpg', 'NORMAL', 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Théurgie Magistus', 'Magie', 'Ciblez 1 monstre \"Magistus\" que vous contrôlez \; équipez-le avec 1 monstre \"Magistus\" (monstres de Niveau 4 exclus) depuis votre Extra Deck, Cimetière ou Terrain face recto. Si vous avez min. 1 Monstre Fusion \"Magistus\", min. 1 Monstre Synchro \"Magistus\", min. 1 Monstre Xyz \"Magistus\" et min. 1 Monstre Lien \"Magistus\" dans votre Cimetière, vous pouvez l''équiper avec 1 Monstre Fusion, Synchro, Xyz ou Lien non-\"Magistus\" depuis votre Extra Deck, à la place. Vous ne pouvez activer \"Théurgie Magistus\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-10.jpg', 'NORMAL', 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Invokhation Magistus', 'Magie', 'Invoquez par Fusion 1 Monstre Fusion depuis votre Extra Deck, en utilisant des monstres depuis votre main ou Terrain comme Matériel (un monstre Magicien inclus). Si vous Invoquez un Monstre Fusion \"Magistus\" de cette façon, vous pouvez aussi utiliser des monstres dans vos Zones Magie & Piège qui sont équipés à un monstre \"Magistus\". Vous ne pouvez activer qu''1 \"Invokhation Magistus\" par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-11.jpg', 'NORMAL', 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Vritra Magistus', 'Magie', 'Ciblez 1 monstre \"Magistus\" de max. Niveau 4 dans votre Cimetière \; Invoquez-le Spécialement. Si une ou plusieurs cartes \"Magistus\" dans votre Zone Magie & Piège vont être détruites par un effet de carte de votre adversaire, vous pouvez bannir cette carte depuis votre Cimetière à la place. Vous ne pouvez utiliser chaque effet de \"Vritra Magistus\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-12.jpg', 'NORMAL', 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Live☆Jumelle Ki-sikil', 'Monstre', 'lumière', 2, 'Chaque fois qu''un monstre de l''adversaire déclare une attaque, vous gagnez 500 LP. Si cette carte est invoquée Normalement ou Spécialement et que vous ne contrôlez aucun autre monstre : vous pouvez Invoquer Spécialement 1 monstre \"Lil-la\" depuis votre main ou Deck. Vous ne pouvez utiliser cet effet de \"Live Jumelle Ki-sikil\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-13.jpg', 'CYBERSE', 'EFFET', 500, 0, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Live☆Jumelle Ki-sikil', 'Monstre', 'lumière', 2, 'Chaque fois qu''un monstre de l''adversaire déclare une attaque, vous gagnez 500 LP. Si cette carte est invoquée Normalement ou Spécialement et que vous ne contrôlez aucun autre monstre : vous pouvez Invoquer Spécialement 1 monstre \"Lil-la\" depuis votre main ou Deck. Vous ne pouvez utiliser cet effet de \"Live Jumelle Ki-sikil\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-13c.jpg', 'CYBERSE', 'EFFET', 500, 0, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Live☆Jumelle Lil-la', 'Monstre', 'ténèbres', 2, 'Votre adversaire doit payer 500 LP pour déclarer une attaque. Si cette carte est invoquée Normalement ou Spécialement et que vous ne contrôlez aucun autre monstre : vous pouvez Invoquer Spécialement 1 monstre \"Ki-sikil\" depuis votre main ou Deck. Vous ne pouvez utiliser cet effet de \"Live Jumelle Lil-la\" qu''une fois par tour. ', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-14c.jpg', 'CYBERSE', 'EFFET', 500, 0, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Live☆Jumelle Lil-la', 'Monstre', 'ténèbres', 2, 'Votre adversaire doit payer 500 LP pour déclarer une attaque. Si cette carte est invoquée Normalement ou Spécialement et que vous ne contrôlez aucun autre monstre : vous pouvez Invoquer Spécialement 1 monstre \"Ki-sikil\" depuis votre main ou Deck. Vous ne pouvez utiliser cet effet de \"Live Jumelle Lil-la\" qu''une fois par tour. ', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-14.jpg', 'CYBERSE', 'EFFET', 500, 0, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Evil★Jumelle Ki-sikil', 'Monstre', 'lumière', 0, '2 monstres (un monstre \"Ki-sikil\" inclus)
-----Si cette carte est Invoquée Spécialement et que vous contrôlez un autre monstre \"Lil-la\" : vous pouvez piocher une carte. Durant la Main Phase, si vous ne contrôlez aucun monstre \"Lil-la\" (effet rapide) : vous pouvez Invoquer Spécialement 1 monstre \"Lil-la\" depuis votre cimetière, et aussi, vous ne pouvez pas invoquer spécialement de monstres (monstres Démon exclus) depuis l''extra deck le reste de ce tour. Vous ne pouvez utiliser chaque effet de \"Evil Jumelle Ki-sikil\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-15.jpg', 'DÉMON', 'LIEN', 1100, 0, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Evil★Jumelle Ki-sikil', 'Monstre', 'lumière', 0, '2 monstres (un monstre \"Ki-sikil\" inclus)
-----Si cette carte est Invoquée Spécialement et que vous contrôlez un autre monstre \"Lil-la\" : vous pouvez piocher une carte. Durant la Main Phase, si vous ne contrôlez aucun monstre \"Lil-la\" (effet rapide) : vous pouvez Invoquer Spécialement 1 monstre \"Lil-la\" depuis votre cimetière, et aussi, vous ne pouvez pas invoquer spécialement de monstres (monstres Démon exclus) depuis l''extra deck le reste de ce tour. Vous ne pouvez utiliser chaque effet de \"Evil Jumelle Ki-sikil\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-15c.jpg', 'DÉMON', 'LIEN', 1100, 0, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Evil★Jumelle Lil-la', 'Monstre', 'ténèbres', 0, '2 monstres (un monstre \"Lil-la\" inclus)
-----Si cette carte est Invoquée Spécialement et que vous contrôlez un monstre \"Ki-sikil\" : vous pouvez cibler 1 carte sur le Terrain \; détruisez-la. Durant la Main Phase, si vous ne contrôlez aucun monstre \"Ki-sikil\" (Effet Rapide) : vous pouvez Invoquer Spécialement 1 monstre \"Ki-sikil\" depuis votre Cimetière, et aussi, vous ne pouvez pas Invoquer Spécialement de monstres (monstres Démon exclus) depuis l''Extra Deck le reste de ce tour. Vous ne pouvez utiliser chaque effet de \"Evil★Jumelle Lil-la\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-16.jpg', 'DÉMON', 'LIEN', 1100, 0, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Evil★Jumelle Lil-la', 'Monstre', 'ténèbres', 0, '2 monstres (un monstre \"Lil-la\" inclus)
-----Si cette carte est Invoquée Spécialement et que vous contrôlez un monstre \"Ki-sikil\" : vous pouvez cibler 1 carte sur le Terrain \; détruisez-la. Durant la Main Phase, si vous ne contrôlez aucun monstre \"Ki-sikil\" (Effet Rapide) : vous pouvez Invoquer Spécialement 1 monstre \"Ki-sikil\" depuis votre Cimetière, et aussi, vous ne pouvez pas Invoquer Spécialement de monstres (monstres Démon exclus) depuis l''Extra Deck le reste de ce tour. Vous ne pouvez utiliser chaque effet de \"Evil★Jumelle Lil-la\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-16c.jpg', 'DÉMON', 'LIEN', 1100, 0, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Evil★Jumelles Ki-sikil et Lil-la', 'Monstre', 'ténèbres', 8, 'Ni Invocable Normalement ni Posable Normalement. Uniquement Invocable Spécialement (depuis votre main ou Cimetière) en Sacrifiant 2 Monstres Lien. Si cette carte est Invoquée Spécialement : vous pouvez activer cet effet \; si votre adversaire contrôle min. 3 cartes, il doit envoyer des cartes au Cimetière jusqu''à contrôler 2 cartes. Vous ne pouvez utiliser cet effet de \"Evil★Jumelles Ki-sikil et Lil-la\" qu''une fois par tour. Tant que vous avez un monstre \"Ki-sikil\" dans votre Cimetière et que vous avez un monstre \"Lil-la\" dans votre Cimetière, cette carte gagne 2200 ATK/DEF.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-17.jpg', 'DÉMON', 'EFFET', 2200, 2200, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Evil★Jumelles Ki-sikil et Lil-la', 'Monstre', 'ténèbres', 8, 'Ni Invocable Normalement ni Posable Normalement. Uniquement Invocable Spécialement (depuis votre main ou Cimetière) en Sacrifiant 2 Monstres Lien. Si cette carte est Invoquée Spécialement : vous pouvez activer cet effet \; si votre adversaire contrôle min. 3 cartes, il doit envoyer des cartes au Cimetière jusqu''à contrôler 2 cartes. Vous ne pouvez utiliser cet effet de \"Evil★Jumelles Ki-sikil et Lil-la\" qu''une fois par tour. Tant que vous avez un monstre \"Ki-sikil\" dans votre Cimetière et que vous avez un monstre \"Lil-la\" dans votre Cimetière, cette carte gagne 2200 ATK/DEF.', 'https://www.otk-expert.fr/cartes/yugioh_ext/GEIM/GEIM-17c.jpg', 'DÉMON', 'EFFET', 2200, 2200, 'L''Impact de la Genèse', TO_DATE('2020-12-03', 'YYYY-MM-DD'), 'Collectors Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Régénération de la Magie des Ténèbres', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-1.jpg', 'NORMAL', 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Rampant Puissant', 'Monstre', 'terre', 7, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-2.jpg', 'MACHINE', 'EFFET', 2700, 2000, 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Alarme d''Intrusion - Alerte Jaune', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-3.jpg', 'NORMAL', 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Torpille Pingouin', 'Monstre', 'eau', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-4.jpg', 'AQUA', 'EFFET', 550, 300, 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Soldat Météo', 'Monstre', 'terre', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-5.jpg', 'ROCHER', 'EFFET', 2000, 1200, 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Guerrier Fossile Roi Squelette', 'Monstre', 'terre', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-6.jpg', 'ROCHER', 'FUSION', 2800, 1300, 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Guerrier Fossile Chevalier Squelette', 'Monstre', 'terre', 6, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-7.jpg', 'ROCHER', 'FUSION', 2400, 1100, 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Guerrier Fossile Monstre Squelette', 'Monstre', 'terre', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-8.jpg', 'ROCHER', 'FUSION', 2000, 800, 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dragon Fossile Tyrannosquelette', 'Monstre', 'terre', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-9.jpg', 'ROCHER', 'FUSION', 3500, 0, 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dragon Fossile Skullgar', 'Monstre', 'terre', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-10.jpg', 'ROCHER', 'FUSION', 2500, 0, 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Fusion Fossile', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-11.jpg', 'NORMAL', 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Flux Intemporel', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-12.jpg', 'NORMAL', 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Inspection de Spécimens', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-13.jpg', 'NORMAL', 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Rupture Miracle', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-14.jpg', 'NORMAL', 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Vague Psychique', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-15.jpg', 'JEU RAPIDE', 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ours Blanc Blindé', 'Monstre', 'eau', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-16.jpg', 'BÊTE', 'EFFET', 1800, 1400, 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dernières Lueurs', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-17.jpg', 'NORMAL', 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Pioche à Haut Régime', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-18.jpg', 'NORMAL', 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dragon Paradigme Corrompu', 'Monstre', 'ténèbres', 10, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-19.jpg', 'DRAGON', 'EFFET', 4000, 4000, 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Mur Numeron', 'Monstre', 'ténèbres', 1, 'Si vous ne contrôlez aucune carte (\"Mur Numeron\" exclu) (Effet Rapide) : vous pouvez envoyer cette carte depuis votre main ou Terrain au Cimetière \; activez 1 \"Réseau Numeron\" directement depuis votre main ou Deck. Vous ne pouvez utiliser cet effet de \"Mur Numeron\" qu''une fois par tour. Lorsque vous recevez des dommages de combat : vous pouvez Invoquer Spécialement cette carte depuis votre main, et si vous le faites, terminez la Battle Phase après la Damage Step.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-20.jpg', 'DÉMON', 'EFFET', 0, 0, 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Numéro C1 : Porte du Chaos Numeron Sunya', 'Monstre', 'ténèbres', 2, '4 monstres de Niveau 2
-----Vous pouvez aussi Invoquer par Xyz cette carte en utilisant \"Numéro 1 : Porte Numeron Ekam\" que vous contrôlez comme Matériel. (Transférez ses Matériels à cette carte.) Si cette carte est Invoquée par Xyz : bannissez tous les monstres sur le Terrain. Une fois par tour, durant votre prochaine Standby Phase après que cette carte a été bannie : vous pouvez Invoquer Spécialement cette carte bannie, puis si \"Réseau Numeron\" est dans votre Zone Terrain, infligez des dommages à votre adversaire égaux à la somme des ATK de tous les Monstres Xyz bannis.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-21.jpg', 'MACHINE', 'XYZ', 2000, 1000, 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Numéro 1 : Porte Numeron Ekam', 'Monstre', 'lumière', 1, '3 monstres de Niveau 1
-----Non destructible au combat. À la fin de la Damage Step, si cette carte a combattu un monstre de l''adversaire : vous pouvez détacher 1 Matériel de cette carte \; jusqu''à la fin de ce tour, doublez l''ATK de tous les monstres \"Numeron\" que vous contrôlez actuellement.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-22.jpg', 'MACHINE', 'XYZ', 1000, 100, 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Numéro 2 : Porte Numeron Dve', 'Monstre', 'lumière', 1, '3 monstres de Niveau 1
-----Non destructible au combat. À la fin de la Damage Step, si cette carte a combattu un monstre de l''adversaire : vous pouvez détacher 1 Matériel de cette carte \; jusqu''à la fin de ce tour, doublez l''ATK de tous les monstres \"Numeron\" que vous contrôlez actuellement.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-23.jpg', 'MACHINE', 'XYZ', 1000, 100, 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Numéro 3 : Porte Numeron Trini', 'Monstre', 'lumière', 1, '3 monstres de Niveau 1
-----Non destructible au combat. À la fin de la Damage Step, si cette carte a combattu un monstre de l''adversaire : vous pouvez détacher 1 Matériel de cette carte \; jusqu''à la fin de ce tour, doublez l''ATK de tous les monstres \"Numeron\" que vous contrôlez actuellement.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-24.jpg', 'MACHINE', 'XYZ', 1000, 100, 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Numéro 4 : Porte Numeron Catvari', 'Monstre', 'lumière', 1, '3 monstres de Niveau 1
-----Non destructible au combat. À la fin de la Damage Step, si cette carte a combattu un monstre de l''adversaire : vous pouvez détacher 1 Matériel de cette carte \; jusqu''à la fin de ce tour, doublez l''ATK de tous les monstres \"Numeron\" que vous contrôlez actuellement.', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLAR/BLAR-25.jpg', 'MACHINE', 'XYZ', 1000, 100, 'Batailles de Legende : Armageddon', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Soldat du Lustre Noir Toon', 'Monstre', 'terre', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-1.jpg', 'GUERRIER', 'TOON', 3000, 2500, 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dame Harpie Toon', 'Monstre', 'vent', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-2.jpg', 'BÊTE AILÉE', 'TOON', 1300, 1400, 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Marque-Page Toon', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-3.jpg', 'NORMAL', 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Tourne-Page Toon', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-4.jpg', 'JEU RAPIDE', 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Terreur Toon', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-5.jpg', 'CONTRE', 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Le Créateur du Chaos', 'Monstre', 'ténèbres', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-6.jpg', 'TONNERRE', 'EFFET', 2300, 3000, 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dédale du Chaos', 'Monstre', 'ténèbres', 7, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-7.jpg', 'SERPENT DE MER', 'EFFET', 2600, 1500, 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Valkyrie du Chaos', 'Monstre', 'lumière', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-8.jpg', 'ELFE', 'EFFET', 1800, 1050, 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Espace du Chaos', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-9.jpg', 'NORMAL', 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Chaos Éternel', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-10.jpg', 'NORMAL', 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Renaud, Chevalier Noble Inferno', 'Monstre', 'feu', 1, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-11.jpg', 'GUERRIER', 'EFFET', 500, 200, 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gearfried Phénix Immortel', 'Monstre', 'feu', 9, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-12.jpg', 'GUERRIER', 'EFFET', 3000, 2200, 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Chevalier de la Sublimation', 'Monstre', 'feu', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-13.jpg', 'GUERRIER', 'EFFET', 1300, 200, 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Roland, Chevalier Noble Inferno', 'Monstre', 'feu', 1, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-14.jpg', 'GUERRIER', 'EFFET', 500, 500, 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Evêque d''Incantation', 'Monstre', 'feu', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-15.jpg', 'GUERRIER', 'GÉMEAU', 1500, 1000, 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Reproduction d''Armes', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-16.jpg', 'CONTINU', 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Épée Supermagique de Raptinus', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-17.jpg', 'ÉQUIPEMENT', 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Mélange de Styles', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-18.jpg', 'NORMAL', 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ablation des Gémeaux', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-19.jpg', 'CONTINU', 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ange Peluchimal', 'Monstre', 'lumière', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-20.jpg', 'ELFE', 'PENDULE', 600, 1200, 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Meister Frourreur', 'Monstre', 'ténèbres', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-21.jpg', 'DÉMON', 'PENDULE', 0, 0, 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Codeur Générateur', 'Monstre', 'terre', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-22.jpg', 'CYBERSE', 'EFFET', 1300, 500, 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Valkyrie-Sigrun', 'Monstre', 'lumière', 9, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-23.jpg', 'ELFE', 'EFFET', 2200, 2400, 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Magicien de l''Espoir', 'Monstre', 'lumière', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-24.jpg', 'MAGICIEN', 'XYZ', 2500, 2000, 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Pilote Structure-PSY', 'Monstre', 'lumière', 6, 'Un soldat Psychique qui combat les Forces de Sécurité en surfant sur des courants de foudre à l''aide d''un amplificateur autonome \"Structure-PSY\".', 'https://www.otk-expert.fr/cartes/yugioh_ext/TOCH/TOCH-25.jpg', 'PSYCHIQUE', 'AUCUNE', 2500, 0, 'Le Chaos Toon', TO_DATE('2020-06-18', 'YYYY-MM-DD'), 'Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Chercheur Inflexcipateur', 'Monstre', 'terre', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-1.jpg', 'ROCHER', 'SYNTONISEUR', 1200, 1000, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Rechercheuse Inflexcipateur', 'Monstre', 'terre', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-2.jpg', 'ROCHER', 'SYNTONISEUR', 100, 2100, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Analyseur Inflexcipateur', 'Monstre', 'terre', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-3.jpg', 'ROCHER', 'SYNTONISEUR', 1500, 700, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Cristal Inflexcipateur - Lionite', 'Monstre', 'feu', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-4.jpg', 'ROCHER', 'EFFET', 0, 2200, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Cristal Inflexcipateur - Raptite', 'Monstre', 'vent', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-5.jpg', 'ROCHER', 'EFFET', 0, 2200, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Cristal Inflexcipateur - Dragite', 'Monstre', 'eau', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-6.jpg', 'ROCHER', 'EFFET', 0, 2200, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Éveillé Inflexcipateur - Lionite', 'Monstre', 'feu', 6, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-7.jpg', 'ROCHER', 'SYNCHRO', 2400, 2200, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Éveillé Inflexcipateur - Raptite', 'Monstre', 'vent', 6, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-8.jpg', 'ROCHER', 'SYNCHRO', 2200, 2800, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Éveillé Inflexcipateur - Dragite', 'Monstre', 'eau', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-9.jpg', 'ROCHER', 'SYNCHRO', 3000, 2200, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Laputite Inflexcipateur', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-10.jpg', 'TERRAIN', 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Signes Inflexcipateur', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-11.jpg', 'NORMAL', 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Apaisement Inflexcipateur', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-12.jpg', 'NORMAL', 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Résonance Inflexcipateur', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-13.jpg', 'CONTRE', 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Pétale Rikka', 'Monstre', 'eau', 1, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-14.jpg', 'PLANTE', 'EFFET', 0, 0, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Primula la Féé Rikka', 'Monstre', 'eau', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-15.jpg', 'PLANTE', 'EFFET', 800, 1800, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Cyclamen la Féé Rikka', 'Monstre', 'eau', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-16.jpg', 'PLANTE', 'EFFET', 1800, 800, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Mudan la Féé Rikka', 'Monstre', 'eau', 6, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-17.jpg', 'PLANTE', 'EFFET', 1000, 2400, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Érica la Féé Rikka', 'Monstre', 'eau', 6, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-18.jpg', 'PLANTE', 'EFFET', 2400, 1000, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Perce-Neige la Féé Rikka', 'Monstre', 'eau', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-19.jpg', 'PLANTE', 'EFFET', 1200, 2600, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Hellébore la Féé Rikka', 'Monstre', 'eau', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-20.jpg', 'PLANTE', 'EFFET', 2600, 1200, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Kanzashi la Reine Rikka', 'Monstre', 'eau', 6, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-21.jpg', 'PLANTE', 'XYZ', 2400, 2400, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Larme la Reine Rikka', 'Monstre', 'eau', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-22.jpg', 'PLANTE', 'XYZ', 2800, 2800, 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Glamour Rikka', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-23.jpg', 'NORMAL', 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Bourrasques Rikka', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-24.jpg', 'CONTINU', 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Tranquillité Rikka', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SESL/SESL-25.jpg', 'NORMAL', 'Les Pourfendeurs Secrets', TO_DATE('2020-04-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Sigma Mathmech', 'Monstre', 'lumière', 4, 'Si vous ne contrôlez aucun monstre dans la Zone Monstre Extra, tant que cette carte est dans votre main ou Cimetière : vous pouvez Invoquer Spécialement cette carte, mais bannissez-la lorsqu''elle quitte le Terrain, et aussi, vous ne pouvez pas Invoquer Spécialement de monstres (monstres Cyberse exclus) depuis l''Extra Deck le reste de ce tour. Vous ne pouvez utiliser cet effet de \"Sigma Mathmech\" qu''une fois par tour. Si cette carte que vous contrôlez est utilisée comme Matériel Synchro pour un monstre \"Mathmech\", vous pouvez la traiter comme non-Syntoniseur.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-1.jpg', 'CYBERSE', 'SYNTONISEUR', 1000, 1500, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Nabla Mathmech', 'Monstre', 'ténèbres', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-2.jpg', 'CYBERSE', 'SYNTONISEUR', 1000, 1500, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Addition Mathmech', 'Monstre', 'feu', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-3.jpg', 'CYBERSE', 'EFFET', 1000, 1000, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Soustraction Mathmech', 'Monstre', 'feu', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-4.jpg', 'CYBERSE', 'EFFET', 1000, 1000, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Multiplication Mathmech', 'Monstre', 'terre', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-5.jpg', 'CYBERSE', 'EFFET', 500, 2000, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Division Mathmech', 'Monstre', 'terre', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-6.jpg', 'CYBERSE', 'EFFET', 1500, 1000, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Magma Géomathmech', 'Monstre', 'feu', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-7.jpg', 'CYBERSE', 'SYNCHRO', 2500, 0, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Sigma Final Géomathmech', 'Monstre', 'feu', 12, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-8.jpg', 'CYBERSE', 'SYNCHRO', 3000, 0, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Laplacien Primathmech', 'Monstre', 'terre', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-9.jpg', 'CYBERSE', 'XYZ', 2000, 0, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Équation Mathmech', 'Magie', 'Ciblez 1 monstre \"Mathmech\" dans votre Cimetière \; Invoquez-le Spécialement, et si vous le faites, il gagne 1000 ATK jusqu''à la fin de ce tour. Vous ne pouvez activer qu''1 \"Équation Mathmech\" par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-10.jpg', 'NORMAL', 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Nayuta Milliardlame Mathmech', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-11.jpg', 'ÉQUIPEMENT', 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Superfactorielle Mathmech', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-12.jpg', 'NORMAL', 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Induction Mathmech', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-13.jpg', 'CONTINU', 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Infirmière Dragonirène', 'Monstre', 'terre', 2, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez cibler 1 monstre \"Dragonirène\" de max. Niveau 4 (\"Infirmière Dragonirène\" exclu) dans votre Cimetière \; Invoquez-le Spécialement. Au début de la Battle Phase : vous pouvez renvoyer cette carte à la main, et si vous le faites, Invoquez Spécialement 1 monstre \"Dragonirène\" de Niveau 7 depuis votre main ou Cimetière. Vous ne pouvez utiliser chaque effet de \"Infirmière Dragonirène\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-14.jpg', 'DRAGON', 'EFFET', 500, 1600, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dragonirène Ernus', 'Monstre', 'terre', 7, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-15.jpg', 'DRAGON', 'EFFET', 2600, 1600, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Linge Dragonirène', 'Monstre', 'eau', 2, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez envoyer les 3 cartes du dessus de votre Deck au Cimetière. Au début de la Battle Phase : vous pouvez renvoyer cette carte à la main, et si vous le faites, Invoquez Spécialement 1 monstre \"Dragonirène\" de Niveau 7 depuis votre main ou Cimetière. Vous ne pouvez utiliser chaque effet de \"Linge Dragonirène\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-16.jpg', 'DRAGON', 'EFFET', 500, 1600, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dragonirène Nudyarl', 'Monstre', 'eau', 7, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-17.jpg', 'DRAGON', 'EFFET', 2600, 1600, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Cuisine Dragonirène', 'Monstre', 'feu', 3, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez ajouter 1 monstre \"Dragonirène\" (\"Cuisine Dragonirène\" exclu) depuis votre Deck à votre main, puis envoyez 1 monstre \"Dragonirène\" depuis votre main au Cimetière. Au début de la Battle Phase : vous pouvez renvoyer cette carte à la main, et si vous le faites, Invoquez Spécialement 1 monstre \"Dragonirène\" de Niveau 8 depuis votre main ou Cimetière. Vous ne pouvez utiliser chaque effet de \"Cuisine Dragonirène\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-18.jpg', 'DRAGON', 'EFFET', 500, 1700, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dragonirène Tinkhec', 'Monstre', 'feu', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-19.jpg', 'DRAGON', 'EFFET', 2700, 1700, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Petit Salon Dragonirène', 'Monstre', 'vent', 3, 'Si cette carte est Invoquée Normalement ou Spécialement : vous pouvez envoyer 1 carte \"Dragonirène\" (\"Petit Salon Dragonirène\" exclu) depuis votre Deck au Cimetière. Au début de la Battle Phase : vous pouvez renvoyer cette carte à la main, et si vous le faites, Invoquez Spécialement 1 monstre \"Dragonirène\" de Niveau 8 depuis votre main ou Cimetière. Vous ne pouvez utiliser chaque effet de \"Petit Salon Dragonirène\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-20.jpg', 'DRAGON', 'EFFET', 500, 1700, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dragonirène Lorpar', 'Monstre', 'vent', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-21.jpg', 'DRAGON', 'EFFET', 2700, 1700, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Maison Dragonirène', 'Monstre', 'lumière', 9, '1 monstre \"Dragonirène\" + 1 monstre Dragon
-----Une fois par tour, durant la Standby Phase : vous pouvez cibler 1 autre monstre \"Dragonirène\" que vous contrôlez \; Invoquez Spécialement 1 monstre \"Dragonirène\" depuis votre main ou Cimetière en Position de Défense, dont le Niveau lui est supérieur ou inférieur de 1. Lorsqu''un ou plusieurs autres monstres Dragon face recto que vous contrôlez sont renvoyés à votre main (sauf durant la Damage Step) : vous pouvez cibler 1 monstre contrôlé par votre adversaire \; détruisez-le.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-22.jpg', 'DRAGON', 'FUSION', 3000, 2000, 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dragonirène Hospitalité', 'Magie', 'Invoquez Spécialement 1 monstre \"Dragonirène\" depuis votre main ou Cimetière en Position de Défense, puis, vous pouvez envoyer 1 monstre \"Dragonirène\" du même Attribut, mais de Niveau différent depuis votre Deck au Cimetière. Vous ne pouvez activer qu''1 \"Dragonirène Hospitalité\" par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-23.jpg', 'NORMAL', 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dragonirène Bienvenue', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-24.jpg', 'CONTINU', 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dragonirène Passage', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/MYFI/MYFI-25.jpg', 'NORMAL', 'Les Combattants Mystiques', TO_DATE('2019-11-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Caporal Amorceur - Dynamo du Commandement', 'Monstre', 'terre', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-1.jpg', 'MACHINE', 'EFFET', 0, 2000, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Amiral Amorceur - Dynamo Destructeur', 'Monstre', 'terre', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-2.jpg', 'MACHINE', 'EFFET', 2500, 2500, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ordre Amorceur - Chargement d''Équipement', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-3.jpg', 'CONTINU', 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ordre Amorceur - Force d''Équipement', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-4.jpg', 'NORMAL', 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Pouvoirobloc la Batterie Ambulante', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-5.jpg', 'CONTINU', 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gadget Vert', 'Monstre', 'terre', 4, 'Lorsque vous faites l''Invocation Normale ou l''Invocation Spéciale de cette carte, vous pouvez ajouter à votre main 1 \"Gadget Rouge\" de votre Deck.', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-6.jpg', 'MACHINE', 'EFFET', 1400, 600, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gadget Rouge', 'Monstre', 'terre', 4, 'Lorsque vous faites l''Invocation Normale ou l''Invocation Spéciale de cette carte, vous pouvez ajouter à votre main 1 \"Gadget Jaune\" de votre Deck.', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-7.jpg', 'MACHINE', 'EFFET', 1300, 1500, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gadget Jaune', 'Monstre', 'terre', 4, 'Lorsque vous faites l''Invocation Normale ou l''Invocation Spéciale de cette carte, vous pouvez ajouter à votre main 1 \"Gadget Vert\" de votre Deck.', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-8.jpg', 'MACHINE', 'EFFET', 1200, 1200, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gadget Or', 'Monstre', 'Lumière', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-9.jpg', 'MACHINE', 'EFFET', 1700, 800, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gadget Argent', 'Monstre', 'Lumière', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-10.jpg', 'MACHINE', 'EFFET', 1500, 1000, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Confrérie du Poing de Feu - Bélier', 'Monstre', 'feu', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-11.jpg', 'BÊTE-GUERRIER', 'EFFET', 800, 200, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Confrérie du Poing de Feu - Éléphant', 'Monstre', 'feu', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-12.jpg', 'BÊTE-GUERRIER', 'EFFET', 1000, 1800, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Confrérie du Poing de Feu - Panda', 'Monstre', 'feu', 5, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-13.jpg', 'BÊTE-GUERRIER', 'EFFET', 2100, 400, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Confrérie du Poing de Feu - Éland', 'Monstre', 'feu', 6, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-14.jpg', 'BÊTE-GUERRIER', 'RITUEL', 2400, 2000, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Confrérie du Poing de Feu - Cygne', 'Monstre', 'feu', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-15.jpg', 'BÊTE-GUERRIER', 'FUSION', 2600, 2200, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Confrérie du Poing de Feu - Aigle', 'Monstre', 'feu', 0, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-16.jpg', 'BÊTE-GUERRIER', 'LIEN', 1700, 0, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Confrérie du Poing de Feu - Paon', 'Monstre', 'feu', 0, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-17.jpg', 'BÊTE-GUERRIER', 'LIEN', 1000, 0, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Forteresse de Feu sur Liang Peak', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-18.jpg', 'TERRAIN', 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Formation Feu - Domei', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-19.jpg', 'CONTINU', 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Formation Feu - Ingen', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-20.jpg', 'CONTINU', 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Formation Feu Ultime - Sinto', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-21.jpg', 'CONTRE', 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Confrérie Du Poing De Feu - Gorille', 'Monstre', 'feu', 4, 'Une fois par tour, lorsque cette carte détruit un monstre de votre adversaire au combat et l''envoie au Cimetière : vous pouvez Poser 1 Carte Magie \"Formation Feu\" directement depuis votre Deck. Une fois par tour : vous pouvez envoyer 1 Carte Magie/Piège \"Formation Feu\" face recto que vous contrôlez au Cimetière pour cibler 1 Carte Magie/Piège sur le Terrain \; détruisez la cible.', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-22.jpg', 'BÊTE-GUERRIER', 'EFFET', 1600, 1000, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Confrérie Du Poing De Feu - Ours', 'Monstre', 'feu', 4, 'Une fois par tour, lorsque cette carte inflige des dommages de combat à votre adversaire : vous pouvez Poser 1 Carte Magie \"Formation Feu\" directement depuis votre Deck. Une fois par tour : vous pouvez envoyer 1 Carte Magie/Piège \"Formation Feu\" face recto que vous contrôlez au Cimetière pour cibler 1 monstre sur le Terrain \; détruisez la cible.', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-23.jpg', 'BÊTE-GUERRIER', 'EFFET', 1600, 1200, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Confrérie Du Poing De Feu - Esprit', 'Monstre', 'feu', 3, 'Non utilisable comme Monstre Matériel de Synchro, sauf pour l''Invocation Synchro d''un monstre de Type Bête-Guerrier. Lorsque cette carte est Invoquée Normalement : vous pouvez cibler 1 monstre FEU de Niveau 3 avec max. 200 DEF dans votre Cimetière \; Invoquez Spécialement la cible en Position de Défense face recto. Si vous le faîtes, le reste du tour, vous pouvez uniquement attaquer avec des monstres de Type Bête-Guerrier. Vous ne pouvez utiliser l''effet de \"Conférie du Poing du Feu - Esprit\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-24.jpg', 'BÊTE-GUERRIER', 'SYNTONISEUR', 500, 200, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Confrérie du Poing de Feu - Coq', 'Monstre', 'feu', 3, 'Lorsque cette carte est Invoquée Spécialement par l''effet d''un monstre \"Poing du Feu\" : vous pouvez ajouter 1 monstre \"Poing du Feu\" depuis votre Deck à votre main. Vous ne pouvez utiliser cet effet de \"Confrérie du Poing du Feu - Coq\" qu''une seule fois par tour. Une fois par tour : vous pouvez envoyer 1 Carte Magie/Piège \"Formation Feu\" face recto que vous contrôlez au Cimetière \; Posez 1 Carte Magie/Piège \"Formation Feu\" directement depuis votre Deck.', 'https://www.otk-expert.fr/cartes/yugioh_ext/FIGA/FIGA-25.jpg', 'BÊTE-GUERRIER', 'EFFET', 1500, 100, 'Les Poings des Gadgets', TO_DATE('2019-08-23', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dragon à Cinq Têtes', 'Monstre', 'ténèbres', 12, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-0.jpg', 'DRAGON', 'FUSION', 5000, 5000, 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ipiria', 'Monstre', 'terre', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-1.jpg', 'REPTILE', 'EFFET', 500, 500, 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Eau de la Vie', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-2.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Pleine Lune d''Or', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-3.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Maison de Pain d''Épice', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-4.jpg', 'CONTINU', 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Minimum Ray, HÉROS Vision', 'Monstre', 'ténèbres', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-5.jpg', 'GUERRIER', 'EFFET', 1200, 700, 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Multiply Guy, HÉROS Vision', 'Monstre', 'ténèbres', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-6.jpg', 'GUERRIER', 'EFFET', 800, 700, 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Increase, HÉROS Vision', 'Monstre', 'ténèbres', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-7.jpg', 'GUERRIER', 'EFFET', 900, 1100, 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Poisoner, HÉROS Vision', 'Monstre', 'ténèbres', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-8.jpg', 'GUERRIER', 'EFFET', 900, 700, 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gravito, HÉROS Vision', 'Monstre', 'ténèbres', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-9.jpg', 'GUERRIER', 'EFFET', 500, 2000, 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Faris, HÉROS Vision', 'Monstre', 'ténèbres', 5, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-10.jpg', 'GUERRIER', 'EFFET', 1600, 1800, 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Libération Vision', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-11.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Fusion Vision', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-12.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Apparition', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-13.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Luminine, Sorcière de la Bonne Aventure', 'Monstre', 'lumière', 1, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-14.jpg', 'MAGICIEN', 'EFFET', 0, 0, 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Flammette, Sorcière de la Bonne Aventure', 'Monstre', 'feu', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-15.jpg', 'MAGICIEN', 'EFFET', 0, 0, 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Alizée, Sorcière de la Bonne Aventure', 'Monstre', 'vent', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-16.jpg', 'MAGICIEN', 'EFFET', 0, 0, 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Aquamarine, Sorcière de la Bonne Aventure', 'Monstre', 'eau', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-17.jpg', 'MAGICIEN', 'EFFET', 0, 0, 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Malicia, Sorcière de la Bonne Aventure', 'Monstre', 'ténèbres', 5, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-18.jpg', 'MAGICIEN', 'EFFET', 0, 0, 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Pierrette, Sorcière de la Bonne Aventure', 'Monstre', 'terre', 6, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-19.jpg', 'MAGICIEN', 'EFFET', 0, 0, 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Résultat Inacceptable', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-20.jpg', 'JEU RAPIDE', 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Pierre Miracle', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-21.jpg', 'CONTINU', 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Prêt Porte-Bonheur', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-22.jpg', 'NORMAL', 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Zombie Engrenage T.G.', 'Monstre', 'ténèbres', 1, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-23.jpg', 'ZOMBIE', 'SYNTONISEUR', 600, 0, 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Poisson Perceuse T.G.', 'Monstre', 'eau', 1, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/BLHR/BLHR-24.jpg', 'POISSON', 'EFFET', 100, 800, 'Batailles de Légende : La Vengeance du Héros', TO_DATE('2019-07-11', 'YYYY-MM-DD'), 'Ultra Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Moissonneuse Chenillinfini', 'Monstre', 'terre', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-1.jpg', 'MACHINE', 'EFFET', 0, 2100, 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Perceuse-Ancrage Chenillinfini', 'Monstre', 'terre', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-2.jpg', 'MACHINE', 'EFFET', 1800, 500, 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Grue-Crabe Chenillinfini', 'Monstre', 'terre', 5, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-3.jpg', 'MACHINE', 'EFFET', 2100, 500, 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Tire-Pelleteuse Chenillinfini', 'Monstre', 'terre', 5, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-4.jpg', 'MACHINE', 'EFFET', 1500, 2100, 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Trancheuse Chenillinfini', 'Monstre', 'terre', 5, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-5.jpg', 'MACHINE', 'EFFET', 500, 2400, 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Tunnelier Chenillinfini', 'Monstre', 'terre', 5, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-6.jpg', 'MACHINE', 'EFFET', 2200, 500, 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ouvre-Fleuve Chenillinfini', 'Monstre', 'terre', 5, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-7.jpg', 'MACHINE', 'XYZ', 2500, 500, 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Brise-Montagne Chenillinfini', 'Monstre', 'terre', 7, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-8.jpg', 'MACHINE', 'XYZ', 2100, 3100, 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Coupe-Terre Chenillinfini', 'Monstre', 'terre', 9, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-9.jpg', 'MACHINE', 'XYZ', 3100, 2100, 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Goliath Chenillinfini', 'Monstre', 'terre', 0, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-10.jpg', 'MACHINE', 'LIEN', 1000, 0, 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Forteresse-Mégaclops Chenillinfini', 'Monstre', 'terre', 0, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-11.jpg', 'MACHINE', 'LIEN', 4000, 0, 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Extension Stabilisateur', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-12.jpg', 'CONTINU', 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Rotation sur Place', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-13.jpg', 'NORMAL', 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Potterie, Artisanesorcière', 'Monstre', 'terre', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-14.jpg', 'MAGICIEN', 'EFFET', 0, 2000, 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Pittore, Artisanesorcière', 'Monstre', 'eau', 3, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-15.jpg', 'MAGICIEN', 'EFFET', 1000, 1500, 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Schmietta, Artisanesorcière', 'Monstre', 'feu', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-16.jpg', 'MAGICIEN', 'EFFET', 1800, 600, 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Edel, Artisanesorcière', 'Monstre', 'lumière', 5, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-17.jpg', 'MAGICIEN', 'EFFET', 2000, 2300, 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Indumenti, Artisanesorcière', 'Monstre', 'ténèbres', 7, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-18.jpg', 'MAGICIEN', 'EFFET', 2400, 1000, 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Madame Verre, Artisanesorcière', 'Monstre', 'lumière', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-19.jpg', 'MAGICIEN', 'EFFET', 1000, 2800, 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Création Artisanesorcière', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-20.jpg', 'NORMAL', 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Vacances Artisanesorcière', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-21.jpg', 'NORMAL', 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Coopération Artisanesorcière', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-22.jpg', 'NORMAL', 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Draperie Artisanesorcière', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-23.jpg', 'JEU RAPIDE', 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Allée Artisanesorcière', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-24.jpg', 'CONTINU', 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Parchemin Artisanesorcière', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/INCH/INCH-25.jpg', 'CONTINU', 'Les Chasseurs de l''Infini', TO_DATE('2019-03-21', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Matriarche de Nephtys', 'Monstre', 'vent', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-1.jpg', 'MAGICIEN', 'EFFET', 600, 600, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Disciple de Nephtys', 'Monstre', 'vent', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-2.jpg', 'MAGICIEN', 'EFFET', 0, 2000, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Chroniqueuse de Nephtys', 'Monstre', 'vent', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-3.jpg', 'MAGICIEN', 'EFFET', 300, 1200, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Défenseuse de Nephtys', 'Monstre', 'vent', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-4.jpg', 'MAGICIEN', 'EFFET', 1400, 200, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Adepte de Nephtys', 'Monstre', 'vent', 2, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-5.jpg', 'MAGICIEN', 'RITUEL', 1200, 1200, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Phœnix Sacré Céruléen de Nephtys', 'Monstre', 'feu', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-6.jpg', 'BÊTE AILÉE', 'RITUEL', 3000, 1000, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Nephtys, la Préservatrice Sacrée', 'Monstre', 'feu', 0, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-7.jpg', 'BÊTE AILÉE', 'LIEN', 1200, 0, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Nephtys, la Flamme Sacrée', 'Monstre', 'feu', 0, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-8.jpg', 'BÊTE AILÉE', 'LIEN', 2400, 0, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Réincarnation de Nephtys', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-9.jpg', 'RITUEL', 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dernier Espoir de Nephtys', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-10.jpg', 'NORMAL', 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Éveil de Nephtys', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-11.jpg', 'CONTINU', 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Phoenix Sacré de Nephtys', 'Monstre', 'feu', 8, 'Si ce monstre est détruit par l''effet d''une carte, faites l''Invocation Spéciale de cette carte durant la Standby Phase de votre prochain tour. Si vous faites l''Invocation Spéciale de cette carte avec succès de cette manière, détruisez toutes les Cartes Magie et Piège sur le Terrain.', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-12.jpg', 'BÊTE AILÉE', 'EFFET', 2400, 1600, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Serviteur de Nephtys', 'Monstre', 'vent', 2, 'Sacrifiez 2 monstres sur votre Terrain en incluant cette carte pour faire l''Invocation Spéciale d''1 ''Phoenix Sacré de Nephtys'' depuis votre main ou votre Deck.', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-13.jpg', 'MAGICIEN', 'EFFET', 600, 600, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Fanrigolo Farce-Gamins', 'Monstre', 'vent', 1, 'Si cette carte est envoyée au Cimetière comme Matériel pour une Invocation Fusion ou Lien d''un monstre \"Farce-Gamins\" : vous pouvez envoyer 1 carte \"Farce-Gamins\" (\"Fanrigolo Farce-Gamins\" exclu) depuis votre Deck au Cimetière, puis vous pouvez Invoquer Spécialement 1 monstre \"Farce-Gamins\" (\"Fanrigolo Farce-Gamins\" exclu) depuis votre main ou Deck en Position de Défense. Vous ne pouvez utiliser cet effet de \"Fanrigolo Farce-Gamins\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-14.jpg', 'TONNERRE', 'EFFET', 0, 2000, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Lamprigolo Farce-Gamins', 'Monstre', 'feu', 3, 'Si cette carte est envoyée au Cimetière comme Matériel pour une Invocation Fusion ou Lien d''un monstre \"Farce-Gamins\" : vous pouvez infliger 500 points de dommages à votre adversaire, puis vous pouvez Invoquer Spécialement 1 monstre \"Farce-Gamins\" (\"Lamprigolo Farce-Gamins\" exclu) depuis votre main ou Deck en Position de Défense. Vous ne pouvez utiliser cet effet de \"Lamprigolo Farce-Gamins\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-15.jpg', 'PYRO', 'EFFET', 1500, 500, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Gouttrigolo Farce-Gamins', 'Monstre', 'eau', 2, 'Si cette carte est envoyée au Cimetière comme Matériel pour une Invocation Fusion ou Lien d''un monstre \"Farce-Gamins\" : vous pouvez gagner 1000 LP, puis vous pouvez Invoquer Spécialement 1 monstre \"Farce-Gamins\" (\"Gouttrigolo Farce-Gamins\" exclu) depuis votre main ou Deck en Position de Défense. Vous ne pouvez utiliser cet effet de \"Gouttrigolo Farce-Gamins\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-16.jpg', 'AQUA', 'EFFET', 1000, 1000, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Roule-Roquette Farce-Gamins', 'Monstre', 'feu', 5, '2 monstres \"Farce-Gamins\"
-----Si cette carte est Invoquée par Fusion : vous pouvez faire perdre 1000 ATK à cette carte ce tour, et aussi, elle peut attaquer directement ce tour. Vous pouvez Sacrifier cette carte, puis ciblez 2 Monstres non-Fusion \"Farce-Gamins\" de noms différents dans votre Cimetière \; Invoquez-les Spécialement, mais ils ne peuvent pas attaquer ce tour. Vous ne pouvez utiliser chaque effet de \"Roule-Roquette Farce-Gamins\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-17.jpg', 'PYRO', 'FUSION', 2000, 0, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Transforme-Temps Farce-Gamins', 'Monstre', 'eau', 5, '2 monstres \"Farce-Gamins\"
-----Si votre monstre \"Farce-Gamins\" attaque, votre adversaire ne peut activer ni de cartes ni d''effets jusqu''à la fin de la Damage Step. Durant le tour de votre adversaire (Effet Rapide) : vous pouvez Sacrifier cette carte, puis ciblez 2 Monstres non-Fusion \"Farce-Gamins\" de noms différents dans votre Cimetière \; Invoquez-les Spécialement. Ils ne peuvent pas être détruits au combat ce tour. Vous ne pouvez utiliser cet effet de \"Transforme-Temps Farce-Gamins\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-18.jpg', 'AQUA', 'FUSION', 2000, 0, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Chauffeur-Combat Farce-Gamins', 'Monstre', 'vent', 10, '\"Lamprigolo Farce-Gamins\" + \"Gouttrigolo Farce-Gamins\" + \"Fanrigolo Farce-Gamins\"
-----Uniquement Invocable par Fusion. (Effet Rapide) : vous pouvez Sacrifier cette carte \; détruisez tous les monstres contrôlés par votre adversaire. Si cette carte en votre possession est envoyée à votre Cimetière par une carte de votre adversaire : vous pouvez cibler 1 Monstre non-Fusion dans votre Cimetière \; Invoquez-le Spécialement. Vous ne pouvez utiliser cet effet de \"Chauffeur-Combat Farce-Gamins\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-19.jpg', 'TONNERRE', 'FUSION', 3000, 3000, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dodo-Cocorico Farce-Gamins', 'Monstre', 'vent', 0, '2 monstres \"Farce-Gamins\"
-----Si cette carte est Invoquée par Lien : vous pouvez ajouter 1 Magie/Piège \"Farce-Gamins\" depuis votre Deck à votre main. Vous pouvez Sacrifier cette carte, puis ciblez 2 cartes \"Farce-Gamins\" de noms différents (Monstres Lien exclus) dans votre Cimetière \; ajoutez-les à votre main. Vous ne pouvez utiliser chaque effet de \"Dodo-Cocorico Farce-Gamins\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-20.jpg', 'TONNERRE', 'LIEN', 2000, 0, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Toutou-Woufwouf Farce-Gamins', 'Monstre', 'feu', 0, '2 monstres \"Farce-Gamins\"
-----Un monstre \"Farce-Gamins\" pointé par cette carte gagne 1000 ATK. Durant le tour de votre adversaire (Effet Rapide) : vous pouvez Sacrifier cette carte, puis ciblez 2 cartes \"Farce-Gamins\" de noms différents (Monstres Lien exclus) dans votre Cimetière \; ajoutez-les à votre main, et aussi, les monstres \"Farce-Gamins\" que vous contrôlez ne peuvent pas être détruits par des effets de carte de votre adversaire ce tour. Vous ne pouvez utiliser cet effet de \"Toutou-Woufwouf Farce-Gamins\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-21.jpg', 'PYRO', 'LIEN', 2000, 0, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Dragon-Craaatch Farce-Gamins', 'Monstre', 'eau', 0, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-22.jpg', 'AQUA', 'LIEN', 3000, 0, 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Place Farce-Gamins', 'Magie', 'Lorsque cette carte est activée : vous pouvez ajouter 1 monstre \"Farce-Gamins\" depuis votre Deck à votre main. Une fois par tour, si vous Invoquez par Fusion un Monstre Fusion \"Farce-Gamins\" (sauf durant la Damage Step) : vous pouvez faire gagner 500 ATK à tous les monstres que vous contrôlez (même si cette carte quitte le Terrain). Une fois par tour, si vous Invoquez par Lien un Monstre Lien \"Farce-Gamins\" (sauf durant la Damage Step) : vous pouvez faire perdre 500 ATK à tous les monstres contrôlés par votre adversaire (même si cette carte quitte le Terrain). Vous ne pouvez activer qu''1 \"Place Farce-Gamins\" par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-23.jpg', 'TERRAIN', 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Farces Farce-Gamins', 'Magie', 'Vous pouvez défausser 1 carte \"Farce-Gamins\" \; Invoquez Spécialement 1 \"Jeton Farce-Gamins\" (Pyro/FEU/Niveau 1/ATK 0/DEF 0), mais il ne peut pas être Sacrifié. Durant votre End Phase : vous pouvez cibler 3 cartes \"Farce-Gamins\" (\"Farces Farce-Gamins\" exclu) dans votre Cimetière \; mélangez-les toutes les 3 dans le Deck, puis piochez 1 carte. Vous ne pouvez utiliser chaque effet de \"Farces Farce-Gamins\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-24.jpg', 'CONTINU', 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Pandémonium Farce-Gamins', 'Magie', 'Durant la Main Phase : Invoquez par Fusion 1 Monstre Fusion \"Farce-Gamins\" depuis votre Extra Deck, en utilisant des monstres depuis votre main ou Terrain comme Matériel Fusion. Le reste de ce tour après la résolution de cette carte, vous ne pouvez Invoquer ni Normalement ni Spécialement de monstres (monstres \"Farce-Gamins\" exclus).', 'https://www.otk-expert.fr/cartes/yugioh_ext/HISU/HISU-25.jpg', 'JEU RAPIDE', 'Les Invocateurs Cachés', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Valkyrie-Dritte', 'Monstre', 'lumière', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-1.jpg', 'ELFE', 'EFFET', 1000, 1600, 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Valkyrie-Zweite', 'Monstre', 'lumière', 5, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-2.jpg', 'ELFE', 'EFFET', 1600, 1600, 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Valkyrie-Erste', 'Monstre', 'lumière', 6, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-3.jpg', 'ELFE', 'EFFET', 1600, 1800, 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Valkyrie-Brunhilde', 'Monstre', 'lumière', 7, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-4.jpg', 'ELFE', 'EFFET', 1800, 2000, 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Attelage du Destin', 'Monstre', 'vent', 6, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-5.jpg', 'ELFE', 'UNION', 1000, 2000, 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Chevauchée des Valkyries', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-6.jpg', 'NORMAL', 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'La Plaisanterie de la Déesse du Temps', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-7.jpg', 'JEU RAPIDE', 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Oracle de la Norne Skuld', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-8.jpg', 'CONTINU', 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Guide de la Norne Verdande', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-9.jpg', 'CONTINU', 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Verdict de la Norne Urd', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-10.jpg', 'CONTINU', 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Maestro Ninja Saizo', 'Monstre', 'lumière', 0, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-11.jpg', 'GUERRIER', 'LIEN', 2000, 0, 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ninja Jaune', 'Monstre', 'vent', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-12.jpg', 'GUERRIER', 'EFFET', 1900, 1800, 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ninja Dragon Jaune', 'Monstre', 'vent', 8, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-13.jpg', 'DINOSAURE', 'EFFET', 3000, 1500, 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Village Caché des Arts Ninjitsu', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-14.jpg', 'TERRAIN', 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Art Ninjitsu de la Miragemétamorphose', 'Piège', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-15.jpg', 'CONTINU', 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Cthugua, Vieille Entité', 'Monstre', 'feu', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-16.jpg', 'PYRO', 'SYNCHRO', 2200, 200, 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Nyarla, Entité Éloignée', 'Monstre', 'terre', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-17.jpg', 'DÉMON', 'XYZ', 0, 2600, 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Azathot, Entité Éloignée', 'Monstre', 'ténèbres', 0, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-18.jpg', 'DÉMON', 'XYZ', 2400, 0, 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_description, carte_image, carte_type, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Trapézoèdre Interdit', 'Magie', '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-19.jpg', 'NORMAL', 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Aleister l''Invokhateur de la Folie', 'Monstre', 'ténèbres', 0, '2 monstres de Types et Attributs différents
-----Le nom de cette carte devient \"Aleister l''Invokhateur\" tant qu''elle est sur le Terrain ou dans le Cimetière. Si un monstre est Invoqué par Fusion tant que vous contrôlez ce monstre (sauf durant la Damage Step) : vous pouvez défausser 1 carte, et si vous le faites, ajoutez 1 \"Invokhation\" ou \"Le Livre de la Loi\" depuis votre Deck à votre main. Si cette carte face recto que vous contrôlez quitte le Terrain à cause d''un effet de carte de l''adversaire : vous pouvez ajouter 1 \"Invocation Oméga\" depuis votre Deck à votre main.', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-20.jpg', 'MAGICIEN', 'LIEN', 1800, 0, 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Secret Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ninja d''Intervention', 'Monstre', 'ténèbres', 4, 'Vous pouvez retirer cette carte du jeu jusqu''à la End Phase de ce tour en retirant du jeu 2 monstres TENEBRES de votre Cimetière. Vous pouvez utiliser cet effet durant le tour de chaque joueur. cet effet ne peut être activé qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-21.jpg', 'GUERRIER', 'EFFET', 1700, 1200, 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Maestro Ninja Hanzo', 'Monstre', 'ténèbres', 4, 'Lorsque cette carte est Invoquée Normalement : vous pouvez ajouter 1 carte \"Ninjitsu\" ou \"Nin-Jitsu\" depuis votre Deck à votre main. Lorsque cette carte est Invoquée par Flip ou Spécialement : vous pouvez ajouter 1 monstre \"Ninja\" (\"Maestro Ninja Hanzo\" exclu) depuis votre Deck à votre main.', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-22.jpg', 'GUERRIER', 'EFFET', 1800, 1000, 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ninja d''Or Arriviste', 'Monstre', 'lumière', 4, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-23.jpg', 'GUERRIER', 'EFFET', 500, 1800, 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ninja Dragon Blanc', 'Monstre', 'lumière', 7, '', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-24.jpg', 'DRAGON', 'EFFET', 2700, 1200, 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Super Rare');

INSERT INTO P12_relation (num_carte, carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF, nom_edition, date_edition, carte_rarete)
VALUES (seq.NEXTVAL, 'Ninja Dragon Rouge', 'Monstre', 'feu', 6, 'Lorsque cette carte est Invoquée : vous pouvez bannir 1 carte \"Ninja\", \"Ninjitsu\" ou \"Nin-jitsu\" depuis votre Cimetière pour cibler 1 carte Posée contrôlée par votre adversaire \; révélez la carte Posée, puis renvoyez-la au-dessus ou au-dessous du Deck. Votre adversaire ne peut pas activer la carte ciblée en réponse à l''activation de cet effet. Vous ne pouvez utiliser l''effet de \"Ninja Dragon Rouge\" qu''une fois par tour.', 'https://www.otk-expert.fr/cartes/yugioh_ext/SHVA/SHVA-25.jpg', 'BÊTE AILÉE', 'EFFET', 2400, 1200, 'Les ombres au Walhalla', TO_DATE('2018-08-16', 'YYYY-MM-DD'), 'Super Rare');


--suppression des cartes qui n'ont pas  les categories demandées en cas d'erreur
DELETE FROM P12_relation WHERE carte_categorie NOT IN ('Magie', 'Monstre','Piège');

--Insertion des éditions
INSERT INTO P12_edition (nom_edition, date_edition)
SELECT DISTINCT nom_edition, date_edition
FROM P12_relation
GROUP BY nom_edition, date_edition;

--Insertion des cartes
INSERT INTO P12_carte (carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF)
SELECT DISTINCT carte_nom, carte_categorie, carte_attribut, carte_niveau, carte_description, carte_image, carte_type, carte_specificite, carteATK, carteDEF
FROM P12_relation;

--Gestion des doublons
DELETE FROM P12_carte
WHERE num_carte IN (
    SELECT C1.num_carte
    FROM P12_carte C1 INNER JOIN P12_carte C2
    ON C1.carte_nom = C2.carte_nom
    WHERE C1.num_carte > C2.num_carte );


--insertion de la relation entre edition et la langue
INSERT INTO P12_carteEdition (num_carte, num_edition, carte_rarete)
SELECT DISTINCT C.num_carte, ER.num_edition, R.carte_rarete
FROM P12_relation R
    INNER JOIN P12_edition ER ON ER.nom_edition = R.nom_edition
    INNER JOIN P12_carte C ON C.carte_nom = R.carte_nom
ORDER BY C.num_carte;

--Insertion des langues
INSERT INTO P12_langue (nom_langue)
SELECT 'Anglais' FROM dual WHERE 'Anglais' NOT IN (SELECT nom_langue FROM P12_langue)
UNION ALL
SELECT 'Français' FROM dual WHERE 'Français' NOT IN (SELECT nom_langue FROM P12_langue)
UNION ALL
SELECT 'Allemand' FROM dual WHERE 'Allemand' NOT IN (SELECT nom_langue FROM P12_langue)
UNION ALL
SELECT 'Espagnol' FROM dual WHERE 'Espagnol' NOT IN (SELECT nom_langue FROM P12_langue)
UNION ALL
SELECT 'Japonais' FROM dual WHERE 'Japonais' NOT IN (SELECT nom_langue FROM P12_langue);

--Suppression de la table intermediaire
DROP TABLE P12_relation ;
