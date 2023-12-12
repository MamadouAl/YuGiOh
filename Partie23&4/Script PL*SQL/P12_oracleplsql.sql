-- CREATION DE VIEWS
--  vues qui representent les informations utiles pour l'utilisateur .

    --On crée une vue pour stocker les cartes de l'edition -> Batailles de Legende : Armageddon
    --1
    CREATE VIEW P12_carteDuneEdition AS
    SELECT DISTINCT num_carte, carte_nom, carte_description, carte_image, carte_categorie, carte_rarete
    FROM p12_carte NATURAL JOIN p12_carteedition NATURAL JOIN p12_edition
        WHERE nom_edition = 'Batailles de Legende : Armageddon';

    --On crée une vue pour stocker les éditions dans laquelle se trouvent la carte Exosœur Mikailis
    --2
    CREATE VIEW P12_editionDuneCarte AS
    SELECT nom_edition, date_edition, carte_rarete, carte_image
    FROM p12_carte NATURAL JOIN p12_carteedition NATURAL JOIN p12_edition
        WHERE carte_nom = 'Exosœur Mikailis';

    --On crée une vue pour stocker les cartes de type DINOSAURE
    --3
    CREATE VIEW P12_cartesDino AS
    SELECT carte_nom, carte_description, carte_image
    FROM p12_carte
        WHERE carte_type = 'DINOSAURE';

-- PROCEDURES ET FONCTIONS

-- 1 procedure qui ajoute une carte dans une collection
    CREATE OR REPLACE PROCEDURE P12_ajouterCarteCollection(numEdition integer, numCarte integer, numLangue integer, quant integer) IS
        ligneExiste number;
        invalidEdition EXCEPTION;
        invalidCarte EXCEPTION;
        invalidLangue EXCEPTION;
        minEdition INTEGER;
        maxEdition INTEGER;
        minCarte INTEGER;
        maxCarte INTEGER;
        minLangue INTEGER;
        maxLangue INTEGER;
    BEGIN --Gestion des exceptions
        SELECT MIN(num_edition) INTO minEdition FROM p12_edition;
        SELECT MAX(num_edition) INTO maxEdition FROM p12_edition;
        SELECT MIN(num_carte) INTO minCarte FROM p12_carte;
        SELECT MAX(num_carte) INTO maxCarte FROM p12_carte;
        SELECT MIN(num_langue) INTO minLangue FROM p12_langue;
        SELECT MAX(num_langue) INTO maxLangue FROM p12_langue;
        IF numEdition IS NULL OR numEdition < minEdition OR numEdition > maxEdition THEN
            RAISE invalidEdition;
        END IF;
        IF numCarte IS NULL OR numCarte < minCarte OR numCarte > maxCarte THEN
            RAISE invalidCarte;
        END IF;
        IF numLangue IS NULL OR numLangue < minLangue OR numLangue > maxLangue THEN
            RAISE invalidLangue;
        END IF;
        -- On vérifie si la ligne existe déjà
        SELECT count(*) INTO ligneExiste FROM p12_cartepossedee
        WHERE num_carte = numCarte AND num_edition = numEdition
                                   AND num_langue = numLangue;
        IF ligneExiste < 1 THEN
            INSERT INTO p12_cartepossedee VALUES (numCarte, numEdition, numLangue, quant);
        ELSE
            UPDATE p12_cartepossedee SET quantite=quantite + quant
                WHERE num_carte = numCarte AND num_edition = numEdition AND num_langue = numLangue;
        end if;
    EXCEPTION
        WHEN invalidEdition THEN
            DBMS_OUTPUT.PUT_LINE('Valeur saisie non valide : ' || numEdition );
        WHEN invalidCarte THEN
            DBMS_OUTPUT.PUT_LINE('Valeur saisie non valide : ' || numCarte );
        WHEN invalidLangue THEN
            DBMS_OUTPUT.PUT_LINE('Valeur saisie non valide : ' || numLangue );
    end;

--2 fonction qui retourne le numero d'une carte passée en parametre si elle existe
    CREATE OR REPLACE FUNCTION P12_carteNum(nomCarte varchar) RETURN integer IS
        id   integer ;
        nbId integer;
        plsCartes EXCEPTION;
    BEGIN
        SELECT COUNT(num_carte) INTO nbId FROM p12_carte WHERE carte_nom = nomCarte;
        IF (nbId > 1 OR nbId = 0) THEN
            RAISE plsCartes;
        ELSE
            SELECT num_carte INTO id FROM p12_carte WHERE carte_nom = nomCarte;
            RETURN id;
        END IF;
    EXCEPTION
        WHEN plsCartes THEN
            DBMS_OUTPUT.PUT_LINE('Nom carte non valide : ' || nomCarte );
            RETURN -1;
    END;

--3 Fonction qui retourne les cartes d'une edition qui prend en parametre le numero de l'edition
    --view utilisée pour la fonction
    CREATE VIEW P12_carEdit AS
    SELECT DISTINCT num_carte, num_edition FROM P12_CARTE
             NATURAL JOIN P12_CARTEEDITION NATURAL JOIN P12_EDITION
             ORDER BY num_carte;
    --Type utilisé pour la fonction
    CREATE OR REPLACE TYPE P12_CarteType AS OBJECT (
        num_carte INT,
        carte_nom VARCHAR2(255),
        carte_categorie VARCHAR2(10),
        carte_attribut VARCHAR2(30)
    );

    CREATE OR REPLACE TYPE P12_CarteTableType AS TABLE OF P12_CarteType;

    CREATE OR REPLACE FUNCTION P12_carteEditionId(numEdition INTEGER) RETURN P12_CarteTableType PIPELINED IS
        inValidEdition EXCEPTION;
        minEdition INTEGER;
        maxEdition INTEGER;
    BEGIN
        SELECT MIN(num_edition) INTO minEdition FROM p12_edition;
        SELECT MAX(num_edition) INTO maxEdition FROM p12_edition;
        IF numEdition IS NULL OR numEdition < minEdition OR numEdition > maxEdition  THEN
            RAISE inValidEdition;
        END IF;
        FOR carte_record IN (SELECT C.* FROM p12_carte C JOIN P12_carEdit CE ON C.num_carte = CE.num_carte WHERE num_edition = numEdition) LOOP
            PIPE ROW(P12_CarteType(
                carte_record.num_carte,
                carte_record.carte_nom,
                carte_record.carte_categorie,
                carte_record.carte_attribut
            ));
        END LOOP;
        RETURN;
    EXCEPTION
        WHEN inValidEdition THEN
            DBMS_OUTPUT.PUT_LINE('Edition non valide : ' || numEdition );
            RETURN;
    END;

        SELECT * FROM P12_carteEditionId(700) ;

--4 Donner une fonction ou un procédure mettant en œuvre un CURSEUR paramétrique.
    -- Fonction pour obtenir le nombre de cartes d'un type donné en parametre
    CREATE OR REPLACE FUNCTION P12_getNbCarteParType(card_type VARCHAR)
        RETURN INTEGER IS
        nbCartes INTEGER := 0;
        CURSOR curseurCarte IS SELECT COUNT(*)
                               FROM P12_carte
                               WHERE carte_type = card_type;
    BEGIN
        OPEN curseurCarte;
        FETCH curseurCarte INTO nbCartes;
        CLOSE curseurCarte;
        RETURN nbCartes;
    END;

--TRIGGERS
    --1 trigger qui notifie avant chaque insertion ou mis à jour dans p12_cartePossedee la quantité est differente
    CREATE OR REPLACE TRIGGER P12_notifQuantiteTrigger
        AFTER INSERT OR UPDATE OF quantite
        ON p12_cartepossedee
        FOR EACH ROW
    DECLARE
        ancienneQuantite INTEGER;
    BEGIN
        -- Récupération de l'ancienne quantité
        IF UPDATING THEN
            ancienneQuantite := NVL(:OLD.quantite, 0);
            DBMS_OUTPUT.PUT_LINE('Mise à jour - Ancienne valeur : ' || ancienneQuantite || ', Nouvelle valeur : ' ||
                                 :NEW.quantite);
        ELSE
            -- Comparer les quantités
            DBMS_OUTPUT.PUT_LINE('Nouvelle quantité : ' || :NEW.quantite);
        END IF;
    END;

    -- 2 Un trigger qui à chaque modification, ajout ou suppression dans la table p12_cartepossedee
    -- compte le nombre de cartes différentes présentes dans la collection
    CREATE OR REPLACE TRIGGER P12_notifaftermodifTrigger
        AFTER INSERT OR DELETE OR UPDATE
        ON p12_cartepossedee
        DECLARE
            nbLignes INTEGER;
        BEGIN
            -- nombre de cartes dans la collection
            SELECT COUNT(DISTINCT num_carte)
            INTO nbLignes
            FROM p12_cartepossedee;

            DBMS_OUTPUT.PUT_LINE(nbLignes || ' cartes différentes présentes dans la collection');
        END;

