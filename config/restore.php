<?php
	session_start();

	//include our function
	include 'function.php';

	if(isset($_POST['restore'])){
		
		//get post data
		$server = 'localhost';
		$username = 'root';
		$password = '';
		$dbname = 'dbsistema';

		$link = mysqli_connect($server, $username, $password);

			if (!mysqli_select_db($link, $dbname)) {

			mysqli_query($link, "CREATE DATABASE `dbsistema`");

	    	}else {

			echo "Database NO SE PUDO CREAR";

			}
		//moving the uploaded sql file
		$filename = $_FILES['sql']['name'];
		move_uploaded_file($_FILES['sql']['tmp_name'],'respaldos/' . $filename);
		$file_location = 'respaldos/' . $filename;

		//restore database using our function
		$restore = restore($server, $username, $password, $dbname, $file_location);

		if($restore['error']){
			$_SESSION['error'] = $restore['message'];
		}
		else{
			$_SESSION['success'] = $restore['message'];
		}
	}
	else{
		$_SESSION['error'] = 'Completa las credenciales de la base de datos primero';
	}

	header('location:../vistas/base.php');

?>