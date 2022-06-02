<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter tournament location details</title>
</head>

<?php
    include_once 'header.php';

    if(isset($_POST['tournament_name']) )
    {
        $tournament_name_user_entry = $_POST['tournament_name'];
        $game_location_user_entry = $_POST['game_location'];
        $player_1_name_user_entry = $_POST['player_1_name'];
        $player_2_name_user_entry = $_POST['player_2_name'];

        $sql_code = "INSERT INTO sportsdb.game_location (tournament_name, game_location, player_1_name, player_2_name) VALUES('$tournament_name_user_entry', '$game_location_user_entry', '$player_1_name_user_entry', '$player_2_name_user_entry');";

        

        try
        {
            $conn->query($sql_code);
            echo "<center><h2>Game location data inserted successfully</h2><center>";

        }

        catch(mysqli_sql_exception $e)
        {
            $error = $e->getMessage();
            echo "Error: " . $sql_code . "<br>" . $conn->error;
        }

    }
?>

<body>
    <center>
        <form id="sport_location_form" method="post" action="insert_location_data.php">
            <label for="tournament_name">Tournament name:</label><br>
            <input type="text" id="tournament_name" name="tournament_name"><br><br>

            <label for="game_location">Game location:</label><br>
            <input type="text" id="game_location" name="game_location"><br><br>

            <label for="player_1_name">Name of first player:</label><br>
            <input type="text" id="player_1_name" name="player_1_name"><br><br>

            <label for="player_2_name">Name of second player:</label><br>
            <input type="text" id="player_2_name" name="player_2_name"><br><br>



            <input id="submit_Button" type="submit" value="Submit" name="sport_location_submit_button">
        </form>
    </center>
    
</body>
</html>