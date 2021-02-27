<?php
session_start();

    include('../modele/connexionDB.php'); 

    // S'il n'y a pas de session alors on ne va pas sur cette page
    if (!isset($_SESSION['id'])){
        header('Location: index.php'); 
        exit;
    }

    // On récupére les informations de l'utilisateur connecté
    $afficher_profil = $DB->query("SELECT * FROM utilisateur WHERE id = ?",
        array($_SESSION['id']));

    $afficher_profil = $afficher_profil->fetch();


    $afficher_liste_voitures_location = $DB->query("SELECT vehicule.id, vehicule.typev, vehicule.caract, vehicule.photo, facturation.DateD, facturation.DateF
    FROM vehicule
    INNER JOIN facturation ON facturation.idv = vehicule.id
    INNER JOIN utilisateur ON utilisateur.id = vehicule.idvl
    WHERE vehicule.idvl = $_SESSION[id]",
    array($_SESSION['id']));
    
    require ("../vue/profilLoueur/profilLoueur.tpl");

?>