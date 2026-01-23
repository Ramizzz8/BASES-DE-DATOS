<?php
//imaginemos que la codificacion de la CONTRASEÑA VIENE DE LA BASE DE DATOS O FORMULARIO
    $hash1 = "f688ae26e9cfa3ba6235477831d5122e";
    $contrasena = $_POST['contrasena'];
    $hash2 = md5($contrasena);
    if($hash1 == $hash2){
        echo "La contraseña es correcta";
    }else{
        echo "La contraseña es incorrecta";
    }
?>

<form method="post" action="?">
    Introduce el texto para comprobar su hash sha1:
    <input type="text" name="texto">
    <input type="submit" value="Comprobar">