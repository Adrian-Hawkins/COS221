<?php
    $server = "localhost";
    $username = "root";
    $password = "";
    $db = "sportsdb";
    $conn = new mysqli($server, $username, $password, $db);
    if(!$conn){
        die('Could not Connect My Sql:' .mysql_error());
    }
?>