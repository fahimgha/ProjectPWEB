<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../vue/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../vue/css/style.css"/>
        <title>AjoutVehicule</title>
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
        <div>AjoutVehicule</div>

        <form method="post" enctype = "multipart/form-data">

            <input type="text" placeholder="Le type du vehicule" name="type" value="<?php if(isset($type)){ echo $type; }?>" required>
            <input type="text" placeholder="Nombre de voiture" name="nb" value="<?php if(isset($nb)){ echo $nb; }?>" required>
            <input type="text" placeholder="Caracteristique " name="caract" value="<?php if(isset($caract)){ echo $caract; }?>" required>
            <input type="text" placeholder="disponibilité en location " name="location" value="<?php if(isset($location)){ echo $location; }?>" required>
            <br/><br/>
            <input type="file" placeholder="photo" name="photo" value="<?php if(isset($filename)){ echo $filename; }?>" required>
                <button type="submit" name="ajoutVehicule">ajouter</button>
               
        </form>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrpa@4.5.3/dist/js/bootstrpa.bundle.min.js"></script>
        <script src="../vue/js/bootstrpa.min.js"></script>
    </body>
</html>