
-- CREATION DE VIEWS
--  vues qui representent les informations utiles pour l'utilisateur .

    --1 On crée une vue pour stocker les cartes de l'edition -> Batailles de Legende : Armageddon
    CREATE VIEW P12_carteDuneEdition AS SELECT DISTINCT C.num_carte, C.carte_nom, C.carte_description, C.carte_image,C.carte_categorie, CE.carte_rarete
    FROM p12_carte C NATURAL JOIN p12_carteedition CE NATURAL JOIN p12_edition
    WHERE nom_edition='Batailles de Legende : Armageddon';

    --2 On crée une vue pour stocker les éditions dans laquelle se trouvent la carte Exosœur Mikailis
    CREATE VIEW P12_editionDuneCarte AS SELECT nom_edition, date_edition, carte_rarete, carte_image
    FROM p12_carte C NATURAL JOIN p12_carteedition NATURAL JOIN p12_edition
    WHERE carte_nom = 'Exosœur Mikailis';

    --2 On crée une vue pour stocker les cartes de type DINOSAURE
    CREATE VIEW P12_cartesDino AS SELECT carte_nom, carte_description, carte_image
    FROM p12_carte
    WHERE carte_type = 'DINOSAURE';

-- PROCEDURES ET FONCTIONS

    -- 1 procedure qui ajoute une carte dans une collection
    CREATE OR REPLACE PROCEDURE P12_ajouterCarteCollection(numEdition integer, numCarte integer, numLangue integer, quant integer) AS $$
        DECLARE --Gestion des exceptions
            ligneExiste integer;
            minEdition integer;
            maxEdition integer;
            minCarte integer;
            maxCarte integer;
            minLangue integer;
            maxLangue integer;
    BEGIN
        SELECT MIN(num_edition) INTO minEdition FROM p12_edition;
        SELECT MAX(num_edition) INTO maxEdition FROM p12_edition;
        SELECT MIN(num_carte) INTO minCarte FROM p12_carte;
        SELECT MAX(num_carte) INTO maxCarte FROM p12_carte;
        SELECT MIN(num_langue) INTO minLangue FROM p12_langue;
        SELECT MAX(num_langue) INTO maxLangue FROM p12_langue;
        IF numEdition < minEdition OR numEdition is null OR numEdition > maxEdition THEN
            RAISE NOTICE 'Numero d''édtion non valide : %',  numEdition;
            RETURN;
        END IF;
        IF numCarte < minCarte OR numCarte is null OR numCarte > maxCarte THEN
            RAISE NOTICE 'Numero de carte non valide : %',  numCarte;
            RETURN;
        END IF;
        IF numLangue < minLangue OR numLangue is null OR numLangue > maxLangue THEN
            RAISE NOTICE 'Numero de langue non valide : %',  numLangue;
            RETURN;
        END IF;
        SELECT count(*) FROM p12_cartepossedee WHERE num_carte=numCarte AND num_edition=numEdition AND num_langue=numLangue into ligneExiste ;
        IF ligneExiste < 1 THEN
            INSERT INTO p12_cartepossedee VALUES (numCarte,numEdition,numLangue,quant);
        ELSE
            UPDATE p12_cartepossedee SET quantite=quantite+quant WHERE num_carte=numCarte AND num_edition=numEdition AND num_langue=numLangue ;
        end if;
    end;
    $$LANGUAGE plpgsql;

    --2 fonction qui retourne le numero d'une carte passée en parametre si elle existe
    CREATE OR REPLACE FUNCTION P12_carteNum(nomCarte varchar) RETURNS integer AS $$
        DECLARE id integer ;
                nbId integer;
        BEGIN
            SELECT COUNT(num_carte) INTO nbId FROM p12_carte WHERE carte_nom = nomCarte;
            IF (nbId > 1 OR nbId=0) THEN
            RAISE NOTICE 'Nom carte non valide : %',  nbId;
            RETURN -1;
            ELSE
            SELECT num_carte INTO id FROM p12_carte WHERE carte_nom = nomCarte;
            RETURN id;
            END IF ;
        END;

    $$LANGUAGE plpgsql;

    --3 Fonction qui retourne les cartes d'une édition et qui prend en parametre le numero de l'edition

    CREATE VIEW P12_carEdit AS SELECT DISTINCT C.num_carte, num_edition
    FROM p12_carte C NATURAL JOIN p12_carteedition NATURAL JOIN p12_edition
    ORDER BY num_carte ;

    CREATE OR REPLACE FUNCTION P12_carteEditionId(numEdition integer) RETURNS SETOF p12_carte AS $$
        DECLARE
            ligne p12_carte%ROWTYPE ;
            minEdition integer;
            maxEdition integer;
        BEGIN
            SELECT MIN(num_edition) INTO minEdition FROM p12_edition;
            SELECT MAX(num_edition) INTO maxEdition FROM p12_edition;
            IF numEdition < minEdition OR numEdition > maxEdition  OR numEdition is null THEN
            RAISE NOTICE 'Numero d''édtion non valide : %',  numEdition;
            RETURN;
            END IF;
            FOR ligne IN (SELECT C.* FROM p12_carte C, P12_carEdit CE
                                     WHERE C.num_carte=CE.num_carte AND num_edition=numEdition) LOOP
            RETURN NEXT ligne;
            END LOOP ;
            RETURN ;
        END;
    $$ LANGUAGE plpgsql ;

SELECT * FROM P12_carteEditionId(-2);


    --4 Donner une fonction ou un procédure mettant en œuvre un CURSEUR paramétrique.
      -- Fonction pour obtenir le nombre de cartes d'un type donné en parametre
    CREATE OR REPLACE FUNCTION P12_getNbCarteParType(card_type VARCHAR)
    RETURNS INTEGER AS $$
    DECLARE
        nbCartes INTEGER;
        curseurCarte CURSOR FOR SELECT COUNT(*) FROM P12_carte WHERE carte_type = $1;
    BEGIN
        OPEN curseurCarte;
        FETCH curseurCarte INTO nbCartes;
        CLOSE curseurCarte;
        RETURN nbCartes;
    END;
    $$ LANGUAGE plpgsql;

--TRIGGERS

  --1 trigger qui notifie avant chaque insertion ou mis à jour dans p12_cartePossedee la quantité est differente
    -- en utilisant FOR EACH ROW
    CREATE OR REPLACE FUNCTION P12_notifQuantite()
    RETURNS TRIGGER AS $$
    DECLARE
        ancienneQuantite INTEGER;
    BEGIN
        -- Récuperation de l'ancienne quantité
        IF TG_OP = 'UPDATE' THEN
            SELECT quantite INTO ancienneQuantite
            FROM p12_cartepossedee
            WHERE num_carte = NEW.num_carte AND num_edition = NEW.num_edition AND num_langue = NEW.num_langue;
            RAISE NOTICE 'Mise à jour - Ancienne valeur : %, Nouvelle valeur : %',
                         ancienneQuantite, NEW.quantite;
        END IF;

        -- Comparer les quantités
        IF TG_OP = 'INSERT' THEN
            RAISE NOTICE 'Nouvelle quantité : %', NEW.quantite;
        END IF;

        RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;

    -- Création du trigger
    CREATE OR REPLACE TRIGGER P12_notifQuantiteTrigger
    BEFORE INSERT OR UPDATE ON p12_cartepossedee
    FOR EACH ROW
    EXECUTE PROCEDURE P12_notifQuantite();

    -- 2 Un trigger qui à chaque modification, ajout ou suppression dans la table p12_cartepossedee
    -- compte le nombre de cartes DIFFÉRENTES présentes dans la collection
        -- en utilisant FOR EACH STATEMENT
    CREATE OR REPLACE FUNCTION P12_notifaftermodif()
    RETURNS TRIGGER AS $$
        DECLARE nbLignes integer;
        BEGIN
            -- nombre de cartes dans la collection
                SELECT count(DISTINCT num_carte) INTO nbLignes
                FROM p12_cartepossedee;
                RAISE NOTICE '% cartes différentes présentes dans la collection',
                              nbLignes;
            RETURN NEW;
        END;
    $$LANGUAGE plpgsql;

    -- Création du trigger
    CREATE OR REPLACE TRIGGER P12_notifaftermodifTrigger
    AFTER INSERT OR DELETE OR UPDATE ON p12_cartepossedee
    FOR EACH STATEMENT
    EXECUTE PROCEDURE P12_notifaftermodif();
