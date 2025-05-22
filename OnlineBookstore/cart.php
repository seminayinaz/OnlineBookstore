<?php
	session_start();
	require_once "./functions/database_functions.php";
	require_once "./functions/cart_functions.php";

	if(isset($_POST['bookisbn'])){
		$book_isbn = $_POST['bookisbn'];
	}

	if(isset($book_isbn)){
		if(!isset($_SESSION['cart'])){
			$_SESSION['cart'] = array();
			$_SESSION['total_items'] = 0;
			$_SESSION['total_price'] = '0.00';
		}

		if(!isset($_SESSION['cart'][$book_isbn])){
			$_SESSION['cart'][$book_isbn] = 1;
		} elseif(isset($_POST['cart'])){
			$_SESSION['cart'][$book_isbn]++;
			unset($_POST);
		}
	}

	// Değişikliği kaydet butonuna tıklanırsa her bookisbn'nin miktarı değiştirilir.
	if(isset($_POST['save_change'])){
		foreach($_SESSION['cart'] as $isbn =>$qty){
			if($_POST[$isbn] == '0'){
				unset($_SESSION['cart']["$isbn"]);
			} else {
				$_SESSION['cart']["$isbn"] = $_POST["$isbn"];
			}
		}
	}

	$title = "Sepetiniz";
	require "./template/header.php";
?>
	<h4 class="fw-bolder text-center">Sepetim</h4>
      <center class="pb-3">
        <hr class="bg-danger" style="width:5em;height:3px;opacity:1">
      </center>
<?php
	if(isset($_SESSION['cart']) && (array_count_values($_SESSION['cart']))){
		$_SESSION['total_price'] = total_price($_SESSION['cart']);
		$_SESSION['total_items'] = total_items($_SESSION['cart']);
?>
	<div class="card rounded-0 shadow">
		<div class="card-body">
			<div class="container-fluid">
				<form action="cart.php" method="post" id="cart-form">
					<table class="table">
						<tr class="table-active">
							<th>Kitap</th>
							<th>Fiyat</th>
							<th>Miktar</th>
							<th>Toplam</th>
						</tr>
						<?php
							foreach($_SESSION['cart'] as $isbn => $qty){
								$conn = db_connect();
								$book = mysqli_fetch_assoc(getBookByIsbn($conn, $isbn));
						?>
						<tr>
							<td><?php echo $book['book_title'] . " - " . $book['book_author']; ?></td>
							<td><?php echo $book['book_price'] . " TL" ?></td>
							<td><input type="text" value="<?php echo $qty; ?>" size="2" name="<?php echo $isbn; ?>"></td>
							<td><?php echo $qty * $book['book_price'] . " TL" ?></td>
						</tr>
						<?php } ?>
						<tr>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
							<th><?php echo $_SESSION['total_items']; ?></th>
							<th><?php echo $_SESSION['total_price'] . " TL" ?></th>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="card-footer text-end">
			<input type="submit" class="btn btn-dark rounded-0" name="save_change" value="Değişiklikleri Kaydet" form="cart-form">
			<a href="registration.php" class="btn btn-dark rounded-0">Sipariş Ver</a> 
		</div>
	</div>
	
<?php
	} else {
		?>
<div class="alert alert-warning rounded-0">Sepetiniz boş! Lütfen önce satın almak için en az 1 kitap ekleyin.</div>
<?php

	}
	if(isset($conn)){ mysqli_close($conn); }
	require_once "./template/footer.php";
?>