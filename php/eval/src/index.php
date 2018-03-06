<!DOCTYPE html><html>
    <body>
        <h1>Online Calculator</h1>
        <form action="/" method="post">
            expression:<br>
            <input type="text" name="expression" value="">
            <input type="submit" value="Submit">
        </form>
        <h2>

        <?php
            if (isset($_POST["expression"])){
                echo $_POST["expression"].' = '.eval("return ".$_POST["expression"].";");
            }
        ?>

        </h2>
    </body>
</html>