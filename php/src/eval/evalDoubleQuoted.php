<?php include 'header.php';?>

    <h1>
    <?php
        if (isset($_POST["expression"])){
            echo $_POST["expression"].' => '.eval('return "'.$_POST["expression"].'";');
        }
    ?>
    </h1>
<?php include 'footer.php';?>