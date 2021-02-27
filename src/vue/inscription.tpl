<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Inscription</title>
    </head>

    <body>      
        <div>Inscription</div>

        <form method="post">
       
            <table>
            Vous voulez vous inscrire en tant que : <select name="usertype">
            <option value="client">client</option>
            <option value="loueur">loueur</option>
            </select>
            </td>
            </tr>
            <tr>
            </tr>
            </table>

            <input type="text" placeholder="Votre nom" name="nom" value="<?php if(isset($nom)){ echo $nom; }?>" required>      

            <?php
                if (isset($er_email)){
                ?>
                   <div><?= $er_email?></div>
                <?php
                }
            ?>
            <input type="email" placeholder="Adresse email" name="email" value="<?php if(isset($email)){ echo $email; }?>" required>

            <?php
                if (isset($er_mdp)){
                ?>
                    <div><?= $er_mdp ?></div>
                <?php   
                }
            ?>
            <input type="password" placeholder="Mot de passe" name="mdp" value="<?php if(isset($mdp)){ echo $mdp; }?>" required>
            <input type="password" placeholder="Confirmer le mot de passe" name="confmdp" required>

                <button type="submit" name="inscription">Envoyer</button>

        </form>
    </body>
</html>