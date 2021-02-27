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
            <a class="navbar-brand" href="../controle/profilClient.php">Accueil</a>
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
            </button>

                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-md-auto">
                    <li class="nav-item">
                    <a class="nav-link" href="../controle/deconnexion.php">Déconnexion</a>
                    </li>
                </ul>
            </div>
        </nav>
      <div class="container">
        <div class="row">
            <div></div>
            <div>
      <h2>Vous etes dans le profil Client, Voici le profil de <?= $afficher_profil['nom']; ?></h2>
      <div>Quelques informations sur vous : </div>
          <ul>
              <li>Votre id est : <?= $afficher_profil['id'] ?></li>
              <li>Votre mail est : <?= $afficher_profil['email'] ?></li>
          </ul>
          <a href="../controle/deconnexion.php">Déconnexion</a>
          <div>La liste de mes vehicules</div>
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
                  // pour lire chacune des valeurs distinctement on va mettre un pointeur que l'on appellera ici $ap
              foreach($afficher_liste_voitures_loue as $ap){
            ?>
                <tr>          
                  <td><?= $ap['id'] ?></td>
                  <td><?= $ap['typev'] ?></td>
                  <td><?= $ap['caract'] ?></td>
                  <td><?= $ap['photo'] ?></td>
                  <td><?= $ap['DateD'] ?></td>
                  <td><?= $ap['DateF'] ?></td>
                </tr>  
            <?php
              }
            ?>
          </tbody>
        </table>
                  <div>Sélectionnez les véhicules que vous désirez louer :</div>
             <table class="table">
              <thead>
                <tr>  
					<th scope="col"></th>
					<th scope="col">type de voiture</th>
					<th scope="col">caracteristique</th>
					<th scope="col">photo</th>
					<th scope="col">Date de début</th>
					<th scope="col">Date de fin</th>
                </tr>
              </thead>
            <tbody>
            <?php
              foreach($afficher_liste_voitures_dispo as $vd){
            ?>
   
                <tr>
					<td><input type="checkbox" name="select_voiture"></td> 
					<td><?= $vd['typev'] ?></td>
					<td><?= $vd['caract'] ?></td>
					<td><?= $vd['photo'] ?></td>
					<td><input type="date" name="DateD"></td>
					<td><input type="date" name="DateF"></td>
                </tr>  
            <?php
              }
            ?>
          </tbody>
        </table>
		<input type="button" name="validation" value="Valider"> 
          <div/>
          <div/>
          <div/>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../vue/js/bootstrap.min.js"></script>
    <body>
</html>