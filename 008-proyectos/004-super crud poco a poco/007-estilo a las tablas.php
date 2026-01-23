<style>
  nav{
  	display:flex;
    gap:10px;
    margin-bottom:20px;
    display:flex;
    justify-content:center;
    background-color:#f8f9fa;
  }
  nav a{
    padding:10px 15px;
    background-color:#007bff;
    color:white;
    text-decoration:none;
    border-radius:5px;
  }
  nav a:hover{
  	background-color:#0056b3;
  }
  table{
  	width:100%;
    border-collapse:collapse;
    margin-top:20px;
    box-shadow:0 2px 5px rgba(0,0,0,0.1);
  }
  table td{
  	border:1px solid #ddd;
    padding:8px;
    text-align:left;
  }
</style>
<?php
	// Primero me conecto a la base de datos
  // Esto es común para todo el archivo
    $host = "localhost";
    $user = "tiendaonlinedamdaw";
    $pass = "Tiendaonlinedamdaw123$";
    $db   = "tiendaonlinedamdaw";

    $conexion = new mysqli($host, $user, $pass, $db);
?>

<nav>
<?php
	// Ahora lo que quiero es un listado de las tablas en la base de datos
    $resultado = $conexion->query("
      SHOW TABLES;
    ");
    while ($fila = $resultado->fetch_assoc()) {
			echo '<a href="?tabla='.$fila['Tables_in_'.$db].'">'.$fila['Tables_in_'.$db].'</a>';
    }
?>
</nav>
<main>
  <table>
  <?php
	// Y ahora creo los registros de la tabla
    $resultado = $conexion->query("
      SELECT * FROM ".$_GET['tabla'].";
    ");
    while ($fila = $resultado->fetch_assoc()) {
      echo "<tr>";
      foreach($fila as $clave=>$valor){
        echo "<td>".$valor."</td>";
      }
      echo "</tr>";
     }
  ?>
  </table>
</main>