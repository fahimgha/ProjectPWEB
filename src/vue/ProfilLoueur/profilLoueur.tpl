<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../vue/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../vue/css/style.css"/>
        <title>Mon profil</title>
    </head>

    <body>
          <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="../controle/profilLoueur.php">Accueil</a>
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
            </button>

                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <?php
                        if(!isset($_SESSION['id'])){
                        }else{
                          ?>
                              <li class="nav-item">
                                  <a class="nav-link" href="../controle/ajoutVehicule.php">Ajouter des vehicules</a>
                              </li>
                               <li class="nav-item">
                                  <a class="nav-link" href="../controle/vehiculeLoue.php">Afficher les vehicules loués</a>
                              </li>
                              <li class="nav-item">
                                  <a class="nav-link" href="../controle/vehiculeStock.php">Afficher les vehicules en stock</a>
                              </li>
                          <?php
                        } 
                    ?>
                </ul>
                <ul class="navbar-nav ml-md-auto">
                    <li class="nav-item">
                    <a class="nav-link" href="../controle/deconnexion.php">Déconnexion</a>
                    </li>
                </ul>
            </div>
        </nav>
        
        <h2>Voici le profil de <?= $afficher_profil['nom']; ?></h2>

        <div>Quelques informations sur vous : </div>
            <ul>
                <li>Votre id est : <?= $afficher_profil['id'] ?></li>
                <li>Votre mail est : <?= $afficher_profil['email'] ?></li>
            </ul>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrpa@4.5.3/dist/js/bootstrpa.bundle.min.js"></script>
        <script src="../vue/js/bootstrpa.min.js"></script>
    <body>
</html>