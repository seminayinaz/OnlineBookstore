<?php
  session_start();
  $book_isbn = $_GET['bookisbn'];
  // connecto database
  require_once "./functions/database_functions.php";
  $conn = db_connect();

  $query = "SELECT * FROM books WHERE book_isbn = '$book_isbn'";
  $result = mysqli_query($conn, $query);
  if(!$result){
    echo "Veriler alınamıyor." . mysqli_error($conn);
    exit;
  }

  $row = mysqli_fetch_assoc($result);
  if(!$row){
    echo "Boş kitap!";
    exit;
  }

  $title = $row['book_title'];
  require "./template/header.php";
?>

      <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="books.php" class="text-decoration-none text-muted fw-light">Kitaplar</a></li>
          <li class="breadcrumb-item active" aria-current="page"><?php echo $row['book_title']; ?></li>
        </ol>
      </nav>
      <div class="row">
        <div class="col-md-3 text-center ">
          <div class="img-holder overflow-hidden">
            <img class="img-top" src="./bootstrap/img/<?php echo $row['book_image']; ?>">
          </div>
        </div>
        <div class="col-md-9">
          <div class="card rounded-0 shadow">
            <div class="card-body">
              <div class="container-fluid">
                <h4><?= $row['book_title'] ?></h4>
                <hr>
                  <p><?php echo $row['book_descr']; ?></p>
                  <h4>Detaylar</h4><hr>
                  <p>ISBN: <?php echo $row['book_isbn']; ?></p>
                  <p>Yazar: <?php echo $row['book_author']; ?></p>
                  <p>Fiyat: <?php echo $row['book_price']; ?></p>
                  <p>Kategori: <?php echo getCategoryName($conn, $row['categoryid']); ?></p>
                    <?php 
                      if(isset($conn)) {mysqli_close($conn); }
                    ?>

                  <form method="post" action="cart.php">
                    <input type="hidden" name="bookisbn" value="<?php echo $book_isbn;?>">
                    <div class="text-center">
                      <input type="submit" value="Sepete Ekle" name="cart" class="btn btn-primary rounded-0">
                    </div>
                  </form>
              </div>
            </div>
          </div>
       	</div>
      </div>
<?php
  require "./template/footer.php";
?>