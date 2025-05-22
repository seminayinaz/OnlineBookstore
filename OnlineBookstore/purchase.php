<?php
	session_start();
	$_SESSION['err'] = 1;
	foreach($_POST as $key => $value){
		if(trim($value) == ''){
			$_SESSION['err'] = 0;
		}
		break;
	}

	if($_SESSION['err'] == 0){
		header("Location: registration.php");
	} else {
		unset($_SESSION['err']);
	}


	$_SESSION['ship'] = array();
	foreach($_POST as $key => $value){
		if($key != "submit"){
			$_SESSION['ship'][$key] = $value;
		}
	}
	require_once "./functions/database_functions.php";
	$title = "Purchase";
	require "./template/header.php";
	?>
	<h4 class="fw-bolder text-center">Ödeme</h4>
      <center>
        <hr class="bg-danger" style="width:5em;height:3px;opacity:1">
      </center>
<?php
	if(isset($_SESSION['cart']) && (array_count_values($_SESSION['cart']))){
?>
	<div class="card rounded-0 shadow mb-3">
		<div class="card-body">
			<div class="container-fluid">
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
						<td><?php echo $qty; ?></td>
						<td><?php echo $qty * $book['book_price'] . " TL" ?></td>
					</tr>
					<?php } ?>
					<tr>
						<th>&nbsp;</th>
						<th>&nbsp;</th>
						<th><?php echo $_SESSION['total_items']; ?></th>
						<th><?php echo $_SESSION['total_price'] . " TL" ?></th>
					</tr>
					<tr>
						<td>Kargo</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>20.00 TL</td>
					</tr>
					<tr>
						<th>Kargo Dahil Toplam</th>
						<th>&nbsp;</th>
						<th>&nbsp;</th>
						<th><?php echo ($_SESSION['total_price'] + 20) . " TL" ?></th>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="row justify-content-center">
		<div class="col-lg-5 col-md-8 col-sm-10 col-xs-12">
			<div class="card rounded-0 shadow">
				<div class="card-header">
					<div class="card-title h6 fw-bold">Lütfen kart bilgilerini girin.</div>
				</div>
				<div class="card-body">
					<div class="container-fluid">
						<form method="post" action="process.php" class="form-horizontal">
							<?php if(isset($_SESSION['err']) && $_SESSION['err'] == 1){ ?>
							<p class="text-danger">Tüm alanların doldurulması zorunludur.</p>
							<?php } ?>
							<div class="form-group mb-3">
								<label for="card_number" class="control-label">Kart Numarası</label>
								<input type="text" class="form-control rounded-0" name="card_number">
							</div>
							<div class="form-group mb-3">
								<label for="card_expire" class="control-label">Son kullanma tarihi</label>
								<input type="date" name="card_expire" class="form-control rounded-0">
							</div>
							<div class="form-group mb-3">
								<label for="card_owner" class="control-label">Kart Sahibi</label>
								<input type="text" class="form-control rounded-0" name="card_owner">
							</div>
							<div class="form-group mb-3">
								<div class="d-grid gap-2">
									<button type="submit" class="btn btn-primary rounded-0">Satın Al</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<?php
	} else {
		echo "<p class=\"text-warning\">Sepetiniz boş! Lütfen içine birkaç kitap eklediğinizden emin olun!</p>";
	}
	if(isset($conn)){ mysqli_close($conn); }
	require_once "./template/footer.php";
?>