<?php

    extract($_POST);
    include 'config.php';
    
    //$name = $conn->real_escape_string($_POST['field1']);
    //$surname = $conn->real_escape_string($_POST['field2']);
    //$gender = $conn->real_escape_string($_POST['field3']);

    $query = "SELECT * FROM players";
    
    //$conn->query($query);

    /*echo '<table border="0" cellspacing="2" cellpadding="2"> 
      <tr> 
          <td> <font face="Arial">id</font> </td> 
          <td> <font face="Arial">name</font> </td> 
          <td> <font face="Arial">surname</font> </td> 
          <td> <font face="Arial">gender</font> </td> 
          <td> <font face="Arial">birth date</font> </td> 
      </tr>';*/

    $deletedrow = '';

    if($result = $conn->query($query))
    {
        while ($row = $result->fetch_assoc()) 
        {
            $id = $row["id"];
            $name = $row["name"];
            $surname = $row["surname"];
            $gender = $row["gender"];
            $bod = $row["birth_date"];
            $org = $row["organisation"];

            echo '<tr> 
                  <td id="row_id">'.$id.'</td> 
                  <td>'.$name.'</td> 
                  <td>'.$surname.'</td> 
                  <td>'.$gender.'</td> 
                  <td>'.$bod.'</td>
                  <td>'.$org.'</td>';
        }

    }

    $conn->close();
?>