<!DOCTYPE html><html>
    <body>
        <h2>Eval</h2>
        <form action="index.php" method="post">
            expression:<br>
            <input type="text" name="expression" value="1+1">
            <input type="submit" value="Submit">
        </form><br>

        <h2>Eval Double Quoted</h2>
        <form action="evalDoubleQuoted.php" method="post">
            expression:<br>
            <input type="text" name="expression" value="1+1">
            <input type="submit" value="Submit">
        </form><br>

        <h2>Eval Single Quoted</h2>
        <form action="evalSingleQuoted.php" method="post">
            expression:<br>
            <input type="text" name="expression" value="1+1">
            <input type="submit" value="Submit">
        </form><br>

        <h2>Eval injection middle code</h2>
        <form action="evalMiddleCode.php" method="post">
            expression:<br>
            <input type="text" name="expression" value="1+1">
            <input type="submit" value="Submit">
        </form><br>