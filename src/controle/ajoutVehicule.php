<?php

    session_start();

    include('../modele/connexionDB.php'); // Fichier PHP contenant la connexion à votre BDD

    // Si la variable "$_Post" contient des informations alors on les traitres
    if(!empty($_POST)){
        extract($_POST);
        $valid = true;
        
        // On se place sur le bon formulaire grâce au "name" de la balise "input"
        if (isset($_POST['ajoutVehicule'])){
            $type  = htmlentities(trim($type)); 
            $caract  = htmlentities(trim($caract));
            $nb  = htmlentities(trim($nb));
            $location  = htmlentities(trim($location));
            $filename  = $_FILES['photo']['name'];
            $file_tmp_name = $_FILES['photo']['tmp_name'];
            $file_extension = strrchr($filename, ".");
            
            $file_dest ='../vue/images/'.$filename;
            $extensions_autorisees = array('.png','.PNG');

                if(in_array($file_extension ,$extensions_autorisees)){
                    if(move_uploaded_file($file_tmp_name,$file_dest)){
                        echo 'Fichier envoyé avec succès';
                    } else {
                        echo "une erreur est survenue lores de l'envoie du fichier";
                        $valid=false;
                    }
                }else {
                    echo'seuls les fichiers de type png et jpg sont autorisés';
                    $valid=false;
                } 
            
        
            if($valid){
                $DB->insert("INSERT INTO vehicule(typev, nb, caract, locationv,photo) VALUES 
                    (?, ?, ?, ?, ?)", 
                    array($type, $nb, $caract, $location,$filename));
                    header('Location: ../controle/profilLoueur.php');
                     exit;
            }
        }
    }

    require ("../vue/profilLoueur/ajoutVehicule.tpl");
?>