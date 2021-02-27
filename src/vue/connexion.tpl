<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Connexion</title>
    </head>

    <body>      
        <div>Se connecter</div>
        <form method="post">

            <?php
                if (isset($er_email)){
            ?>
                <div><?= $er_email ?></div>
            <?php   
                }
            ?>

            <input type="email" placeholder="Adresse mail" name="email" value="<?php if(isset($email)){ echo $email; }?>" required>

            <?php
                if (isset($er_mdp)){
            ?>
                <div><?= $er_mdp ?></div>
            <?php   
                }
            ?>
            <input type="password" placeholder="Mot de passe" name="mdp" value="<?php if(isset($mdp)){ echo $mdp; }?>" required>

            <button type="submit" name="connexion">Se connecter</button>
            <br><br>
            <a href="../motdepasse.php">Mot de passe oublié</a>
        </form>
    </body>
</html>