 ---- SRIPTS DE SUPPRESSIONS
    -- Script SQL qui supprime l’ensemble de votre base de données :
    -- Suppression des vues
    DROP VIEW P12_carteDuneEdition;
    DROP VIEW P12_editionDuneCarte;
    DROP VIEW P12_cartesDino;
    DROP VIEW P12_carEdit;


    -- Suppression des fonctions et procédures
    DROP FUNCTION P12_carteEditionId;
    DROP FUNCTION P12_getNbCarteParType;
    DROP PROCEDURE P12_ajouterCarteCollection;
    DROP FUNCTION P12_carteNum;

    -- Suppression des triggers et types
    DROP TYPE P12_CarteTableType;
    DROP TYPE P12_CarteType;
    DROP TRIGGER P12_notifQuantiteTrigger;
    DROP TRIGGER P12_notifaftermodifTrigger;

    -- Suppression des séquences
    DROP SEQUENCE SEQ;
    DROP SEQUENCE SEQ_AUTEUR;

    -- Suppression des tables
    DROP TABLE p12_cartepossedee;
    DROP TABLE p12_carteedition;
    DROP TABLE p12_carte;
    DROP TABLE p12_edition;
    DROP TABLE p12_langue;


