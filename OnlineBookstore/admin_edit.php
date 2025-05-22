<?php
	session_start();
	require_once "./functions/admin.php";
	$title = "Kitabı Düzenle";
	require_once "./template/header.php";
	require_once "./functions/database_functions.php";
	$conn = db_connect();

	if(isset($_GET['bookisbn'])){
		$book_isbn = $_GET['bookisbn'];
	} else {
		echo "Boş sorgu!";
		exit;
	}

	if(!isset($book_isbn)){
		echo "Boş isbn! Lütfen kontrol edin!";
		exit;
	}

	// get book data
	$query = "SELECT * FROM books WHERE book_isbn = '{$book_isbn}'";
	$result = mysqli_query($conn, $query);
	if(!$result){
		echo $err = "Veriler alınamıyor.";
		exit;
	}else{
		$row = mysqli_fetch_assoc($result);
	}
	if(isset($_POST['edit'])){
		$isbn = trim($_POST['isbn']);
		$data = "";
		foreach($_POST as $k => $v){
			if(!in_array($k, ['edit', 'isbn'])){
				if(!empty($data)) $data .=", ";
				$data .= "`{$k}` = '".(mysqli_real_escape_string($conn, $v))."'";
			}
		}

		$query = "UPDATE books set $data where book_isbn = '{$book_isbn}'";
		$result = mysqli_query($conn, $query);
		if($result){
			$_SESSION['book_success'] = "Kitap detayları başarıyla güncellendi.";
			header("Location: admin_book.php");
		} else {
			$err =  "Veriler güncellenemiyor. " . mysqli_error($conn);
		}
	}
?>
	<h4 class="fw-bolder text-center">Kitap Detaylarını Düzenle</h4>
	<center>
	<hr class="bg-danger" style="width:5em;height:3px;opacity:1">
	</center>
	<div class="row justify-content-center">
		<div class="col-lg-6 col-md-8 col-sm-10 col-xs-12">
			<div class="card rounded-0 shadow">
				<div class="card-body">
					<div class="container-fluid">
						<?php if(isset($err)): ?>
							<div class="alert alert-danger rounded-0">
								<?= $_SESSION['err_login'] ?>
							</div>
						<?php 
							endif;
						?>
						<form method="post" action="admin_edit.php?bookisbn=<?php echo $row['book_isbn'];?>" enctype="multipart/form-data">
								<div class="mb-3">
									<label class="control-label">ISBN</label>
									<input class="form-control rounded-0" type="text" name="isbn" value="<?php echo $row['book_isbn'];?>" readOnly="true">
								</div>
								<div class="mb-3">
									<label class="control-label">İsim</label>
									<input class="form-control rounded-0" type="text" name="book_title" value="<?php echo $row['book_title'];?>" required>
								</div>
								<div class="mb-3">
									<label class="control-label">Yazar</label>
									<input class="form-control rounded-0" type="text" name="book_author" value="<?php echo $row['book_author'];?>" required>
								</div>
								<div class="mb-3">
									<label class="control-label">Açıklama</label>
									<textarea class="form-control rounded-0" name="book_descr" cols="40" rows="5"><?php echo $row['book_descr'];?></textarea>
								</div>
								<div class="mb-3">
									<label class="control-label">Fiyat</label>
									<input class="form-control rounded-0" type="text" name="book_price" value="<?php echo $row['book_price'];?>" required>
								</div>
								<div class="mb-3">
									<label class="control-label">Kategori</label>
									<select class="form-select rounded-0"  name="categoryid" required>
										<?php 
										$psql = mysqli_query($conn, "SELECT * FROM `category` order by category_name asc");
										while($row = mysqli_fetch_assoc($psql)):
										?>
										<option value="<?= $row['categoryid'] ?>" <?= $row['categoryid']==$row['categoryid'] ? 'selected' : '' ?>><?= $row['category_name'] ?></option>
										<?php endwhile; ?>
									</select>

								</div>
								<div class="text-center">
									<button type="submit" name="edit"  class="btn btn-primary btn-sm rounded-0">Güncelle</button>
									<button type="reset" class="btn btn-default btn-sm rounded-0 border">İptal Et</button>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<?php
	if(isset($conn)) {mysqli_close($conn);}
	require "./template/footer.php"
?>