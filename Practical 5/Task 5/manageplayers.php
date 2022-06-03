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
        <input type="date" placeholder="date of birth" name="dob"/><br/>
        <input type="submit"/>
    </form>
</div>

<div id="view" class="view" onload="">
    <table border="0" cellspacing="1" cellpadding="20"> 
        <tr> 
            <td> <font face="Arial">id</font> </td> 
            <td> <font face="Arial">name</font> </td> 
            <td> <font face="Arial">surname</font> </td> 
            <td> <font face="Arial">gender</font> </td> 
            <td> <font face="Arial">birth date</font> </td> 
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
    input
    {
        text-decoration: none;
        color: #008148;
    }

    input.tag
    {
        text-decoration: none;
        color: orangered;
    }

    input:hover
    {
        color: black;
    }

    .options
    {
        overflow: hidden;
        width: 100%;
    }

    .options input
    {
        background-color: #008148;
        float: left;
        color: white;
        text-align: center;
        padding: 14px 16px;
        margin-right: 2px;
        text-decoration: none;
        font-size: 17px;
        display: block;
        border: none;
    }

    h2
    {
        font-weight: 300;
        text-align: center;
        text-transform: uppercase;
    }

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

    .add form
    {
        padding: 10 60px;
    }

    .add form input
    {
        display: block;
        box-sizing: border-box;
        width: 100%;
        outline: none;
        height: 60px;
        line-height: 60px;
        border-radius: 4px;
    }

    input[type="name"],
    input[type="surname"],
    input[type="gender"],
    input[type="dob"]
    {
        width: 100%;
        padding: 0 0 0 10px;
        margin: 0;
        color: #8a8b8e;
        border: 1px solid #c2c0ca;
        font-style: normal;
        font-size: 16px;
        -webkit-appearance: none;
            -moz-appearance: none;
                appearance: none;
        position: relative;
        display: inline-block;
        background: none;
    }

    .add form input[type="submit"] 
    {
        border: none;
        display: block;
        background-color: #3ca9e2;
        color: #fff;
        font-weight: bold;
        text-transform: uppercase;
        cursor: pointer;
        -webkit-transition: all 0.2s ease;
        transition: all 0.2s ease;
        font-size: 18px;
        position: relative;
        display: inline-block;
        cursor: pointer;
        text-align: center;
        }

    .view
    {
        display: none;
        padding-left: 10%;
    }

    table
    {
        width: 80%;
        color: white;
    }

    table tr
    {
        background-color: #008148;
    }

    table td
    {
        font-size: 25px;
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