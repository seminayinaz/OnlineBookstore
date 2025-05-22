<?php
	session_start();
	require_once "./functions/database_functions.php";
    $conn = db_connect();

	$title = "Registration";
	require "./template/header.php";

?>

<style>
	body{
		background-image: url("./bootstrap/img/library.jpg");
		height: 700px;
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
		position: relative;
	}
</style>

	<div class="row justify-content-center pt-5 mt-5">
		<div class="col-lg-5 col-md-8 col-sm-10 col-xs-12">
			<div class="card rounded-0 shadow">
				<div class="card-header">
					<div class="card-title h6 fw-bold text-center">KAYIT OL</div>
				</div>
				<div class="card-body container-fluid">
					<form method="post" action="purchase.php" class="form-horizontal">
						<?php if(isset($_SESSION['err']) && $_SESSION['err'] == 1){ ?>
							<p class="text-danger">Tüm alanların doldurulması zorunludur.</p>
							<?php } ?>
						<div class="mb-3">
							<label for="name" class="control-label">Ad Soyad</label>
							<input type="text" name="name" class="form-control rounded-0">
						</div>
						<div class="mb-3">
							<label for="address" class="control-label">Adres</label>
							<input type="text" name="address" class="form-control rounded-0">
						</div>
						<div class="mb-3">
							<label for="city" class="control-label">Şehir</label>
							<input type="text" name="city" class="form-control rounded-0">
						</div>
						<div class="mb-3">
							<label for="zip_code" class="control-label">Posta kodu</label>
							<input type="text" name="zip_code" class="form-control rounded-0">
						</div>
						<div class="mb-3">
							<label for="country" class="control-label">Ülke</label>
							<input type="text" name="country" class="form-control rounded-0">
						</div>
						<div class="mb-3 d-grid">
							<input type="submit" name="submit" value="Kayıt Ol" class="btn btn-primary rounded-0">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	
<?php
	if(isset($conn)){ mysqli_close($conn); }
	require_once "./template/footer.php";
?>