<header>
    <?php include_once "header.php" ?>;
</header>

<div class="options">
    <form>
        <input onclick="addPlayer()" type="button" value="Add Player"/>
        <input onclick="viewPlayers()" type="button" value="View Players"/>
    </form>
</div>

<br/>

<?php include 'addPlayers.php'; ?>

<?php if(isset($result)) { ?>
                <h1><?php echo $result; ?></h1>
        <?php } ?>

<div id="add" class="add">
    <h2>Add Player</h2>

    <form action="" method="post">
        <input type="text" placeholder="name" name="name"/><br/>
        <input type="text" placeholder="surname" name="surname"/><br/>
        <input type="text" placeholder="gender" name="gender"/><br/>
        <input type="text" placeholder="organisation" name="organisation"/><br/>
        <input type="date" placeholder="date of birth" name="dob"/><br/>
        <input type="submit"/>
    </form>
</div>

<div id="view" class="view" onload="">
    <table border="1" cellspacing="1" cellpadding="20"> 
        <tr> 
            <td> <font face="Arial">ID</font> </td> 
            <td> <font face="Arial">Name</font> </td> 
            <td> <font face="Arial">Surname</font> </td> 
            <td> <font face="Arial">Gender</font> </td> 
            <td> <font face="Arial">Birth Date</font> </td>
            <td> <font face="Arial">Organisation</font> </td> 
        </tr>

        <?php include 'viewPlayers.php'; ?>

    </table>

    <br/>

    <div id="remove" class="remove">
    <form action="" method="post">
        <label>Enter Player id to remove</label>
        <input type="text" name="id"/>
        <input type="submit"/>
    </form>
</div>
</div>

<style>
    .add
    {
        display: none;
        background-color: #fff;
        width: 50%;
        margin: 30px auto;
        text-align: center;
        padding: 20px 0 0 0;
        border-radius: 4px;
        box-shadow: 0px 30px 50px 0px rgba(0, 0, 0, 0.2);
    }

    .view
    {
        display: none;
        padding-left: 10%;
    }

</style>

<script>
    function addPlayer()
    {
        document.getElementById("add").style.display = "Initial";
        document.getElementById("view").style.display = "none";
    }

    function viewPlayers()
    {
        document.getElementById("add").style.display = "none";
        document.getElementById("view").style.display = "Initial";
    }
</script>