<?php
session_start();
if(isset($_SESSION['admin']) && $_SESSION['admin'] == true){
	header('location:admin_book.php');
}
	$title = "Admin Panel";
	require_once "./template/header.php";
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

<div class="row justify-content-center pt-5 my-5">
	<div class="col-lg-4 col-md-6 col-sm-10 col-xs-12 mt-5">
		<div class="card rounded-0 shadow mt-5">
			<div class="card-header">
				<div class="card-title text-center h4 fw-bolder">Giriş Yap</div>
			</div>
			<div class="card-body">
				<div class="container-fluid">
					<?php if(isset($_SESSION['err_login'])): ?>
						<div class="alert alert-danger rounded-0">
							<?= $_SESSION['err_login'] ?>
						</div>
					<?php 
						unset($_SESSION['err_login']);
						endif;
					?>
					<form class="form-horizontal" method="post" action="admin_verify.php">
						<div class="mb-3">
							<label for="name" class="control-label ">Kullanıcı Adı</label>
							<input type="text" name="name" class="form-control rounded-0">
						</div>
						<div class="mb-3">
							<label for="pass" class="control-label ">Parola</label>
							<input type="password" name="pass" class="form-control rounded-0">
						</div>
						<div class="mb-3 d-grid">
							<input type="submit" name="submit" class="btn btn-primary rounded-0">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
	
<?php
	require_once "./template/footer.php";
?>