<?php
    session_start();
    include("../modele/connexionDB.php"); // Fichier PHP contenant la connexion à votre BDD

    // S'il y a une session alors on ne retourne plus sur cette page
    if (isset($_SESSION['id'])){
        header('Location: ../index.php'); 
        exit;
    }

    // Si la variable "$_Post" contient des informations alors on les traitres
    if(!empty($_POST)){
        extract($_POST);
        $valid = true;

        // On se place sur le bon formulaire grâce au "name" de la balise "input"
        if (isset($_POST['inscription'])){
            $nom  = htmlentities(trim($nom)); // On récupére le nom
            $email = htmlentities(strtolower(trim($email))); // On récupére le mail
            $mdp = trim($mdp); // On récupére le mot de passe 
            $confmdp = trim($confmdp); //  On récupére la confirmation du mot de passe
            $usertype  = htmlentities(trim($usertype));

            // Vérification du mail
            if(empty($email)){
                $valid = false;
                $er_email = "Le mail ne peut pas être vide";

                // On vérifit que le mail est dans le bon format
            }elseif(!preg_match("/^[a-z0-9\-_.]+@[a-z]+\.[a-z]{2,3}$/i", $email)){
                $valid = false;
                $er_email = "Le mail n'est pas valide";

            }else{
                // On vérifit que le mail est disponible
                $req_email = $DB->query("SELECT email FROM utilisateur WHERE email = ?",
                    array($email));

                $req_email = $req_email->fetch();

                if ($req_email['email'] <> ""){
                    $valid = false;
                    $er_email = "Ce email existe déjà";
                }
            }

            // Vérification du mot de passe
            // if(empty($mdp)) {
            //     $valid = false;
            //     $er_mdp = "Le mot de passe ne peut pas être vide";

            // }else
            if($mdp != $confmdp){
                $valid = false;
                $er_mdp = "La confirmation du mot de passe ne correspond pas";
            }


            // Si toutes les conditions sont remplies alors on fait le traitement
            if($valid){

                $mdp = crypt($mdp, "$6$rounds=5000$macleapersonnaliseretagardersecret$");
                // On insert nos données dans la table client
                //$req = $DB->prepare('INSERT INTO client (nom, email, mdp) VALUES(?, ?, ?)');
                //$req->execute(array($nom, $email, $mdp));
                
                $DB->insert("INSERT INTO utilisateur(nom, email, mdp, usertype) VALUES 
                    (?, ?, ?, ?)", 
                    array($nom, $email, $mdp, $usertype));
                    
                header('Location: ../index.php');
                exit;
            }
        }
    }
    // if  (count($_POST)==0){
        require ("../vue/inscription.tpl");
    // }
?>

