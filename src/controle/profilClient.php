<?php
session_start();

    include('../modele/connexionDB.php'); 

    // S'il n'y a pas de session alors on ne va pas sur cette page
    if (!isset($_SESSION['id'])){
        header('Location: ../index.php'); 
        exit;
    }

    // On récupére les informations de l'utilisateur connecté
    $afficher_profil = $DB->query("SELECT * FROM utilisateur WHERE id = ? ",
        array($_SESSION['id']));

    $afficher_profil = $afficher_profil->fetch();

    $afficher_liste_voitures_loue = $DB->query("SELECT vehicule.id, vehicule.typev, vehicule.caract, vehicule.photo, facturation.DateD, facturation.DateF
    FROM facturation
    INNER JOIN vehicule ON vehicule.id = facturation.idv
    INNER JOIN utilisateur ON utilisateur.id = facturation.ide
    WHERE facturation.ide = $_SESSION[id]",
    array($_SESSION['id']));

    $afficher_liste_voitures_dispo = $DB->query("SELECT vehicule.typev,vehicule.nb, vehicule.caract, 
    vehicule.locationv,vehicule.photo
    FROM facturation
    INNER JOIN utilisateur ON utilisateur.id = facturation.ide
    INNER JOIN vehicule ON vehicule.id = facturation.idv
    WHERE $_SESSION[id] <> facturation.ide AND vehicule.locationv = 'disponible'",
    array($_SESSION['id']));

    require ("../vue/profilClient/profilClient.tpl");

?>