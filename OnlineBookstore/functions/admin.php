<?php
	if(!isset($_SESSION['admin']) && $_SESSION['admin'] != true){
		$_SESSION['err_login'] = "Lütfen önce giriş yapın";
		header("Location: admin.php");
	}
?>