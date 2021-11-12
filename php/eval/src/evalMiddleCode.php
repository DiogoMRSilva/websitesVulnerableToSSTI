<?php include 'header.php';?>

    <h1>
    <?php
        if (isset($_POST["expression"])){
            echo $_POST["expression"].' => '.eval('$x = '.$_POST["expression"].';return $x + 1;');
        }
    ?>
    </h1>
<?php include 'footer.php';?>
