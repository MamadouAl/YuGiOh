-- SRIPTS DE SUPPRESSIONS
-- Script SQL qui supprime l’ensemble de votre base de données :

    -- Suppression des triggers
    DROP TRIGGER P12_updateCarteEditionTrigger ON P12_carteEdition;
    DROP TRIGGER P12_notifQuantiteTrigger ON p12_cartepossedee;

    -- Suppression des fonctions et procedures
    DROP FUNCTION P12_updateCarteEdition();
    DROP FUNCTION P12_notifQuantite();
    DROP FUNCTION P12_getNbCarteParType(card_type VARCHAR);
    DROP FUNCTION P12_carteEditionId(numEdition integer);
    DROP FUNCTION P12_carteNum(nomCarte varchar);
    DROP PROCEDURE P12_ajouterCarteCollection(numEdition integer, numCarte integer, numLangue integer, quant integer);

    -- Suppression des vues
    DROP VIEW P12_cartesDino;
    DROP VIEW P12_editionDuneCarte;
    DROP VIEW P12_carteDuneEdition;
    DROP VIEW P12_carEdit;

    -- Suppression des tables de la base de données
       -- A utiliser avec précaution :)
    DROP TABLE P12_cartePossedee;
    DROP TABLE P12_carteEdition;
    DROP TABLE P12_carte;
    DROP TABLE P12_edition;
    DROP TABLE P12_langue;

