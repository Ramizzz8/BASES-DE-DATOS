<?php
	function codificaRomana($cadena){
  	for($i = 0;$i<strlen($cadena);$i++){
    	$cadena[$i] = chr(ord($cadena[$i])+10);
    }
    return $cadena;
  }
  function decodificaRomana($cadena){
  	for($i = 0;$i<strlen($cadena);$i++){
    	$cadena[$i] = chr(ord($cadena[$i])-10);
    }
    return $cadena;
  }

  $original = "Mensaje secreto de Elorange12";
  
  echo codificaRomana($original);
  echo "<br>";
  echo decodificaRomana(codificaRomana($original));
  echo "<br>";
  echo codificaRomana($original);
?>