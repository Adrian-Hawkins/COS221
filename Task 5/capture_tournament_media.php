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
  //  include_once "view_location_data";

    if(isset($_POST['tournament_name']) && ($_POST['game_number'] > 0 || $_POST['game_number'] <= 5))
    {
        $tournament_name = $_POST['tournament_name'];
        $sql_code = "INSERT INTO tournament_media(tournament_name) VALUES('$tournament_name');";
        
            $game_number = $_POST['game_number'];
            $sql_code. "INSERT INTO tournament_media(game_number) VALUES('$game_number');";

                if(isset($_POST['name_p1']))
                {
                    $name_p1 = $_POST['name_p1'];
                    $sql_code. "INSERT INTO tournament_media(player_1_name) VALUES('$name_p1');";

                    if(isset($_POST['name_p2']))
                    {
                        $name_p2 = $_POST['name_p2'];
                            $sql_code. "INSERT INTO tournament_media(player_2_name) VALUES('$name_p2');";
                    
                        if(isset($_POST['score_p1']))
                        {
                            $score_p1 = $_POST['score_p1'];
                            $sql_code. "INSERT INTO tournament_media(player_1_score) VALUES('$score_p1');";

                            if(isset($_POST['score_p2']))
                            {
                                $score_p2 = $_POST['score_p2'];
                                $sql_code. "INSERT INTO tournament_media(player_2_score) VALUES('$score_p2');";
            
                                    if(isset($_POST['tournament_media_button']))
                                    {
                                        $tournament_media_button = $_POST['tournament_media_button'];
                                     $sql_code. "INSERT INTO tournament_media(tournament_upload) VALUES('$tournament_media_button');";
                                    }
                                   if(isset($_POST['game_media_button']))
                                   {
                                    $game_media_button = $_POST['game_media_button'];
                                    $sql_code. "INSERT INTO tournament_media(game_media) VALUES('$game_media_button');";
                                   }
                                    if(isset($_POST['player_media_button']))
                                    {
                                        $player_media_button = $_POST['player_media_button'];
                                    $sql_code. "INSERT INTO tournament_media(player_media) VALUES('$player_media_button');";
                                    }
                                    
                                    if(isset($_POST['tournament_file_format']))
                                    {
                                        $tournament_file_format = $_POST['tournament_file_format'];
                                    $sql_code. "INSERT INTO tournament_media(tournament_file_format) VALUES('$tournament_file_format');";

                                    }
                                    if(isset($_POST['tournament_resolution']))
                                    {
                                        $tournament_resolution = $_POST['tournament_resolution'];
                                    $sql_code. "INSERT INTO tournament_media(tournament_resolution) VALUES('$tournament_resolution');";
                                    }

                                    if(isset($_POST['game_file_format']))
                                    {
                                        $game_file_format = $_POST['game_file_format'];
                                        $sql_code. "INSERT INTO tournament_media(game_file_format) VALUES('$game_file_format');";
                                    }
                                    if(isset($_POST['game_resolution']))
                                    {
                                        $game_resolution = $_POST['game_resolution'];
                                        $sql_code. "INSERT INTO tournament_media(game_resolution) VALUES('$game_resolution');";
                                    }
                                    if(isset($_POST['player_file_format']))
                                    {
                                        $player_file_format = $_POST['player_file_format'];
                                        $sql_code. "INSERT INTO tournament_media(player_file_format) VALUES('$player_file_format');";
                                    }
                                    if(isset($_POST['player_resolution']))
                                    {
                                        $player_resolution = $_POST['player_resolution'];
                                        $sql_code. "INSERT INTO tournament_media(player_resolution) VALUES('$player_resolution');";
                                    }
                    }
                }
            
        }
    }

       // $sql_code. "INSERT INTO tournament_media(tournament_name, tournament_upload, tournament_file_format, tournament_resolution, game_media, game_file_format, tournament_resolution, game_media, game_file_format, game_resolution, player_media, player_file format,player_resolution,player_1_name, player_2_name, player_1_score, player_2_score, player_1_game_number,player_2_game_number) VALUES('$tournament_name','$tournament_media','$tournament_file_format','$tournament_resolution','$game_media','$game_file_format','$game_resolution','$player_media','$player_file_format','$player_resolution','$player_1_name','$player_2_name','$player_1_score','$player_2_score');";

       if(isset($_POST['tournament_name']))
       {
            try
            {
                $conn->query($sql_code);
                echo "<center><h2>Data successfully saved</h2><center>";
                mysqli_close($conn);
            }

            catch(mysqli_sql_exception $e)
            {
                $error = $e->getMessage();
                echo "Error: " . $sql_code . "<br>" . $conn->error;
            }
        }
        
    }
?>

<body>
    <center>
        <?php //This should add the name of the tournament dynamically ?>
         
        <form id="tournament_media_form" method="post" action="capture_tournament_media.php">
            <fieldset>
                <legend><h2>Tournament</h2></legend>
            <label for="tournament_name"><h4>Tournament Name: </h4></label>
            <input type="text" id="tournament_name" name="tournament_name"><br><br>

            <label for="game_number"><h4>Game Number:</h4></label>
            <input type="number" id="game_number" name="game_number"><br><br>

            <label for="name_p1"><h4>Player One:</h4></label>
            <input type="text" id="name_p1" name="name_p1"> 
            <h4>Score:</h4> 
            <input type="number" id="score_p1" name="score_p1"><br><br>

            <label for="name_p2"><h4>Player Two:</h4></label>
            <input type="text" id="name_p2" name="name_p2">
            <h4> Score: </h4> 
            <input type="number" id="score_p2" name="score_p2"><br><br>
            </fieldset>

            <fieldset>
                <legend><h2>Media Upload</h2></legend>
            
            <fieldset>
            <h4>Tournament Media </h4>
            <input id="tournament_media_button" type="file" value="Upload" name="tournament_media_button"> <br>
            <label for="tournament_file_format">Format:</label>
            <select name="tournament_file_format" id="tournament_file_format">
            <option value="JPEG">JPEG</option>
            <option value=".png">.png</option>
            <option value=".Cr2">.Cr2</option>
            <option value=".tiff">.tiff</option>
            <option value=".gif">.gif</option>
            <option value=".raw">.raw</option>
            <option value=".nef">.nef</option>
            <option value=".PSD">.PSD</option>
            </select>
            <br>
            <br>
            <label for="tournament_resolution">Resolution:</label>
            <select name="tournament_resolution" id="tournament_resolution"><br><br>
            <option value="SD">SD</option>
            <option value="HD">HD</option>
            <option value="Full HD">Full HD</option>
            <option value="Quad HD">Quad HD</option>
            <option value="Ultra High Definition (UHD)">Ultra High Definition (UHD)</option>
            <option value="Full Ultra HD">Full Ultra HD</option>
            </select>
            <br>
            <br>
        
            </fieldset>
            <br>
            <fieldset>
            <h4> Game Media</h4>
            <input id="game_media_button" type="file" value="Upload" name="game_media_button"><br><br>
            <label for="game_file_format">Format:</label>
            <select name="game_file_format" id="game_file_format">
            <option value="JPEG">JPEG</option>
            <option value=".png">.png</option>
            <option value=".Cr2">.Cr2</option>
            <option value=".tiff">.tiff</option>
            <option value=".gif">.gif</option>
            <option value=".raw">.raw</option>
            <option value=".nef">.nef</option>
            <option value=".PSD">.PSD</option>
            </select>
            <br>
            <br>
            <label for="game_resolution">Resolution:</label>
            <select name="game_resolution" id="game_resolution">
            <option value="SD">SD</option>
            <option value="HD">HD</option>
            <option value="Full HD">Full HD</option>
            <option value="Quad HD">Quad HD</option>
            <option value="Ultra High Definition (UHD)">Ultra High Definition (UHD)</option>
            <option value="Full Ultra HD">Full Ultra HD</option> 
            </select>
            <br>
            <br>
            <br>
            </fieldset>
            <br>
            
            <fieldset>
            <h4>Player Media</h4>
            <input id="player_media_button" type="file" value="Upload" name="player_media_button"><br>
            <br><input id="player_name" type ="text" name=""><br><br>
            <label for="player_file_format">Format:</label>
            <select name="player_file_format" id="player_file_format">
            <option value="JPEG">JPEG</option>
            <option value=".png">.png</option>
            <option value=".Cr2">.Cr2</option>
            <option value=".tiff">.tiff</option>
            <option value=".gif">.gif</option>
            <option value=".raw">.raw</option>
            <option value=".nef">.nef</option>
            <option value=".PSD">.PSD</option>
            </select>
            <br>
            <br>
            <label for="player_resolution">Resolution:</label>
            <select name="player_resolution" id="player_resolution">
            <option value="SD">SD</option>
            <option value="HD">HD</option>
            <option value="Full HD">Full HD</option>
            <option value="Quad HD">Quad HD</option>
            <option value="Ultra High Definition (UHD)">Ultra High Definition (UHD)</option>
            <option value="Full Ultra HD">Full Ultra HD</option>
            </select>
            <br>
            <br>
            <br>
            </fieldset>
            
            <br>
            <input id="submit_Button" type="submit" value="Submit" name="capture_tournament_button">
            </fieldset>
        </form>
    </center>

</body>
</html>