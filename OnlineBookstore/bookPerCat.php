<?php
	session_start();
	require_once "./functions/database_functions.php";
	// get pubid
	if(isset($_GET['catid'])){
		$catid = $_GET['catid'];
	} else {
		echo "Yanlış sorgu! Lütfen kontrol edin.";
		exit;
	}

	$conn = db_connect();
	$catName = getCategoryName($conn, $catid);

	$query = "SELECT book_isbn, book_title, book_image, book_descr FROM books WHERE categoryid = '$catid'";
	$result = mysqli_query($conn, $query);
	if(!$result){
		echo "Veriler alınamıyor" . mysqli_error($conn);
		exit;
	}
	if(mysqli_num_rows($result) == 0){
		echo "Boş kitaplar! Lütfen yeni kitaplar gelene kadar bekleyin!";
		exit;
	}

	$title = "Aynı Kategorideki Kitaplar";
	require "./template/header.php";
?>
<style>
	.book-item .img-holder {
		height: 20em;
	}
</style>

	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="category_list.php" class="text-decoration-none text-muted fw-light">Kategoriler</a></li>
			<li class="breadcrumb-item active" aria-current="page"><?php echo $catName; ?></li>
		</ol>
	</nav>
	<div id="catBooks">
	<?php while($row = mysqli_fetch_assoc($result)){
?>
	<div class="row  mb-4">
		<div class="col-md-3 text-center">
			<div class="img-holder overflow-hidden">
				<img class="img-top" src="./bootstrap/img/<?php echo $row['book_image'];?>">
			</div>
		</div>
		<div class="col-md-9">
			<h4><?php echo $row['book_title'];?></h4>
			<hr>
			<p class="truncate-5"><?= $row['book_descr'] ?></p>
			<a href="book.php?bookisbn=<?php echo $row['book_isbn'];?>" class="btn btn-primary">Detayları Gör</a>
		</div>
	</div>
<?php
	}
?>
</div>
<?php
	if(isset($conn)) { mysqli_close($conn);}
	require "./template/footer.php";
?>