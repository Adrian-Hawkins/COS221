<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View tournament location details</title>
</head>

<?php
    include 'config.php';
    include_once 'header.php';

    if(isset($_POST['tournament_name']) )
    {
        $game_counter = 0;
        $tournament_name_user_entry = $_POST['tournament_name'];

        $sql_code = "SELECT game_location, player_1_name, player_2_name
        FROM game_location WHERE tournament_name = '$tournament_name_user_entry'" ;

        try
        {
            $result = mysqli_query($conn, $sql_code);
            //$result = $conn->query($sql_code);

            while ($row = $result->fetch_row()) 
            {
                $game_counter++;

                if($game_counter == 1)
                {
                    echo "<center><h1> Here is the location information for the  " . $tournament_name_user_entry . " tournament.</h1><br><br><hr><hr>"; 
                }

                $game_location = $row[0];
                $game_player_1 = $row[1];
                $game_player_2 = $row[2];

                echo " <center><h2> Game " . $game_counter . " location: " . $game_location . "</h2>" ;
                echo "<h2> Game " . $game_counter . " players: " . $game_player_1 . " vs " . $game_player_2 . "</h2><hr>";
            }

            if($game_counter == 0)
            {
                echo "<center><h2> Please enter a valid tournament name<h2></center>";
            }
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
        <form id="sport_location_form" method="post" action="view_location_data.php">
            <label for="tournament_name">Enter the name of the tournament:</label><br>
            <input type="text" id="tournament_name" name="tournament_name"><br><br>

            <input id="submit_Button" type="submit" value="Submit" name="sport_location_submit_button">
        </form>
    </center>
</body>
</html>