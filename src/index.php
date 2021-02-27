<?php
    session_start(); // Permet de savoir s'il y a une session. C'est à dire si un utilisateur c'est connecté à votre site.

    include('modele/connexionDB.php'); // Fichier PHP contenant la connexion à votre BDD
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <link rel="stylesheet" href="vue/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="vue/css/style.css"/>

        <title>Accueil</title>
    </head>

    <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
	    <a class="navbar-brand" href="index.php">Accueil</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	    </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">

	        <ul class="navbar-nav ml-md-auto">
        	    <?php
                	if(!isset($_SESSION['id'])){
                    	?>
                        	<li class="nav-item">
                            	<a class="nav-link" href="controle/inscription.php">Inscription</a>
                        	</li>
	                        <li class="nav-item">
        	                    <a class="nav-link" href="controle/connexion.php">Connexion</a>
                	        </li>
	                    <?php
        	        }else{
                	    ?>
                        	<li class="nav-item">
	                            <a class="nav-link" href="controle/deconnexion.php">Déconnexion</a>
        	                </li>
                	    <?php
	                } 
        	    ?>
	        </ul>
	    </div>
	</nav>
        <div class="container">
 	   <div class="row">   
						
	        <div class="col-0 col-sm-0 col-md-2 col-lg-3"></div>
	        <div class="col-12 col-sm-12 col-md-8 col-lg-6">
	            <h1>Loueur de voiture </h1>

	            <div>
        	        <?php
                	    if(!isset($_SESSION['id'])){
                        	?>
	                            <a href="controle/motdepasse.php">Mot de passe oublié</a>
        	                <?php
                	    }
	                ?>
        	    </div>
	            <div>
        	            <?php
	                    if(isset($_SESSION['id'])){
                	        echo 'ID : ' . $_SESSION['id'] . ', Nom : ' . $_SESSION['nom'] . ", mail : " . $_SESSION['email'];
	                    } 
        	        ?>
	            </div>
        	</div>
	    </div>
	</div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="vue/js/bootstrap.min.js"></script>
    </body>
</html>



