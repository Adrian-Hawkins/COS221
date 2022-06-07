<?php
    include_once 'header.php';
    include 'config.php';
    $result = mysqli_query($conn, "SELECT * FROM table_tennis_event_stats");
    if($result->num_rows > 0){
        while($row = $result->fetch_assoc()){ 
            $id = $row["id"];
            $address = $row["address_id"];
            echo "<h2>".$row["event_name"]."</h2>";
            $r4 = mysqli_query($conn, "SELECT * FROM addresses WHERE id=$address");
            if($r4->num_rows > 0){
                while($row4 = $r4->fetch_assoc()){
                    echo "<h2>".$row4["street_number"]." ".$row4["street"]." street ".$row4["country"]."</h2>";
                }
            }
            $r2 = mysqli_query($conn, "SELECT * FROM table_tennis_match_stats WHERE id=$id");
            echo "<div class='flex'>";
            if($r2->num_rows > 0){
                echo "<table style='width:100%'>
                <tr>
                <th>Match</th>
                <th>Match Winner</th>
                <th>Match Loser</th>
                <th>Game</th>
                <th>Max Ponts in a Row</th>
                <th>Biggest Lead</th>
                <th>Server Points Won</th>
                <th>Serves Played</th>
                <th>Unforced errors</th>
              </tr>";
                while($row2 = $r2->fetch_assoc()){
                    echo "<tr>";

                    $id2 = $row2["id"];
                    $winner = $row2["m_winner_id"];
                    $loser = $row2["m_loser_id"];
                    //echo "Winner ".$id2;

                    echo "<td>".$row2["id"]."</td>";
                    //echo "<td>".$winner."</td>";
                    //echo "<td>".$loser."</td>";
                    $r7 = mysqli_query($conn, "SELECT * FROM players WHERE id=$winner");
                    if($r7->num_rows > 0){
                        while($row7 = $r7->fetch_assoc()){
                            echo "<td>".$row7["name"]."</td>";
                        }
                    }

                    $r8 = mysqli_query($conn, "SELECT * FROM players WHERE id=$loser");
                    if($r8->num_rows > 0){
                        while($row8 = $r8->fetch_assoc()){
                            echo "<td>".$row8["name"]."</td>";
                        }
                    }


                    echo "<td>";
                    $r3 = mysqli_query($conn, "SELECT * FROM table_tennis_game_stats WHERE match_stats_id=$id2");
                    if($r3->num_rows > 0){
                        echo "<ol>";
                        while($row3 = $r3->fetch_assoc()){
                            //echo "<li>"."Winner: ".$row3["game_winner_id"]."<br/>"."Loser: ".$row3["game_loser_id"]."</li>";
                            $gwinner = $row3["game_winner_id"];
                            $gloser = $row3["game_loser_id"];

                            $r9 = mysqli_query($conn, "SELECT * FROM players WHERE id=$gwinner");
                            if($r9->num_rows > 0){
                                while($row9 = $r9->fetch_assoc()){
                                    echo "<li>Winner: ".$row9["name"]."</li>";
                                }
                            }

                            $r10 = mysqli_query($conn, "SELECT * FROM players WHERE id=$gloser");
                            if($r10->num_rows > 0){
                                while($row10 = $r10->fetch_assoc()){
                                    echo "<li>Loser: ".$row10["name"]."</li>";
                                }
                            }
                        }
                        echo "</ol>";
                    }
                    echo"</td>";

                    echo "<td>".$row2["max_points_in_row"]."</td>";
                    echo "<td>".$row2["biggest_lead"]."</td>";
                    echo "<td>".$row2["service_points_won"]."</td>";
                    echo "<td>".$row2["serves_played"]."</td>";
                    echo "<td>".$row2["unforced_error"]."</td>";

                    echo "</tr>";
                }
                echo "</table>";
                //echo "</ul>";
            }
            echo "</div>";
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <style>
table, th, td {
    border:1px solid black;
  	color: black;
    text-align: center;
  }
  .flex {
      display: flex;
      align-items: center;
      justify-content: center;
  }
  h2, h3{
    color: black;
      text-align: center;
  }
    </style>
</body>
</html>
