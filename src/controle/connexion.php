<?php
    session_start();

    include('../modele/connexionDB.php'); // Fichier PHP contenant la connexion à votre BDD

  // S'il y a une session alors on ne retourne plus sur cette page  
    if (isset($_SESSION['id'])){
        header('Location: index.php');
        exit;
    }

    // Si la variable "$_Post" contient des informations alors on les traitres
    if(!empty($_POST)){
        extract($_POST);
        $valid = true;

        if (isset($_POST['connexion'])){

            $email = htmlentities(strtolower(trim($email)));
            $mdp = trim($mdp);

            if(empty($email)){ // Vérification qu'il y est bien un mail de renseigné
                $valid = false;
                $er_email = "Il faut mettre un mail";
            }

            if(empty($mdp)){ // Vérification qu'il y est bien un mot de passe de renseigné
                $valid = false;
                $er_mdp = "Il faut mettre un mot de passe";
            }

            // On fait une requete pour savoir si le couple mail / mot de passe existe bien car le mail est unique !
            $req = $DB->query("SELECT * 
                FROM utilisateur 
                WHERE email = ? AND mdp = ?",
                array($email, crypt($mdp, "$6$rounds=5000$macleapersonnaliseretagardersecret$")));
                
            $req = $req->fetch();

            // Si on a pas de résultat alors c'est qu'il n'y a pas d'utilisateur correspondant au couple mail / mot de passe
            if ($req['id'] == ""){
                $valid = false;
                $er_email = "Le mail ou le mot de passe est incorrecte";
            }
            
            if ($req['usertype'] == "client"){
                
                if ($valid){

                    $_SESSION['id'] = $req['id']; // id de l'utilisateur unique pour les requètes futures
                    $_SESSION['nom'] = $req['nom'];
                    $_SESSION['email'] = $req['email'];
                    $_SESSION['usertype'] = $req['usertype'];
                    header('Location:  ../controle/profilClient.php');
                    exit;
                }
            }else{

            // S'il y a un résultat alors on va charger la SESSION de l'utilisateur en utilisateur les variables $_SESSION
            if ($valid){

                $_SESSION['id'] = $req['id']; // id de l'utilisateur unique pour les requètes futures
                $_SESSION['nom'] = $req['nom'];
                $_SESSION['email'] = $req['email'];
                $_SESSION['usertype'] = $req['usertype'];
                header('Location: ../controle/profilLoueur.php');
                exit;
            }   
        }
        }
    }
    require ("../vue/connexion.tpl");
?>