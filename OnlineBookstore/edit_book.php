<?php	
	if(!isset($_POST['save_change'])){
		echo "Something wrong!";
		exit;
	}

	$isbn = trim($_POST['isbn']);
	$title = trim($_POST['title']);
	$author = trim($_POST['author']);
	$descr = trim($_POST['descr']);
	$price = floatval(trim($_POST['price']));
	$category = trim($_POST['category']);

	if(isset($_FILES['image']) && $_FILES['image']['name'] != ""){
		$image = $_FILES['image']['name'];
		$directory_self = str_replace(basename($_SERVER['PHP_SELF']), '', $_SERVER['PHP_SELF']);
		$uploadDirectory = $_SERVER['DOCUMENT_ROOT'] . $directory_self . "bootstrap/img/";
		$uploadDirectory .= $image;
		move_uploaded_file($_FILES['image']['tmp_name'], $uploadDirectory);
	}

	require_once("./functions/database_functions.php");
	$conn = db_connect();

    // Kategori veritanbanında değilse yeni oluştur.
	$findPub = "SELECT * FROM category WHERE category_name = '$category'";
	$findResult = mysqli_query($conn, $findPub);
	if(!$findResult){
		// Kategori tablosuna ekle ve id'yi döndür
		$insertPub = "INSERT INTO category(category_name) VALUES ('$category')";
		$insertResult = mysqli_query($conn, $insertPub);
		if(!$insertResult){
			echo "Yeni kategori eklenemiyor." . mysqli_error($conn);
			exit;
		}
	}

	$query = "UPDATE books SET  
	book_title = '$title', 
	book_author = '$author', 
	book_descr = '$descr', 
	book_price = '$price'";
	if(isset($image)){
		$query .= ", book_image='$image' WHERE book_isbn = '$isbn'";
	} else {
		$query .= " WHERE book_isbn = '$isbn'";
	}
	
	$result = mysqli_query($conn, $query);
	if(!$result){
		echo "Can't update data " . mysqli_error($conn);
		exit;
	} else {
		header("Location: admin_edit.php?bookisbn=$isbn");
	}
?>