<?php
	session_start();
	require_once "./functions/database_functions.php";
	$conn = db_connect();

	$query = "SELECT * FROM category ORDER BY categoryid";
	$result = mysqli_query($conn, $query);
	if(!$result){
		echo "Veriler alınamıyor." . mysqli_error($conn);
		exit;
	}
	if(mysqli_num_rows($result) == 0){
		echo "Boş kategori ! Lütfen tekrar kontrol edin.";
		exit;
	}

	$title = "Kategoriler";
	require "./template/header.php";
?>

	<div class="book-img container-fluid">
        <img src="./bootstrap/img/20230102-kitap.jpg" style="width:100%; height:300px; "><br>
        <hr>
    </div>
	<div class="h5 fw-bolder text-center">Kategoriler</div>
	<center>
        <hr class="bg-danger" style="width:5em;height:3px;opacity:1">
    </center>
	<div class="list-group">
		<a class="list-group-item list-group-item-action py-3 fw-bolder" href="books.php">Tüm Kitaplar</a>

	<?php 
		while($row = mysqli_fetch_assoc($result)){
			$query = "SELECT categoryid FROM books";
			$result2 = mysqli_query($conn, $query);
			if(!$result2){
				echo "Can't retrieve data " . mysqli_error($conn);
				exit;
			}
			while ($catInBook = mysqli_fetch_assoc($result2)){
				if($catInBook['categoryid'] == $row['categoryid']){
				}
			}
	?>
		<a class="list-group-item list-group-item-action py-3 fw-bolder" href="bookPerCat.php?catid=<?php echo $row['categoryid']; ?>">
			<?php echo $row['category_name']; ?>
		</a>
	<?php } ?>
	</div>
<?php
	mysqli_close($conn);
	require "./template/footer.php";
?>