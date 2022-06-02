<?php
    session_start();
     $id = $_SESSION["id"];
     $username = $_SESSION["username"];
     $email = $_SESSION["email"];
    unset($_SESSION["id"]);
     unset($_SESSION["username"]);
      unset($_SESSION["email"]);
      setCookie("id", $id, time()-3600, "/");
        setCookie("username", $username, time()-3600, "/");
         setCookie("email", $email, time()-3600, "/");
    header("Location:login.php");
?>