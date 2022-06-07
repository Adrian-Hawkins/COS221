<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter tournament Media</title>
</head>

<?php
    include_once 'header.php';
    include_once "view_location_data";

    if(isset($_POST['tournament_details']))
    {
        $tournament_name = $_POST['tournament_name'];
        $player_1_name = $_POST['player_1_name'];
        $player_1_surname = $_POST['player_1_surname'];
        $player_2_name = $_POST['player_2_name'];
        $player_2_surname = $_POST['player_2_surname'];
        $player_1_score = $_POST['player_1_score'];
        $player_2_score = $_POST['player_2_score'];
        $tournament_media = $_POST['tournament_media_button'];
        $game_media = $_POST['game_media_button'];
        $player_media = $_POST['player_media_button'];

        $sql_code = "INSERT INTO sportsdb.tournament_media VALUES('$tournament_name','$tournament_media','$game_media','$player_media','$player_1_name','$player_1_surname','$player_2_name','$player_2_surname','$player_1_score', '$player_2_score');";
        try
        {
            $conn->query($sql_code);
            echo "<center><h2>Data successfully saved</h2><center>";

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
        <?php //This should add the name of the tournament dynamically ?>
         
        <form id="game_number_form" method="post" action="capture_game_scores.php">
            <fieldset>
                <legend>Tournament</legend>
            <label for="tournament_name">Tournament Name: </label><br>
            <input type="text" id="tournament_name" name="tournament_name"><br><br>

            <label for="game_number">Game Number:</label><br>
            <input type="text" id="game_number" name="game_number"><br><br>

            <label for="name_p1">Player One:</label><br>
            <input type="text" id="name_p1" name="name_p1"> 
            <input type="text" id="surname_p1" name="surname_p1">Score: 
            <input type="text" id="score_p1" name="score_p1"><br><br>

            <label for="name_p2">Player Two:</label><br>
            <input type="text" id="name_p2" name="name_p2">
            <input type="text" id="surname_p2" name="surname_p2"> Score: 
            <input type="text" id="score_p2" name="score_p2"><br><br>

            </fieldset>

            <fieldset>
                <legend>Upload Media</legend>
            
            <h3>Tournament:</h3>
            <input id="tournament_media_button" type="file" value="Upload" name="tournament_media_button">
            <br>
            <h3>Game:</h3>
            <input id="game_media_button" type="file" value="Upload" name="game_media_button">  
            <br>
            <h3>Player</h3>
            <input id="player_media_button" type="file" value="Upload" name="player_media_button">
            <input id="player_name" type ="text" name="">

            <input id="submit_Button" type="submit" value="Submit" name="Game_Details_button">
            </fieldset>
        </form>
    </center>

    <input type="button" href="logout.php" value="logout" name="logout_button">
    
</body>
</html>