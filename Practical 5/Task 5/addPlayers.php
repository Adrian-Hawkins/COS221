<?php

use LDAP\Result;

    session_start();

    extract($_POST);
    include 'config.php';

    function addPlayer($name, $surname, $gender, $dob)
    {
        global $conn;

        $query = "INSERT INTO players (name, surname, gender, birth_date)
            VALUES ('{$name}','{$surname}','{$gender}','{$dob}')";

        $conn->query($query);
    }

    function remove($index)
    {
        global $conn;
        $query = "DELETE FROM players WHERE id = '$index'";
        $conn->query($query);
    }

    if(isset($_POST['id']))
    {
        if(empty(trim($_POST['id'])))
        {
            $result = '';
        }
        else
        {
            remove($_POST['id']);
            $result = "Player removed";
        }
    }

    if(isset($_POST['name']) && isset($_POST['surname']) && 
        isset($_POST['gender']) && isset($_POST['dob']))
    {
        if(empty(trim($_POST['name'])) && empty(trim($_POST['surname'])) && 
        empty(trim($_POST['gender'])) && empty(trim($_POST['dob'])))
        {
            $result = '';
        }
        else
        {
            addPlayer($_POST['name'], $_POST['surname'], $_POST['gender'], $_POST['dob']);
            $result = 'Player Added.';
        }
    }
?>