
<?php

//Ejemplo curso PHP aprenderaprogramar.com

$link = mysqli_connect("localhost", "root", "");

mysqli_select_db($link, "dbsistema");

mysqli_query($link, "DROP DATABASE `dbsistema`");

mysqli_close($link);

// Cerramos la conexion con la base de datos

echo '<script language="javascript">alert("se ha ejecutado correctamente");

location.replace("../vistas/base.php");</script>';

?>