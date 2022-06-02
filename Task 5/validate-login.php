<?php
session_start();

    extract($_POST);
    include 'config.php';
    
    $sql=mysqli_query($conn,"SELECT * FROM `users` WHERE email='$email' and password='$pass'");
    $row  = mysqli_fetch_array($sql);
    if(is_array($row))
    {
        $_SESSION["id"] = $row['id'];
        $_SESSION["username"]=$row['username']; 
        $_SESSION["email"]=$row['email'];
        $id = $_SESSION["id"];
        $username = $_SESSION["username"];
        $email = $_SESSION["email"];
          setCookie("id", $id, time() + 2 * 24 * 60 * 60, "/");
        setCookie("username", $username, time() + 2 * 24 * 60 * 60, "/");
         setCookie("email", $email, time() + 2 * 24 * 60 * 60, "/");
        header('Location: index.php?key='.$id); 
    }
    else
    {
        echo "Invalid Email/Password";
    }

?>