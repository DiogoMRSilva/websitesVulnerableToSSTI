<?php

    require_once 'vendor/autoload.php';

    $name = "";
    if (isset($_POST["name"])){
        $name = $_POST["name"];
    }

    $t='<!DOCTYPE html>
            <html>
                <body>
                    <form action="" method="post">
                        First name:<br>
                        <input type="text" name="name" value="">
                        <input type="submit" value="Submit">
                    </form>
                    <h2>Hello '.$name.'</h2>
                </body>
            </html>';


    $loader = new Twig_Loader_Array(array('index' => $t,));
    $twig = new Twig_Environment($loader);

    try{
        echo $twig->render('index', array('name' => 'Fabien'));
    }

    catch(Exception $e){
        echo '<!DOCTYPE html>
            <html>
                <body>
                    <form action="" method="post">
                        First name:<br>
                        <input type="text" name="name" value="">
                        <input type="submit" value="Submit">
                    </form>
                    <h2>Hello '.$e->getMessage().'</h2>
                </body>
            </html>';
    }





