<?php
session_start();

    include('../modele/connexionDB.php'); 

    // S'il n'y a pas de session alors on ne va pas sur cette page
    if (!isset($_SESSION['id'])){
        header('Location: index.php'); 
        exit;
    }

    $afficher_liste_voitures_stock = $DB->query("SELECT vehicule.id, vehicule.typev,vehicule.nb, vehicule.caract, 
    vehicule.locationv,vehicule.photo
    FROM vehicule
    INNER JOIN utilisateur ON utilisateur.id = vehicule.idvl
    WHERE vehicule.idvl = $_SESSION[id] AND vehicule.locationv = 'En revision' OR vehicule.idvl = $_SESSION[id] AND vehicule.locationv = 'disponible' ",
    array($_SESSION['id']));
    
    require ("../vue/profilLoueur/vehiculeStock.tpl");

?>