<?php
  session_start();
  session_destroy();
  header('location: ../index.php'); // la page sur lequel l'utilisateur sera redirigé.
  exit;
?>