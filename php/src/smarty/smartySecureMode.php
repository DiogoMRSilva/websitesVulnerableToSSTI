<?php

    require 'smarty-3.1.30/libs/Smarty.class.php';

    $smarty = new Smarty;
    // enable default security
    $smarty->enableSecurity();
    //more security features can be added https://www.smarty.net/docs/en/advanced.features.tpl#advanced.features.security
    $smarty->debugging = false;
    $smarty->setTemplateDir('/tmp/smarty/templates');
    $smarty->setCompileDir('/tmp/smarty/templates_c');
    $smarty->setCacheDir('/tmp/smarty/cache');
    $smarty->setConfigDir('/tmp/smarty/configs');

    $name ="";
    if($_POST["name"]){
        $name =$_POST["name"];
    }

    $template_string = '<!DOCTYPE html><html>
                            <body>
                                <form action="" method="post">
                                    First name:<br>
                                    <input type="text" name="name" value="">
                                    <input type="submit" value="Submit">
                                </form>
                                <h2>Hello '.$name.'</h2>
                            </body>
                        </html>';

    try{
        $smarty->display('string:'.$template_string);
    }
    catch(Exception $e){
        echo "error: ".$e->getMessage();
        $smarty->display('<!DOCTYPE html><html>
                            <body>
                                <form action="" method="post">
                                    First name:<br>
                                    <input type="text" name="name" value="">
                                    <input type="submit" value="Submit">
                                </form>
                                <h2>Hello '.$name.'</h2>
                            </body>
                          </html>');
}
