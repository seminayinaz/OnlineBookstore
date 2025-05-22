<?php
	session_start();
	if(!isset($_POST['submit'])){
		echo "Bir şey yanlış! Tekrar kontrol et!";
		exit;
	}
	require_once "./functions/database_functions.php";
	$conn = db_connect();

	$name = trim($_POST['name']);
	$pass = trim($_POST['pass']);

	if($name == "" || $pass == ""){
		echo "Ad veya Şifre boş!";
		exit;
	}

	$name = mysqli_real_escape_string($conn, $name);
	$pass = mysqli_real_escape_string($conn, $pass);
	$pass = sha1($pass);

	$query = "SELECT `name`, `pass` from `admin` where `name` = '{$name}' and `pass` ='{$pass}'";
	$result = mysqli_query($conn, $query);
	if($result->num_rows <= 0){
		$_SESSION['err_login'] = "Yanlış kullanıcı adı ya da parola";
		header("Location: admin.php");
		exit;
	}
	if(isset($conn)) {mysqli_close($conn);}
	$_SESSION['admin'] = true;
	header("Location: admin_book.php");
?>