
-- Requêtes SQL

-- Requetes d'echauffement :)
    select * from P12_carte;
    select * from P12_edition;
    select * from P12_carteEdition;
    select * from P12_langue;


--1 Donner une requête filtrant des données à l'aide d'une expression rationnelle (REGEXP) sur un champ textuel. LES nom de cartes contenant le mot "Dragon"
-- Sélectionner les editions qui commence par "Bataille"
SELECT * FROM P12_edition WHERE REGEXP_LIKE(nom_edition, '^Bataille');

--2 Donner quatre requêtes différentes mettant en œuvre des jointures internes
-- 1ERE REQUETE
    -- a.1 Cartes super rares
        SELECT carte_nom, carte_description, carte_image
        FROM P12_carte NATURAL JOIN P12_carteEdition
            WHERE carte_rarete = 'Super Rare';
    -- a.2
        SELECT carte_nom, carte_description, carte_image
            FROM P12_carte C INNER JOIN P12_carteEdition CE ON C.num_carte = CE.num_carte
                WHERE carte_rarete = 'Super Rare';

    -- b) jointure externe
        SELECT carte_nom, carte_description, carte_image
            FROM P12_carte C LEFT OUTER JOIN P12_carteEdition CE ON C.num_carte = CE.num_carte
                WHERE carte_rarete = 'Super Rare';
    /*  EXPLICATION :
       Chaque ligne de la table P12_carte a au moins une correspondance dans la table P12_carteEdition
        ce qui explique que les résultats soient identiques.
     */

    -- c) une version basée sur le produit cartésien
        SELECT carte_nom, carte_description, carte_image
            FROM P12_carte, P12_carteEdition
                WHERE P12_carte.num_carte = P12_carteEdition.num_carte AND carte_rarete = 'Super Rare';

    -- d) comparer les temps d’exécution des différentes versions réalisées.
    /*
      Après avoir exécuté les requêtes plusieurs fois, on remarque que :
        - la jointure externe prend : 6ms
        - le produit cartésien prend : 9ms
        - la jointure interne prend : 5ms
     */

-- 2EME REQUETE
    -- a.1 Cartes Magie de l'edition 1  -- 502
    SELECT Distinct carte_nom, carte_image
    FROM P12_carte NATURAL JOIN P12_carteEdition
        WHERE CARTE_CATEGORIE ='Magie' AND NUM_EDITION = 502;

    -- a.2
    SELECT carte_nom, carte_image
    FROM P12_carte C INNER JOIN P12_carteEdition CE ON C.num_carte = CE.num_carte
        WHERE num_edition = 502 AND carte_categorie ='Magie';

    -- b jointure externe
    SELECT carte_nom, carte_image
    FROM P12_carte C LEFT OUTER JOIN P12_carteEdition CE ON C.num_carte = CE.num_carte
        WHERE num_edition = 502 AND carte_categorie ='Magie';
    /*  EXPLICATION :
       Chaque ligne de la table P12_carte a au moins une correspondance dans la table P12_carteEdition
        ce qui explique que les résultats soient identiques.
     */
    -- c) une version basée sur le produit cartésien
    SELECT carte_nom, carte_image
    FROM P12_carte, P12_carteEdition
        WHERE P12_carte.num_carte = P12_carteEdition.num_carte AND num_edition = 502 AND carte_categorie ='Magie';

    -- d) comparer les temps d’exécution des différentes versions réalisées.
    /*
      Après avoir exécuté les requêtes plusieurs fois, on remarque que :
        - la jointure externe prend : 5ms
        - le produit cartésien prend : 6ms
        - la jointure interne prend : 5ms
     */

-- 3EME REQUETE
    -- a.1 Raretés présentes dans une édition "Le Chaos Toon"
    SELECT DISTINCT carte_rarete
    FROM P12_carteEdition NATURAL JOIN P12_edition
        WHERE nom_edition ='Le Chaos Toon';

    -- a.2)
    SELECT DISTINCT carte_rarete
    FROM P12_carteEdition CE INNER JOIN P12_edition E ON CE.num_edition = E.num_edition
        WHERE nom_edition ='Le Chaos Toon';

    -- b) jointure externe
    SELECT DISTINCT carte_rarete
    FROM P12_carteEdition CE LEFT OUTER JOIN P12_edition E ON CE.num_edition = E.num_edition
        WHERE nom_edition ='Le Chaos Toon';
    /*  EXPLICATION :
       Chaque ligne de la table P12_carteEdition a au moins une correspondance dans la table P12_edition
        ce qui explique que les résultats soient identiques.
     */

    -- c) une version basée sur le produit cartésien
    SELECT DISTINCT carte_rarete
    FROM P12_carteEdition, P12_edition
        WHERE P12_carteEdition.num_edition = P12_edition.num_edition AND nom_edition ='Le Chaos Toon';

    -- d) comparer les temps d’exécution des différentes versions réalisées.
    /*
      Après avoir exécuté les requêtes plusieurs fois, on remarque que :
        - la jointure externe prend : 6ms
        - le produit cartésien prend : 6ms
        - la jointure interne prend : 5ms
     */

-- 4EME REQUETE
    -- a.1 Toutes les raretés dans lesquelles est disponible la carte "Exosœur Mikailis"
        SELECT carte_rarete, carte_image
        FROM P12_carteEdition NATURAL JOIN P12_carte
            WHERE carte_nom = 'Exosœur Mikailis';

    -- a.2)
        SELECT carte_rarete, carte_image
        FROM P12_carteEdition CE INNER JOIN P12_carte C ON CE.num_carte = C.num_carte
            WHERE carte_nom = 'Exosœur Mikailis';

    -- b) jointure externe
        SELECT carte_rarete, carte_image
        FROM P12_carteEdition CE LEFT OUTER JOIN P12_carte C ON CE.num_carte = C.num_carte
            WHERE carte_nom = 'Exosœur Mikailis';
        /*  EXPLICATION :
           Chaque ligne de la table P12_carteEdition a au moins une correspondance dans la table P12_carte
            ce qui explique que les résultats soient identiques.
         */

    -- c) une version basée sur le produit cartésien
        SELECT carte_rarete, carte_image
        FROM P12_carteEdition, P12_carte
            WHERE P12_carteEdition.num_carte = P12_carte.num_carte AND carte_nom = 'Exosœur Mikailis';

    -- d) comparer les temps d’exécution des différentes versions réalisées.
        /*
          Après avoir exécuté les requêtes plusieurs fois, on remarque que :
            - la jointure externe prend : 4ms
            - le produit cartésien prend : 6ms
            - la jointure interne prend : 5ms
         */

--3 Donner une requête pour chacun des opérateurs ensemblistes (UNION, INSERSECT et EXCEPT)
    -- UNION
    -- les cartes Magie de type NORMALE et TERRAIN
    SELECT carte_nom, carte_description, carte_image, carte_type
    FROM P12_carte NATURAL JOIN P12_carteEdition
        WHERE carte_categorie = 'Magie' AND carte_type = 'NORMAL'
    UNION
    SELECT carte_nom, carte_description, carte_image, carte_type
    FROM P12_carte NATURAL JOIN P12_carteEdition
        WHERE carte_categorie = 'Magie' AND carte_type = 'TERRAIN';

    -- Minus
        -- les cartes Monstre ayant un niveau 0,1,2 ET une spécificité 'EFFET'
    SELECT carte_nom, carte_description, carte_image, carte_type, carte_niveau, carte_specificite
    FROM P12_carte
        WHERE carte_categorie = 'Monstre' AND carte_specificite = 'EFFET'
    MINUS
    SELECT carte_nom, carte_description, carte_image, carte_type, carte_niveau, carte_specificite
    FROM P12_carte
        WHERE carte_categorie = 'Monstre' AND carte_niveau > 2;

    -- INTERSECT
    -- les editions sorties après 2021 et qui contiennent des cartes de type 'Dragon'
    SELECT *
    FROM P12_edition
    WHERE date_edition > TO_DATE('2021-01-01', 'YYYY-MM-DD')
    INTERSECT
    SELECT num_edition, nom_edition, date_edition
    FROM P12_edition NATURAL JOIN P12_carteEdition NATURAL JOIN P12_carte
    WHERE carte_type = 'DRAGON';


--4 Donner les requêtes mettant en œuvre les sous-requêtes suivantes :
    --a) une sous-requête dans la clause WHERE via l'opérateur =
    -- LES CARTES DE l'edition 'Les Pourfendeurs Secrets' qui sont super rare
    SELECT NUM_CARTE, NUM_EDITION, CARTE_NOM, CARTE_CATEGORIE, CARTE_ATTRIBUT, CARTE_RARETE FROM P12_carte NATURAL JOIN P12_carteEdition WHERE carte_rarete='Super Rare'
    AND num_edition=(SELECT num_edition FROM P12_edition WHERE nom_edition='Les Pourfendeurs Secrets');

    --b) une sous-requête dans la clause WHERE via l'opérateur IN
        -- les cartes super rare, collectors rare et starlight rare
    SELECT *
    FROM P12_carte WHERE num_carte IN
          (SELECT num_carte FROM P12_carteEdition WHERE carte_rarete IN ('Super Rare','Collectors Rare', 'Starlight Rare'));


    --c) une sous-requête dans la clause FROM
    -- LA liste des editions contenant des cartes pièges ayant un type 'CONTINU'
    SELECT num_edition, nom_edition, date_edition
    FROM (SELECT * FROM P12_carte WHERE carte_categorie = 'Piège' AND carte_type = 'CONTINU') CartePiegesContinue
        NATURAL JOIN P12_carteEdition NATURAL JOIN P12_edition ;



    --d) une sous-requête imbriquée dans une autre sous-requête
    -- Sélectionner les cartes de l'édition la plus ancienne en affichant la date de l'édition
    SELECT num_carte, carte_nom
        FROM P12_carte WHERE num_carte IN
                (SELECT num_carte from P12_carteEdition WHERE num_edition IN
                    (SELECT num_edition FROM P12_edition WHERE date_edition = (SELECT MIN(date_edition) FROM P12_edition)));



    --e) une sous-requête synchronisée
     --les cartes ayant un ATK supérieur à la moyenne
    SELECT * FROM P12_carte
             WHERE carteATK > (SELECT avg(carteATK) FROM P12_carte);

    --f) une sous-requêtes utilisant un opérateur de comparaison combiné ANY
    --les cartes qui sont dans au moins une édition produite après 2021-01-01 et qui ont une rareté 'Rare'
    SELECT carte_nom, carteATK, carte_categorie
    FROM P12_carte NATURAL JOIN P12_carteEdition
        WHERE carte_rarete ='Rare' AND num_edition = ANY (SELECT num_edition FROM P12_edition WHERE date_edition > TO_DATE('2021-01-01', 'YYYY-MM-DD'));

    --ALL
    --g) une sous-requêtes utilisant un opérateur de comparaison combiné ALL
    -- les cartes avec des points d'ATK supérieur à tous les monstres de spécificité XYZ
     SELECT num_carte, carte_nom, carteATK, carte_categorie, carte_type, carte_specificite
    FROM P12_carte
    WHERE carteATK > ALL (SELECT carteATK FROM P12_carte WHERE carte_categorie = 'Monstre' AND carte_specificite = 'XYZ');

--5 Donner un exemple de requête pouvant être réalisé avec une jointure ou avec une sous-requête
    -- Editions qui comportent des cartes de rareté "Ultra Rare"
        -- Jointure
        SELECT DISTINCT nom_edition, date_edition FROM P12_edition NATURAL JOIN P12_carteEdition
        WHERE carte_rarete LIKE 'Ultra%';
        -- Sous-requête
        SELECT nom_edition, date_edition FROM P12_edition
        WHERE num_edition IN (SELECT num_edition FROM P12_carteEdition
                                        WHERE carte_rarete LIKE 'Ultra%');

    /*
        On remarque que la requête avec la jointure est plus rapide que celle avec la sous requête.
        En effet, la jointure lie directement les informations des tables entre elles, alors que la sous-requête
        doit d'abord récupérer les informations de la table P12_carteEdition avant de pouvoir les lier à la table P12_edition.
     */

--6 Donner deux requêtes utilisant une fonction d'agrégation (MIN, MAX, AVG, COUNT, SUM)
    -- le nombre de cartes de l'edition 'Les Poings des Gadgets'
    SELECT COUNT(num_carte) FROM P12_carte NATURAL JOIN P12_carteEdition
    WHERE num_edition = (SELECT num_edition FROM P12_edition WHERE nom_edition = 'Les Poings des Gadgets');

    -- les cartes ayant le plus grand niveau
    SELECT carte_nom, carte_description, carte_image, carte_type, carte_niveau, carte_specificite
    FROM P12_carte
    WHERE carte_niveau = (SELECT MAX(carte_niveau) FROM P12_carte);

--7 Donner deux requêtes différentes utilisant les fonctions d'agrégation et la clause GROUP BY
    -- le plus grand niveau par édition
    SELECT num_edition, nom_edition, MAX(carte_niveau) as niveau_max
    FROM P12_carte NATURAL JOIN P12_carteEdition NATURAL JOIN P12_edition
    GROUP BY num_edition, nom_edition;
    -- la plus forte DEF par type de carte
    SELECT carte_type, MAX(carteDEF) as DEF_max
    FROM P12_carte
    WHERE carteDEF IS NOT NULL
    GROUP BY carte_type;

--8 Donner deux requêtes différentes utilisant les fonctions d'agrégation et la clause HAVING
    -- l'Attribut le plus présent dans les cartes 'Monstre'
    SELECT carte_attribut, COUNT(num_carte) FROM P12_carte
    WHERE carte_attribut IS NOT NULL
    GROUP BY carte_attribut
    HAVING COUNT(num_carte)  >= ALL (SELECT COUNT(num_carte) FROM P12_carte
                                     WHERE carte_attribut IS NOT NULL
                                     GROUP BY carte_attribut);

    -- le type de carte le plus présent dans l'edition 'Les Poings des Gadgets'
    SELECT carte_type, COUNT(num_carte) FROM P12_carte NATURAL JOIN P12_carteEdition
    WHERE num_edition = (SELECT num_edition FROM P12_edition WHERE nom_edition = 'Les Poings des Gadgets')
    GROUP BY carte_type
    HAVING COUNT(num_carte)  >= ALL (SELECT COUNT(num_carte) FROM P12_carte NATURAL JOIN P12_carteEdition
                                     WHERE num_edition = (SELECT num_edition FROM P12_edition WHERE nom_edition = 'Les Poings des Gadgets')
                                     GROUP BY carte_type);


-- Donner une requête qui associe sur une même ligne des informations issues de deux
    -- enregistrements différents d’une même table, par exemple deux pays différents, deux personnes différentes, etc.
SELECT
    A.num_edition AS num_edition1,
    A.nom_edition AS nom_edition1,
    A.date_edition AS date_edition1,
    B.num_edition AS num_edition2,
    B.nom_edition AS nom_edition2,
    B.date_edition AS date_edition2
FROM P12_edition A
JOIN P12_edition B ON A.num_edition < B.num_edition;



