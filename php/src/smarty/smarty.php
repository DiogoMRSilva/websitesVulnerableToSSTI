<?php

require 'smarty-3.1.30/libs/Smarty.class.php';

$smarty = new Smarty;
$smarty->debugging = false;
$smarty->setTemplateDir('/tmp/smarty/templates');
$smarty->setCompileDir('/tmp/smarty/templates_c');
$smarty->setCacheDir('/tmp/smarty/cache');
$smarty->setConfigDir('/tmp/smarty/configs');

$smarty->assign('foo','value');
$name ="";
if($_POST["name"]){
    $name =$_POST["name"];
}
$template_string = '<!DOCTYPE html><html><body>
    <form action="" method="post">
        First name:<br>
    <input type="text" name="name" value="">
    <input type="submit" value="Submit">
    </form><h2>Hello'.$name.'</h2></body></html>';
$smarty->display('string:'.$template_string); 

