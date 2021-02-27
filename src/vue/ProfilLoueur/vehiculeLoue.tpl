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
        <br/>
        <br/>
        <div class="container">
 	   <div class="row">
        <h2> Mes véhicules en location</h2>
            <table class="table">
              <thead>
                <tr>  
                  <th scope="col">id</th>
                  <th scope="col">type de voiture</th>
                  <th scope="col">caracteristique</th>
                  <th scope="col">photo</th>
                  <th scope="col">Date de debut</th>
                  <th scope="col">Date de fin</th>
                  <th scope="col">Voir le profil</th>
                </tr>
              </thead>
            
            <tbody>
            <?php
                  // Foreach agit comme une boucle mais celle-ci s'arr�te de fa�on intelligente. 
                  // Elle s'arrete avec le nombre de lignes qu'il y a dans la variable $afficher_liste_voitures
                  // La variable $afficher_liste_voitures est comme un tableau contenant plusieurs valeurs
                  // pour lire chacune des valeurs distinctement on va mettre un pointeur que l'on papellera ici $pa
              foreach($afficher_liste_voitures_location as $pa){
            ?>
   
                <tr>          
                  <td><?= $pa['id'] ?></td>
                  <td><?= $pa['typev'] ?></td>
                  <td><?= $pa['caract'] ?></td>
                  <td><?= $pa['photo'] ?></td>
                  <td><?= $pa['DateD'] ?></td>
                  <td><?= $pa['DateF'] ?></td>
                  <td><a href="page pas cree.php?id=<?= $pa['id'] ?>">Aller au profil</a></td>
                </tr>  
            <?php
              }
            ?>
          </tbody>
        </table>
        </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrpa@4.5.3/dist/js/bootstrpa.bundle.min.js"></script>
        <script src="../vue/js/bootstrpa.min.js"></script>
    <body>
</html>